import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:padelrush/globals/api_endpoints.dart';
import 'package:padelrush/managers/api_manager.dart';
import 'package:padelrush/managers/stripe_manager.dart';
import 'package:padelrush/managers/user_manager.dart';
import 'package:padelrush/models/stripe_payment_method.dart';

import '../globals/constants.dart';
part 'stripe_repo.g.dart';

class StripeRepo {
  Future<bool> createAndAttachPaymentMethod(Ref ref) async {
    try {
      final apiManager = ref.read(apiManagerProvider);
      final user = ref.read(userManagerProvider).user;
      final token = user?.accessToken;
      String? paymentMethodID = await ref.read(addPaymentMethodProvider.future);
      if (paymentMethodID == null) {
        throw "ERROR_OCCURED_WHILE_CREATING_PAYMENT_METHOD";
      }
      final data = {
        "payment_id": paymentMethodID,
      };
      await apiManager.post(
        ref,
        ApiEndPoint.stripeAttachPaymentMethod,
        data,
        token: token,
      );
      return true;
    } catch (e) {
      if (e is StripeException) {
        throw e.error.localizedMessage ?? "SOMETHING_WENT_WRONG";
      }
      if (e is Map<String, dynamic>) {
        throw e['message'];
      }
      rethrow;
    }
  }

  Future<List<StripePaymentMethod>> fetchStripPaymentMethods(Ref ref) async {
    try {
      final apiManager = ref.read(apiManagerProvider);
      final user = ref.read(userManagerProvider).user;
      final token = user?.accessToken;
      final response = await apiManager.get(
        ref,
        ApiEndPoint.stripeGetPaymentMethod,
        token: token,
      );
      if (response is Map<String, dynamic>) {
        final list = response["data"]["data"] as List<dynamic>;
        final paymentMethods =
            list.map((e) => StripePaymentMethod.fromJson(e)).toList();
        return paymentMethods;
      }
      throw "SOMETHING_WENT_WRONG";
    } catch (e) {
      if (e is Map<String, dynamic>) {
        throw e['message'];
      }
      rethrow;
    }
  }

  Future<bool> deletePaymentMethod(Ref ref, String paymentMethodId) async {
    try {
      final apiManager = ref.read(apiManagerProvider);
      final user = ref.read(userManagerProvider).user;
      final token = user?.accessToken;
      await apiManager.post(
        ref,
        ApiEndPoint.stripeDeletePaymentMethod,
        {
          "methodId": paymentMethodId,
        },
        token: token,
      );
      return true;
    } catch (e) {
      if (e is Map<String, dynamic>) {
        throw e['message'];
      }
      rethrow;
    }
  }

  Future<PaymentIntent?> requireAction(
      String clientSecret, String paymentMethodId) async {
    try {
      return kIsWeb
          ? await Stripe.instance.confirmPayment(
              paymentIntentClientSecret: clientSecret,
              options: PaymentMethodOptions(
                  setupFutureUsage: PaymentIntentsFutureUsage.OffSession),
              data: PaymentMethodParams.cardFromMethodId(
                paymentMethodData: PaymentMethodDataCardFromMethod(
                  paymentMethodId: paymentMethodId,
                ),
              ))
          : await Stripe.instance
              .handleNextAction(clientSecret, returnURL: kDeepLinkUrl);
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> isNativeAvailable() async {
    try {
      final isAvailable = await Stripe.instance.isPlatformPaySupported();
      myPrint("Native payment availability check: $isAvailable");
      return isAvailable;
    } catch (e) {
      myPrint("Error checking native payment availability: $e");
      return false;
    }
  }

  Future<PaymentSheetPaymentOption?> stripePaymentMethod(
      String clientSecret) async {
    try {
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
            paymentIntentClientSecret: clientSecret,
            merchantDisplayName: 'Pickle Park',
            style: ThemeMode.system,
            returnURL: kDeepLinkUrl),
      );
      return await Stripe.instance.presentPaymentSheet();
    } catch (e) {
      rethrow;
    }
  }

  Future<PaymentIntent?> startNativePay(
      String clientSec, bool isAndroid, String amount) async {
    try {
      PlatformPayConfirmParams params;
      if (isAndroid) {
        params = const PlatformPayConfirmParams.googlePay(
          googlePay: GooglePayParams(
            testEnv: true,
            merchantName: 'Padel Rush',
            merchantCountryCode: 'IE',
            currencyCode: 'EUR',
          ),
        );
      } else {
        params = PlatformPayConfirmParams.applePay(
          applePay: ApplePayParams(
            merchantCountryCode: 'IE',
            currencyCode: 'EUR',
            cartItems: [
              ApplePayCartSummaryItem.immediate(
                label: "Padel Rush",
                amount: amount,
              )
            ],
          ),
        );
      }
      
      // For native payments (Apple Pay/Google Pay), don't use setupFutureUsage
      myPrint("Starting native payment with clientSecret: $clientSec, amount: $amount");
      final paymentIntent =
          await Stripe.instance.confirmPlatformPayPaymentIntent(
        clientSecret: clientSec,
        confirmParams: params,
      );
      myPrint("Native payment completed successfully: ${paymentIntent?.id}");
      return paymentIntent;
    } catch (e) {
      myPrint("Native payment failed: $e");
      if (e is StripeException) {
        throw e.error.localizedMessage ?? "SOMETHING_WENT_WRONG";
      }
      rethrow;
    }
  }
}

@riverpod
StripeRepo stripeRepo(Ref ref) => StripeRepo();

@riverpod
Future<bool> createAndAttachPaymentMethod(
  CreateAndAttachPaymentMethodRef ref,
) {
  return ref.read(stripeRepoProvider).createAndAttachPaymentMethod(ref);
}

@riverpod
Future<List<StripePaymentMethod>> fetchStripPaymentMethods(
  FetchStripPaymentMethodsRef ref,
) {
  return ref.read(stripeRepoProvider).fetchStripPaymentMethods(ref);
}

@riverpod
Future<bool> deletePaymentMethod(
  DeletePaymentMethodRef ref,
  String paymentMethodId,
) {
  return ref.read(stripeRepoProvider).deletePaymentMethod(ref, paymentMethodId);
}

@riverpod
Future<PaymentIntent?> stripeRequireAction(
  StripeRequireActionRef ref,
  String paymentSecret,
  String paymentMethodId,
) {
  return ref
      .read(stripeRepoProvider)
      .requireAction(paymentSecret, paymentMethodId);
}

@riverpod
Future<bool> isNativeAvailable(IsNativeAvailableRef ref) {
  return ref.read(stripeRepoProvider).isNativeAvailable();
}

@riverpod
Future<PaymentIntent?> startNativePay(
  StartNativePayRef ref, {
  required String clientSec,
  required String amount,
}) {
  final isAndroid = Platform.isAndroid;
  return ref
      .read(stripeRepoProvider)
      .startNativePay(clientSec, isAndroid, amount);
}

@riverpod
Future<PaymentSheetPaymentOption?> stripePaymentMethod(
  StripePaymentMethodRef ref,
  String paymentSecret,
) {
  return ref.read(stripeRepoProvider).stripePaymentMethod(paymentSecret);
}
