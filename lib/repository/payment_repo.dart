import 'dart:async';
import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:razorpay_web/razorpay_web.dart';
import 'package:padelrush/globals/api_endpoints.dart';
import 'package:padelrush/managers/api_manager.dart';
import 'package:padelrush/managers/user_manager.dart';
import 'package:padelrush/models/coupon_model.dart';
import 'package:padelrush/models/payment_methods.dart';
import 'package:padelrush/utils/custom_extensions.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../globals/constants.dart';
import '../models/multi_booking_model.dart';

part 'payment_repo.g.dart';

enum PaymentProcessRequestType {
  join,
  reserved,
  courtBooking,
  membership;

  String get value {
    switch (this) {
      case join:
        return "Join";
      case reserved:
        return "Reserved";
      case courtBooking:
        return "Court Booking";
      case membership:
        return "Membership";
    }
  }
}

enum PaymentDetailsRequestType {
  booking,
  lesson,
  membership,
  join;

  String get value {
    switch (this) {
      case join:
        return "Join";
      case lesson:
        return "Lesson";
      case booking:
        return "Booking";
      case membership:
        return "Membership";
    }
  }
}

class PaymentRepo {
  Future<PaymentDetails> fetchPaymentDetails(
      int locationID,
      Ref ref,
      PaymentDetailsRequestType type,
      int id,
      DateTime? startDate,
      bool isOpenMatch,
      int? duration,
      {int? courtId,int? variantId}) async {
    try {
      final token = ref.read(userManagerProvider).user?.accessToken ?? "";
      final Map<String, dynamic> queryParams = {
        "booking_type": type.value,
        "booking_id": id,
        "is_open_match": isOpenMatch
      };

      if (courtId != null) {
        queryParams["court_id"] = courtId;
      }

      if (variantId != null) {
        queryParams["variant_id"] = variantId;
      }

      if (startDate != null && duration != null) {
        final startTime = startDate.format("HH:mm:ss");
        final endTime =
            startDate.add(Duration(minutes: duration)).format("HH:mm:ss");
        final date = startDate.format(kFormatForAPI);

        queryParams["start_time"] = startTime;
        queryParams["end_time"] = endTime == "00:00:00" ? "24:00:00" : endTime;
        queryParams["date"] = date;
      }

      final response = await ref.read(apiManagerProvider).get(
        ref,
        isV2Version: true,
        ApiEndPoint.paymentDetails,
        token: token,
        queryParams: queryParams,
        pathParams: [locationID.toString()],
      );
      return PaymentDetails.fromJson(response['data']);
    } catch (e) {
      if (e is Map<String, dynamic>) {
        throw e['message'];
      }
      rethrow;
    }
  }

  Future<(int, double?)> paymentProcess(
    Ref ref, {
    required PaymentProcessRequestType requestType,
    bool? payLater,
    List<AppPaymentMethods>? paymentMethod,
    double? totalAmount,
    required bool pendingPayment,
    int? serviceID,
    int? locationID,
    bool isJoiningApproval = false,
    bool bookingToOpenMatch = false,
    bool purchaseMembership = false,
    int? couponID,
  }) async {
    try {
      final bool isRazorPayment =
          paymentMethod?.any((method) => method.methodType == kRazorPayMethod) ??
              false;
      final bool isNativePayment = paymentMethod?.any((method) =>
              method.methodType == kApplePayMethod ||
              method.methodType == kGooglePayMethod) ??
          false;


      final token = ref.read(userManagerProvider).user?.accessToken;
      final Map<String, dynamic> data = {
        'total_amount': totalAmount,
        if (payLater == true) 'pay_on_arrival': true,
        if (couponID != null) 'coupon_id': couponID,
      };

      // Validate payment methods
      if (payLater == true && paymentMethod != null) {
        throw 'Cannot use pay later with other payment methods';
      }
      if (payLater != true && paymentMethod?.isNotEmpty == true) {
        data['payments'] =
            paymentMethod!.map((method) => method.toJsonForProcess()).toList();
        if ((bookingToOpenMatch || purchaseMembership) &&
            data['payments'].isNotEmpty) {
          data['payments'] = data['payments'].first;
        }
      }

      // Prepare query parameters
      final Map<String, dynamic> queryParams = {
        if (requestType != PaymentProcessRequestType.courtBooking) ...{
          'request_type': requestType.value,
          'service_booking_id': serviceID,
          'pending_payment' : pendingPayment,
          if (isJoiningApproval) 'joninning_approval': isJoiningApproval,
        }
      };

      // Perform the API request
      myPrint("Payment Process Data: $data");
      myPrint("Payment Process Query Params: $queryParams");
      final response = purchaseMembership
          ? await ref.read(apiManagerProvider).post(
              ref, ApiEndPoint.membershipPurchase, data,
              token: token,
              pathParams: [serviceID.toString(), locationID.toString()])
          : await ref.read(apiManagerProvider).post(
                ref,
                ApiEndPoint.paymentsProcess,
                data,
                token: token,
                queryParams: queryParams,
                pathParams: [bookingToOpenMatch.toString()],
                isV2Version: bookingToOpenMatch ? false : true,
              );

      if (isRazorPayment) {
        return await _handleRazorPayment(
            ref, response, false, purchaseMembership, paymentMethod) as (
          int,
          double?
        );
      } else {
        if (bookingToOpenMatch) {
          return (0, null);
        }
        ;
        return _extractServiceBookingID(response);
      }
    } catch (e) {
      _handlePaymentError(e);
      rethrow;
    }
  }

// Helper method to handle Razorpay payment
  Future<(dynamic, double?)> _handleRazorPayment(
    Ref ref,
    dynamic response,
    bool isCart,
    bool isMembership,
    List<AppPaymentMethods>? paymentMethod,
  ) async {
    // Create a completer that will complete when a payment event occurs.
    final Completer<Map<String, dynamic>> completer = Completer();

    final rdata = response['data']['gatewayUrl'];
    final orderId = rdata['transaction_id'].toString();

    Razorpay razorpay = Razorpay();

    Map prefill = {};
    final currentUserNumber =
        ref.read(userManagerProvider).user?.user?.phoneNumber;
    final currentUserEmail = ref.read(userManagerProvider).user?.user?.email;

    if (currentUserNumber != null) {
      prefill["contact"] = currentUserNumber;
    }
    if (currentUserEmail != null) {
      prefill["email"] = currentUserEmail;
    }

    // Payment options
    var options = {
      'key': kRazorPayKey,
      'prefill': prefill,
      'retry': {
        'enabled': false,
        'max_count': 0,
      },
      'order_id': orderId,
      'currency': currency,
    };

    // Payment success event callback
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS,
        (PaymentSuccessResponse response) {
      if (!completer.isCompleted) {
        completer.complete({
          'status': 'success',
          'data': response,
        });
      }
    });

    // Payment error event callback
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR,
        (PaymentFailureResponse response) {
      myPrint("------------ Razor Pay Error ${response.error}");
      if (!completer.isCompleted) {
        completer.complete({
          'status': 'error',
          'error': response.message,
        });
      }
    });

    // External wallet selected event callback
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET,
        (ExternalWalletResponse response) {
      if (!completer.isCompleted) {
        completer.complete({
          'status': 'external_wallet',
          'wallet': response.walletName,
        });
      }
    });

    // Open the Razorpay payment interface.
    razorpay.open(options);

    final value = await completer.future;

    if (value["status"] == "success") {
      await Future.delayed(Duration(seconds: 5));
      return _fetchServiceIDFromChargeID(ref,
          chargeID: orderId, isCart: isCart, isMembership: isMembership);
    } else if (value["status"] == "error") {
      throw value["error"] ?? "SOMETHING_WENT_WRONG";
    }
    throw "SOMETHING_WENT_WRONG";
  }

// Helper method to extract service booking ID
  (int, double?) _extractServiceBookingID(dynamic response) {
    final int id = response['data']['service']['serviceBookings'][0]['id'];
    double? amount;
    if (response['data']['service']['serviceBookings'][0]["players"] is List) {
      amount = response['data']['service']['serviceBookings'][0]["players"]
          .fold(
              0,
              (previousValue, element) =>
                  (double.parse((previousValue ?? 0).toString())) +
                  (element["paid_price"] ?? 0));
    }
    return (id, amount);
  }

// Error handling helper
  void _handlePaymentError(dynamic error) {
    if (error is Map<String, dynamic>) {
      throw error['message'];
    }
  }

  Future<(dynamic, double?)> _fetchServiceIDFromChargeID(Ref ref,
      {required String chargeID,
      required bool isCart,
      required bool isMembership}) async {
    final token = ref.read(userManagerProvider).user?.accessToken;
    if (token == null) {
      throw Exception('No access token available');
    }
    // Compute deadline 15 seconds from now.
    final deadline = DateTime.now().add(const Duration(seconds: 17));
    // Initial wait
    await Future.delayed(const Duration(seconds: 4));
    final query = {
      'order_id': chargeID,
      'status_code': 200,
      'transaction_status': 'succeeded'
    };
    if (isCart) {
      query["request_type"] = "CART";
    }

    if (isMembership) {
      return (0, null);
      // query["request_type"] = "MEMBERSHIP";
    }

    // Polling loop
    while (DateTime.now().isBefore(deadline)) {
      try {
        final response = await ref.read(apiManagerProvider).get(
              ref,
              ApiEndPoint.transaction,
              token: token,
              queryParams: query,
            );

        final dynamic value = isCart
            ? response['data']
            : (response['data']['service']['id'] ?? 0);
        return (value, null);
        // Otherwise, wait before retrying
      } catch (e) {
        // If the API itself returns an error payload, propagate it
        if (e is Map<String, dynamic> && e.containsKey('message')) {
          if (e['message'] != "Transaction not found") {
            throw e['message'];
          }
        }
        // rethrow;
      }
      // Wait 2 seconds between polls
      await Future.delayed(const Duration(seconds: 3));
    }
    // If we reach here, we've timed out
    throw "Transaction not found";
  }

  Future<CouponModel> verifyCoupon(Ref ref, String coupon, double price) async {
    try {
      final token = ref.read(userManagerProvider).user?.accessToken ?? "";
      final response = await ref.read(apiManagerProvider).post(
            ref,
            ApiEndPoint.couponsVerify,
            {'coupon_name': coupon, 'price': price},
            token: token,
          );
      return CouponModel.fromJson(response['data']);
    } catch (e) {
      if (e is Map<String, dynamic>) {
        throw e['message'];
      }
      rethrow;
    }
  }

  Future<(List<MultipleBookings>?, String?)> multiBookingPaymentProcess(Ref ref,
      {required PaymentProcessRequestType requestType,
      bool? payLater,
      AppPaymentMethods? paymentMethod,
      double? totalAmount,
      int? serviceID,
      bool isJoiningApproval = false,
      int? couponID}) async {
    try {
      final token = ref.read(userManagerProvider).user?.accessToken ?? "";
      final Map<String, dynamic> data = {};

      data['total_amount'] = totalAmount;
      if (payLater == true && paymentMethod != null) {
        throw 'Can not use pay later with other payment methods';
      }
      final bool isRazorPayment = (paymentMethod?.methodType == kRazorPayMethod);
      if (payLater == true) {
        data['pay_on_arrival'] = true;
      } else if (paymentMethod != null) {
        data["payments"] = paymentMethod.toJsonForProcess();
      }
      if (couponID != null) {
        data['coupon_id'] = couponID;
      }
      final Map<String, dynamic> queryParams = {};
      if (requestType != PaymentProcessRequestType.courtBooking) {
        queryParams['request_type'] = requestType.value;
        queryParams['service_booking_id'] = serviceID;
        if (isJoiningApproval) {
          queryParams['joninning_approval'] = isJoiningApproval;
        }
      }

      final response = await ref.read(apiManagerProvider).post(
            ref,
            ApiEndPoint.multiBookingPaymentsProcess,
            data,
            token: token,
            queryParams: queryParams,
          );
      if (isRazorPayment) {
        final temp = await _handleRazorPayment(
            ref, response, true, false, [paymentMethod!]);
        final (value, amount) = temp;
        List<MultipleBookings> list = [];
        if (value != null && value is List) {
          value.map((e) => list.add(MultipleBookings.fromJson(e))).toList();
        }
        return (list, null);
      } else if (payLater == true ||
          paymentMethod?.methodType == kWalletMethod) {
        List<MultipleBookings> list = [];
        if (response['data'] != null && response['data'] is List) {
          response['data']
              .map((e) => list.add(MultipleBookings.fromJson(e)))
              .toList();
        }
        return (list, null);
      } else {
        final redirectURL = response['data'] as String;
        return (null, redirectURL);
      }
    } catch (e) {
      if (e is Map<String, dynamic>) {
        throw e['message'];
      }
      rethrow;
    }
  }
}

@riverpod
PaymentRepo paymentRepo(Ref ref) => PaymentRepo();

@riverpod
Future<PaymentDetails> fetchPaymentDetails(
    FetchPaymentDetailsRef ref,
    int locationID,
    PaymentDetailsRequestType type,
    int id,
    bool isOpenMatch,
    DateTime? startDate,
    int? duration,
    {int? courtId,int? variantId}) {
  return ref.read(paymentRepoProvider).fetchPaymentDetails(
      locationID, ref, type, id, startDate, isOpenMatch, duration,
      courtId: courtId,variantId: variantId);
}

@riverpod
Future<PaymentDetails> fetchAllPaymentMethods(
    FetchAllPaymentMethodsRef ref,
    int locationID,
    int serviceID,
    PaymentDetailsRequestType type,

    DateTime? startDate,
    int? duration,{int? courtId,int? variantId,required bool isOpenMatch}) async {
  final paymentMethods = await ref.refresh(fetchPaymentDetailsProvider(
          locationID, type, serviceID, isOpenMatch, startDate, duration,courtId: courtId,variantId:variantId)
      .future);

  return PaymentDetails(
      appPaymentMethods: paymentMethods.appPaymentMethods,
      userMemberships: paymentMethods.userMemberships);
}

@riverpod
Future<(int, double?)> paymentProcess(
  PaymentProcessRef ref, {
  required PaymentProcessRequestType requestType,
  bool? payLater,
  double? totalAmount,
  List<AppPaymentMethods>? paymentMethod,
  required bool pendingPayment,
  int? serviceID,
  int? locationID,
  bool isJoiningApproval = false,
  bool bookingToOpenMatch = false,
  bool purchaseMembership = false,
  int? couponID,
}) {
  return ref.read(paymentRepoProvider).paymentProcess(ref,
      requestType: requestType,
      payLater: payLater,
      totalAmount: totalAmount,
      serviceID: serviceID,
      paymentMethod: paymentMethod,
      pendingPayment: pendingPayment,
      isJoiningApproval: isJoiningApproval,
      bookingToOpenMatch: bookingToOpenMatch,
      locationID: locationID,
      purchaseMembership: purchaseMembership,
      couponID: couponID);
}

@riverpod
Future<CouponModel> verifyCoupon(
  VerifyCouponRef ref, {
  required String coupon,
  required double price,
}) {
  return ref.read(paymentRepoProvider).verifyCoupon(ref, coupon, price);
}

@riverpod
Future<(List<MultipleBookings>?, String?)> multiBookingPaymentProcess(
  MultiBookingPaymentProcessRef ref, {
  required PaymentProcessRequestType requestType,
  bool? payLater,
  double? totalAmount,
  AppPaymentMethods? paymentMethod,
  int? serviceID,
  bool isJoiningApproval = false,
  int? couponID,
}) {
  return ref.read(paymentRepoProvider).multiBookingPaymentProcess(ref,
      requestType: requestType,
      payLater: payLater,
      totalAmount: totalAmount,
      serviceID: serviceID,
      paymentMethod: paymentMethod,
      isJoiningApproval: isJoiningApproval,
      couponID: couponID);
}
