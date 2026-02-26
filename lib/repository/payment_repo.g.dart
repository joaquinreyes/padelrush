// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(paymentRepo)
final paymentRepoProvider = PaymentRepoProvider._();

final class PaymentRepoProvider
    extends $FunctionalProvider<PaymentRepo, PaymentRepo, PaymentRepo>
    with $Provider<PaymentRepo> {
  PaymentRepoProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'paymentRepoProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$paymentRepoHash();

  @$internal
  @override
  $ProviderElement<PaymentRepo> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  PaymentRepo create(Ref ref) {
    return paymentRepo(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PaymentRepo value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PaymentRepo>(value),
    );
  }
}

String _$paymentRepoHash() => r'9fe3844e721b8ce837441831a2b40fe3cd3aa669';

@ProviderFor(fetchPaymentDetails)
final fetchPaymentDetailsProvider = FetchPaymentDetailsFamily._();

final class FetchPaymentDetailsProvider extends $FunctionalProvider<
        AsyncValue<PaymentDetails>, PaymentDetails, FutureOr<PaymentDetails>>
    with $FutureModifier<PaymentDetails>, $FutureProvider<PaymentDetails> {
  FetchPaymentDetailsProvider._(
      {required FetchPaymentDetailsFamily super.from,
      required (
        int,
        PaymentDetailsRequestType,
        int,
        bool,
        DateTime?,
        int?, {
        int? courtId,
        int? variantId,
        bool isPrivateMatch,
      })
          super.argument})
      : super(
          retry: null,
          name: r'fetchPaymentDetailsProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$fetchPaymentDetailsHash();

  @override
  String toString() {
    return r'fetchPaymentDetailsProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<PaymentDetails> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<PaymentDetails> create(Ref ref) {
    final argument = this.argument as (
      int,
      PaymentDetailsRequestType,
      int,
      bool,
      DateTime?,
      int?, {
      int? courtId,
      int? variantId,
      bool isPrivateMatch,
    });
    return fetchPaymentDetails(
      ref,
      argument.$1,
      argument.$2,
      argument.$3,
      argument.$4,
      argument.$5,
      argument.$6,
      courtId: argument.courtId,
      variantId: argument.variantId,
      isPrivateMatch: argument.isPrivateMatch,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is FetchPaymentDetailsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$fetchPaymentDetailsHash() =>
    r'ca5f73cd3cad7ce1b90bf6d4ea7272f20dc92b5b';

final class FetchPaymentDetailsFamily extends $Family
    with
        $FunctionalFamilyOverride<
            FutureOr<PaymentDetails>,
            (
              int,
              PaymentDetailsRequestType,
              int,
              bool,
              DateTime?,
              int?, {
              int? courtId,
              int? variantId,
              bool isPrivateMatch,
            })> {
  FetchPaymentDetailsFamily._()
      : super(
          retry: null,
          name: r'fetchPaymentDetailsProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  FetchPaymentDetailsProvider call(
    int locationID,
    PaymentDetailsRequestType type,
    int id,
    bool isOpenMatch,
    DateTime? startDate,
    int? duration, {
    int? courtId,
    int? variantId,
    bool isPrivateMatch = false,
  }) =>
      FetchPaymentDetailsProvider._(argument: (
        locationID,
        type,
        id,
        isOpenMatch,
        startDate,
        duration,
        courtId: courtId,
        variantId: variantId,
        isPrivateMatch: isPrivateMatch,
      ), from: this);

  @override
  String toString() => r'fetchPaymentDetailsProvider';
}

@ProviderFor(fetchAllPaymentMethods)
final fetchAllPaymentMethodsProvider = FetchAllPaymentMethodsFamily._();

final class FetchAllPaymentMethodsProvider extends $FunctionalProvider<
        AsyncValue<PaymentDetails>, PaymentDetails, FutureOr<PaymentDetails>>
    with $FutureModifier<PaymentDetails>, $FutureProvider<PaymentDetails> {
  FetchAllPaymentMethodsProvider._(
      {required FetchAllPaymentMethodsFamily super.from,
      required (
        int,
        int,
        PaymentDetailsRequestType,
        DateTime?,
        int?, {
        int? courtId,
        int? variantId,
        bool isOpenMatch,
        bool isPrivateMatch,
      })
          super.argument})
      : super(
          retry: null,
          name: r'fetchAllPaymentMethodsProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$fetchAllPaymentMethodsHash();

  @override
  String toString() {
    return r'fetchAllPaymentMethodsProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<PaymentDetails> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<PaymentDetails> create(Ref ref) {
    final argument = this.argument as (
      int,
      int,
      PaymentDetailsRequestType,
      DateTime?,
      int?, {
      int? courtId,
      int? variantId,
      bool isOpenMatch,
      bool isPrivateMatch,
    });
    return fetchAllPaymentMethods(
      ref,
      argument.$1,
      argument.$2,
      argument.$3,
      argument.$4,
      argument.$5,
      courtId: argument.courtId,
      variantId: argument.variantId,
      isOpenMatch: argument.isOpenMatch,
      isPrivateMatch: argument.isPrivateMatch,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is FetchAllPaymentMethodsProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$fetchAllPaymentMethodsHash() =>
    r'0153d1f003d6d10d5829239c9246308291f53a3a';

final class FetchAllPaymentMethodsFamily extends $Family
    with
        $FunctionalFamilyOverride<
            FutureOr<PaymentDetails>,
            (
              int,
              int,
              PaymentDetailsRequestType,
              DateTime?,
              int?, {
              int? courtId,
              int? variantId,
              bool isOpenMatch,
              bool isPrivateMatch,
            })> {
  FetchAllPaymentMethodsFamily._()
      : super(
          retry: null,
          name: r'fetchAllPaymentMethodsProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  FetchAllPaymentMethodsProvider call(
    int locationID,
    int serviceID,
    PaymentDetailsRequestType type,
    DateTime? startDate,
    int? duration, {
    int? courtId,
    int? variantId,
    required bool isOpenMatch,
    bool isPrivateMatch = false,
  }) =>
      FetchAllPaymentMethodsProvider._(argument: (
        locationID,
        serviceID,
        type,
        startDate,
        duration,
        courtId: courtId,
        variantId: variantId,
        isOpenMatch: isOpenMatch,
        isPrivateMatch: isPrivateMatch,
      ), from: this);

  @override
  String toString() => r'fetchAllPaymentMethodsProvider';
}

@ProviderFor(paymentProcess)
final paymentProcessProvider = PaymentProcessFamily._();

final class PaymentProcessProvider extends $FunctionalProvider<
        AsyncValue<
            (
              int,
              double?,
            )>,
        (
          int,
          double?,
        ),
        FutureOr<
            (
              int,
              double?,
            )>>
    with
        $FutureModifier<
            (
              int,
              double?,
            )>,
        $FutureProvider<
            (
              int,
              double?,
            )> {
  PaymentProcessProvider._(
      {required PaymentProcessFamily super.from,
      required ({
        PaymentProcessRequestType requestType,
        bool? payLater,
        double? totalAmount,
        List<AppPaymentMethods>? paymentMethod,
        bool pendingPayment,
        int? serviceID,
        int? locationID,
        bool isJoiningApproval,
        bool bookingToOpenMatch,
        bool purchaseMembership,
        int? couponID,
      })
          super.argument})
      : super(
          retry: null,
          name: r'paymentProcessProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$paymentProcessHash();

  @override
  String toString() {
    return r'paymentProcessProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<
      (
        int,
        double?,
      )> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<
      (
        int,
        double?,
      )> create(Ref ref) {
    final argument = this.argument as ({
      PaymentProcessRequestType requestType,
      bool? payLater,
      double? totalAmount,
      List<AppPaymentMethods>? paymentMethod,
      bool pendingPayment,
      int? serviceID,
      int? locationID,
      bool isJoiningApproval,
      bool bookingToOpenMatch,
      bool purchaseMembership,
      int? couponID,
    });
    return paymentProcess(
      ref,
      requestType: argument.requestType,
      payLater: argument.payLater,
      totalAmount: argument.totalAmount,
      paymentMethod: argument.paymentMethod,
      pendingPayment: argument.pendingPayment,
      serviceID: argument.serviceID,
      locationID: argument.locationID,
      isJoiningApproval: argument.isJoiningApproval,
      bookingToOpenMatch: argument.bookingToOpenMatch,
      purchaseMembership: argument.purchaseMembership,
      couponID: argument.couponID,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is PaymentProcessProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$paymentProcessHash() => r'16bc07e1d2b1e475e212642958c6f3e33753f708';

final class PaymentProcessFamily extends $Family
    with
        $FunctionalFamilyOverride<
            FutureOr<
                (
                  int,
                  double?,
                )>,
            ({
              PaymentProcessRequestType requestType,
              bool? payLater,
              double? totalAmount,
              List<AppPaymentMethods>? paymentMethod,
              bool pendingPayment,
              int? serviceID,
              int? locationID,
              bool isJoiningApproval,
              bool bookingToOpenMatch,
              bool purchaseMembership,
              int? couponID,
            })> {
  PaymentProcessFamily._()
      : super(
          retry: null,
          name: r'paymentProcessProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  PaymentProcessProvider call({
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
  }) =>
      PaymentProcessProvider._(argument: (
        requestType: requestType,
        payLater: payLater,
        totalAmount: totalAmount,
        paymentMethod: paymentMethod,
        pendingPayment: pendingPayment,
        serviceID: serviceID,
        locationID: locationID,
        isJoiningApproval: isJoiningApproval,
        bookingToOpenMatch: bookingToOpenMatch,
        purchaseMembership: purchaseMembership,
        couponID: couponID,
      ), from: this);

  @override
  String toString() => r'paymentProcessProvider';
}

@ProviderFor(verifyCoupon)
final verifyCouponProvider = VerifyCouponFamily._();

final class VerifyCouponProvider extends $FunctionalProvider<
        AsyncValue<CouponModel>, CouponModel, FutureOr<CouponModel>>
    with $FutureModifier<CouponModel>, $FutureProvider<CouponModel> {
  VerifyCouponProvider._(
      {required VerifyCouponFamily super.from,
      required ({
        String coupon,
        double price,
      })
          super.argument})
      : super(
          retry: null,
          name: r'verifyCouponProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$verifyCouponHash();

  @override
  String toString() {
    return r'verifyCouponProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<CouponModel> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<CouponModel> create(Ref ref) {
    final argument = this.argument as ({
      String coupon,
      double price,
    });
    return verifyCoupon(
      ref,
      coupon: argument.coupon,
      price: argument.price,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is VerifyCouponProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$verifyCouponHash() => r'4b3a29f8092e1bc316fa1e07e2bc5db6d1f3ec0d';

final class VerifyCouponFamily extends $Family
    with
        $FunctionalFamilyOverride<
            FutureOr<CouponModel>,
            ({
              String coupon,
              double price,
            })> {
  VerifyCouponFamily._()
      : super(
          retry: null,
          name: r'verifyCouponProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  VerifyCouponProvider call({
    required String coupon,
    required double price,
  }) =>
      VerifyCouponProvider._(argument: (
        coupon: coupon,
        price: price,
      ), from: this);

  @override
  String toString() => r'verifyCouponProvider';
}

@ProviderFor(multiBookingPaymentProcess)
final multiBookingPaymentProcessProvider = MultiBookingPaymentProcessFamily._();

final class MultiBookingPaymentProcessProvider extends $FunctionalProvider<
        AsyncValue<
            (
              List<MultipleBookings>?,
              String?,
            )>,
        (
          List<MultipleBookings>?,
          String?,
        ),
        FutureOr<
            (
              List<MultipleBookings>?,
              String?,
            )>>
    with
        $FutureModifier<
            (
              List<MultipleBookings>?,
              String?,
            )>,
        $FutureProvider<
            (
              List<MultipleBookings>?,
              String?,
            )> {
  MultiBookingPaymentProcessProvider._(
      {required MultiBookingPaymentProcessFamily super.from,
      required ({
        PaymentProcessRequestType requestType,
        bool? payLater,
        double? totalAmount,
        AppPaymentMethods? paymentMethod,
        int? serviceID,
        bool isJoiningApproval,
        int? couponID,
      })
          super.argument})
      : super(
          retry: null,
          name: r'multiBookingPaymentProcessProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$multiBookingPaymentProcessHash();

  @override
  String toString() {
    return r'multiBookingPaymentProcessProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<
      (
        List<MultipleBookings>?,
        String?,
      )> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<
      (
        List<MultipleBookings>?,
        String?,
      )> create(Ref ref) {
    final argument = this.argument as ({
      PaymentProcessRequestType requestType,
      bool? payLater,
      double? totalAmount,
      AppPaymentMethods? paymentMethod,
      int? serviceID,
      bool isJoiningApproval,
      int? couponID,
    });
    return multiBookingPaymentProcess(
      ref,
      requestType: argument.requestType,
      payLater: argument.payLater,
      totalAmount: argument.totalAmount,
      paymentMethod: argument.paymentMethod,
      serviceID: argument.serviceID,
      isJoiningApproval: argument.isJoiningApproval,
      couponID: argument.couponID,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is MultiBookingPaymentProcessProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$multiBookingPaymentProcessHash() =>
    r'6cb27217edf58c095892d28611c0cba4895951f5';

final class MultiBookingPaymentProcessFamily extends $Family
    with
        $FunctionalFamilyOverride<
            FutureOr<
                (
                  List<MultipleBookings>?,
                  String?,
                )>,
            ({
              PaymentProcessRequestType requestType,
              bool? payLater,
              double? totalAmount,
              AppPaymentMethods? paymentMethod,
              int? serviceID,
              bool isJoiningApproval,
              int? couponID,
            })> {
  MultiBookingPaymentProcessFamily._()
      : super(
          retry: null,
          name: r'multiBookingPaymentProcessProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  MultiBookingPaymentProcessProvider call({
    required PaymentProcessRequestType requestType,
    bool? payLater,
    double? totalAmount,
    AppPaymentMethods? paymentMethod,
    int? serviceID,
    bool isJoiningApproval = false,
    int? couponID,
  }) =>
      MultiBookingPaymentProcessProvider._(argument: (
        requestType: requestType,
        payLater: payLater,
        totalAmount: totalAmount,
        paymentMethod: paymentMethod,
        serviceID: serviceID,
        isJoiningApproval: isJoiningApproval,
        couponID: couponID,
      ), from: this);

  @override
  String toString() => r'multiBookingPaymentProcessProvider';
}
