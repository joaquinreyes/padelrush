// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(bookingRepo)
final bookingRepoProvider = BookingRepoProvider._();

final class BookingRepoProvider
    extends $FunctionalProvider<BookingRepo, BookingRepo, BookingRepo>
    with $Provider<BookingRepo> {
  BookingRepoProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'bookingRepoProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$bookingRepoHash();

  @$internal
  @override
  $ProviderElement<BookingRepo> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  BookingRepo create(Ref ref) {
    return bookingRepo(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BookingRepo value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BookingRepo>(value),
    );
  }
}

String _$bookingRepoHash() => r'9ebe23e820b376226a4fe9a271d55265b5050c03';

@ProviderFor(bookCourt)
final bookCourtProvider = BookCourtFamily._();

final class BookCourtProvider
    extends $FunctionalProvider<AsyncValue<double?>, double?, FutureOr<double?>>
    with $FutureModifier<double?>, $FutureProvider<double?> {
  BookCourtProvider._(
      {required BookCourtFamily super.from,
      required ({
        Bookings booking,
        int courtID,
        DateTime dateTime,
        bool isOpenMatch,
        bool payMyShare,
        int reservedPlayers,
        BookingRequestType requestType,
        String? organizerNote,
        bool? isPrivateMatch,
        bool? isFriendlyMatch,
        double? openMatchMinLevel,
        double? openMatchMaxLevel,
        bool? approvalNeeded,
        List<BookingPlayerBase>? customerPlayers,
      })
          super.argument})
      : super(
          retry: null,
          name: r'bookCourtProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$bookCourtHash();

  @override
  String toString() {
    return r'bookCourtProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<double?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<double?> create(Ref ref) {
    final argument = this.argument as ({
      Bookings booking,
      int courtID,
      DateTime dateTime,
      bool isOpenMatch,
      bool payMyShare,
      int reservedPlayers,
      BookingRequestType requestType,
      String? organizerNote,
      bool? isPrivateMatch,
      bool? isFriendlyMatch,
      double? openMatchMinLevel,
      double? openMatchMaxLevel,
      bool? approvalNeeded,
      List<BookingPlayerBase>? customerPlayers,
    });
    return bookCourt(
      ref,
      booking: argument.booking,
      courtID: argument.courtID,
      dateTime: argument.dateTime,
      isOpenMatch: argument.isOpenMatch,
      payMyShare: argument.payMyShare,
      reservedPlayers: argument.reservedPlayers,
      requestType: argument.requestType,
      organizerNote: argument.organizerNote,
      isPrivateMatch: argument.isPrivateMatch,
      isFriendlyMatch: argument.isFriendlyMatch,
      openMatchMinLevel: argument.openMatchMinLevel,
      openMatchMaxLevel: argument.openMatchMaxLevel,
      approvalNeeded: argument.approvalNeeded,
      customerPlayers: argument.customerPlayers,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is BookCourtProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$bookCourtHash() => r'8de11b4373295bcb3c0538ee2afa8c818587e1ff';

final class BookCourtFamily extends $Family
    with
        $FunctionalFamilyOverride<
            FutureOr<double?>,
            ({
              Bookings booking,
              int courtID,
              DateTime dateTime,
              bool isOpenMatch,
              bool payMyShare,
              int reservedPlayers,
              BookingRequestType requestType,
              String? organizerNote,
              bool? isPrivateMatch,
              bool? isFriendlyMatch,
              double? openMatchMinLevel,
              double? openMatchMaxLevel,
              bool? approvalNeeded,
              List<BookingPlayerBase>? customerPlayers,
            })> {
  BookCourtFamily._()
      : super(
          retry: null,
          name: r'bookCourtProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  BookCourtProvider call({
    required Bookings booking,
    required int courtID,
    required DateTime dateTime,
    required bool isOpenMatch,
    required bool payMyShare,
    required int reservedPlayers,
    required BookingRequestType requestType,
    String? organizerNote,
    bool? isPrivateMatch,
    bool? isFriendlyMatch,
    required double? openMatchMinLevel,
    required double? openMatchMaxLevel,
    bool? approvalNeeded,
    List<BookingPlayerBase>? customerPlayers,
  }) =>
      BookCourtProvider._(argument: (
        booking: booking,
        courtID: courtID,
        dateTime: dateTime,
        isOpenMatch: isOpenMatch,
        payMyShare: payMyShare,
        reservedPlayers: reservedPlayers,
        requestType: requestType,
        organizerNote: organizerNote,
        isPrivateMatch: isPrivateMatch,
        isFriendlyMatch: isFriendlyMatch,
        openMatchMinLevel: openMatchMinLevel,
        openMatchMaxLevel: openMatchMaxLevel,
        approvalNeeded: approvalNeeded,
        customerPlayers: customerPlayers,
      ), from: this);

  @override
  String toString() => r'bookCourtProvider';
}

@ProviderFor(fetchUserBooking)
final fetchUserBookingProvider = FetchUserBookingProvider._();

final class FetchUserBookingProvider extends $FunctionalProvider<
        AsyncValue<List<UserBookings>>,
        List<UserBookings>,
        FutureOr<List<UserBookings>>>
    with
        $FutureModifier<List<UserBookings>>,
        $FutureProvider<List<UserBookings>> {
  FetchUserBookingProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'fetchUserBookingProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$fetchUserBookingHash();

  @$internal
  @override
  $FutureProviderElement<List<UserBookings>> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<UserBookings>> create(Ref ref) {
    return fetchUserBooking(ref);
  }
}

String _$fetchUserBookingHash() => r'b0a69cce66a73843c33103d839f8f608885b630e';

@ProviderFor(fetchUserBookingWaitingList)
final fetchUserBookingWaitingListProvider =
    FetchUserBookingWaitingListProvider._();

final class FetchUserBookingWaitingListProvider extends $FunctionalProvider<
        AsyncValue<List<UserBookings>>,
        List<UserBookings>,
        FutureOr<List<UserBookings>>>
    with
        $FutureModifier<List<UserBookings>>,
        $FutureProvider<List<UserBookings>> {
  FetchUserBookingWaitingListProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'fetchUserBookingWaitingListProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$fetchUserBookingWaitingListHash();

  @$internal
  @override
  $FutureProviderElement<List<UserBookings>> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<UserBookings>> create(Ref ref) {
    return fetchUserBookingWaitingList(ref);
  }
}

String _$fetchUserBookingWaitingListHash() =>
    r'43d18a355c2fb71b457cc3c91f56a6b7de188193';

@ProviderFor(fetchUserAllBookings)
final fetchUserAllBookingsProvider = FetchUserAllBookingsProvider._();

final class FetchUserAllBookingsProvider extends $FunctionalProvider<
        AsyncValue<List<UserBookings>>,
        List<UserBookings>,
        FutureOr<List<UserBookings>>>
    with
        $FutureModifier<List<UserBookings>>,
        $FutureProvider<List<UserBookings>> {
  FetchUserAllBookingsProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'fetchUserAllBookingsProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$fetchUserAllBookingsHash();

  @$internal
  @override
  $FutureProviderElement<List<UserBookings>> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<UserBookings>> create(Ref ref) {
    return fetchUserAllBookings(ref);
  }
}

String _$fetchUserAllBookingsHash() =>
    r'56c357316a3c6a1307a72036397bc08bedc2c9e3';

@ProviderFor(addToCalendar)
final addToCalendarProvider = AddToCalendarFamily._();

final class AddToCalendarProvider
    extends $FunctionalProvider<AsyncValue<bool>, bool, FutureOr<bool>>
    with $FutureModifier<bool>, $FutureProvider<bool> {
  AddToCalendarProvider._(
      {required AddToCalendarFamily super.from,
      required ({
        String title,
        DateTime startDate,
        DateTime endDate,
      })
          super.argument})
      : super(
          retry: null,
          name: r'addToCalendarProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$addToCalendarHash();

  @override
  String toString() {
    return r'addToCalendarProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<bool> create(Ref ref) {
    final argument = this.argument as ({
      String title,
      DateTime startDate,
      DateTime endDate,
    });
    return addToCalendar(
      ref,
      title: argument.title,
      startDate: argument.startDate,
      endDate: argument.endDate,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is AddToCalendarProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$addToCalendarHash() => r'64a254810c4801ab505e0babb496fd935dc108dc';

final class AddToCalendarFamily extends $Family
    with
        $FunctionalFamilyOverride<
            FutureOr<bool>,
            ({
              String title,
              DateTime startDate,
              DateTime endDate,
            })> {
  AddToCalendarFamily._()
      : super(
          retry: null,
          name: r'addToCalendarProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  AddToCalendarProvider call({
    required String title,
    required DateTime startDate,
    required DateTime endDate,
  }) =>
      AddToCalendarProvider._(argument: (
        title: title,
        startDate: startDate,
        endDate: endDate,
      ), from: this);

  @override
  String toString() => r'addToCalendarProvider';
}

@ProviderFor(fetchCourtPrice)
final fetchCourtPriceProvider = FetchCourtPriceFamily._();

final class FetchCourtPriceProvider
    extends $FunctionalProvider<AsyncValue<dynamic>, dynamic, FutureOr<dynamic>>
    with $FutureModifier<dynamic>, $FutureProvider<dynamic> {
  FetchCourtPriceProvider._(
      {required FetchCourtPriceFamily super.from,
      required ({
        int serviceId,
        CourtPriceRequestType requestType,
        DateTime dateTime,
        List<dynamic> courtId,
        bool isOpenMatch,
        bool pendingPayment,
        int reserveCounter,
        LessonVariants? lessonVariant,
        int durationInMin,
        int? coachId,
      })
          super.argument})
      : super(
          retry: null,
          name: r'fetchCourtPriceProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$fetchCourtPriceHash();

  @override
  String toString() {
    return r'fetchCourtPriceProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<dynamic> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<dynamic> create(Ref ref) {
    final argument = this.argument as ({
      int serviceId,
      CourtPriceRequestType requestType,
      DateTime dateTime,
      List<dynamic> courtId,
      bool isOpenMatch,
      bool pendingPayment,
      int reserveCounter,
      LessonVariants? lessonVariant,
      int durationInMin,
      int? coachId,
    });
    return fetchCourtPrice(
      ref,
      serviceId: argument.serviceId,
      requestType: argument.requestType,
      dateTime: argument.dateTime,
      courtId: argument.courtId,
      isOpenMatch: argument.isOpenMatch,
      pendingPayment: argument.pendingPayment,
      reserveCounter: argument.reserveCounter,
      lessonVariant: argument.lessonVariant,
      durationInMin: argument.durationInMin,
      coachId: argument.coachId,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is FetchCourtPriceProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$fetchCourtPriceHash() => r'7c3f146db96a762d9654c2df2414afa6d0d3a072';

final class FetchCourtPriceFamily extends $Family
    with
        $FunctionalFamilyOverride<
            FutureOr<dynamic>,
            ({
              int serviceId,
              CourtPriceRequestType requestType,
              DateTime dateTime,
              List<dynamic> courtId,
              bool isOpenMatch,
              bool pendingPayment,
              int reserveCounter,
              LessonVariants? lessonVariant,
              int durationInMin,
              int? coachId,
            })> {
  FetchCourtPriceFamily._()
      : super(
          retry: null,
          name: r'fetchCourtPriceProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  FetchCourtPriceProvider call({
    required int serviceId,
    required CourtPriceRequestType requestType,
    required DateTime dateTime,
    required List<dynamic> courtId,
    bool isOpenMatch = false,
    bool pendingPayment = false,
    int reserveCounter = 0,
    LessonVariants? lessonVariant,
    required int durationInMin,
    required int? coachId,
  }) =>
      FetchCourtPriceProvider._(argument: (
        serviceId: serviceId,
        requestType: requestType,
        dateTime: dateTime,
        courtId: courtId,
        isOpenMatch: isOpenMatch,
        pendingPayment: pendingPayment,
        reserveCounter: reserveCounter,
        lessonVariant: lessonVariant,
        durationInMin: durationInMin,
        coachId: coachId,
      ), from: this);

  @override
  String toString() => r'fetchCourtPriceProvider';
}

@ProviderFor(fetchBookingCartList)
final fetchBookingCartListProvider = FetchBookingCartListProvider._();

final class FetchBookingCartListProvider extends $FunctionalProvider<
        AsyncValue<List<MultipleBookings>>,
        List<MultipleBookings>,
        FutureOr<List<MultipleBookings>>>
    with
        $FutureModifier<List<MultipleBookings>>,
        $FutureProvider<List<MultipleBookings>> {
  FetchBookingCartListProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'fetchBookingCartListProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$fetchBookingCartListHash();

  @$internal
  @override
  $FutureProviderElement<List<MultipleBookings>> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<MultipleBookings>> create(Ref ref) {
    return fetchBookingCartList(ref);
  }
}

String _$fetchBookingCartListHash() =>
    r'bb1ab4b33c6c609151cabdd566d9023a343018b6';

@ProviderFor(deleteCart)
final deleteCartProvider = DeleteCartFamily._();

final class DeleteCartProvider
    extends $FunctionalProvider<AsyncValue<bool>, bool, FutureOr<bool>>
    with $FutureModifier<bool>, $FutureProvider<bool> {
  DeleteCartProvider._(
      {required DeleteCartFamily super.from, required String super.argument})
      : super(
          retry: null,
          name: r'deleteCartProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$deleteCartHash();

  @override
  String toString() {
    return r'deleteCartProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<bool> create(Ref ref) {
    final argument = this.argument as String;
    return deleteCart(
      ref,
      argument,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is DeleteCartProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$deleteCartHash() => r'270f5242597dce0c128f744b8e6be5f53d636b46';

final class DeleteCartFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<bool>, String> {
  DeleteCartFamily._()
      : super(
          retry: null,
          name: r'deleteCartProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  DeleteCartProvider call(
    String bookingId,
  ) =>
      DeleteCartProvider._(argument: bookingId, from: this);

  @override
  String toString() => r'deleteCartProvider';
}

@ProviderFor(upgradeBookingToOpen)
final upgradeBookingToOpenProvider = UpgradeBookingToOpenFamily._();

final class UpgradeBookingToOpenProvider extends $FunctionalProvider<
        AsyncValue<
            (
              int?,
              double?,
            )>,
        (
          int?,
          double?,
        ),
        FutureOr<
            (
              int?,
              double?,
            )>>
    with
        $FutureModifier<
            (
              int?,
              double?,
            )>,
        $FutureProvider<
            (
              int?,
              double?,
            )> {
  UpgradeBookingToOpenProvider._(
      {required UpgradeBookingToOpenFamily super.from,
      required ({
        Bookings booking,
        int reservedPlayers,
        String? organizerNote,
        bool? isFriendlyMatch,
        bool? isPrivateMatch,
        double? openMatchMinLevel,
        double? openMatchMaxLevel,
        bool? approvalNeeded,
      })
          super.argument})
      : super(
          retry: null,
          name: r'upgradeBookingToOpenProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$upgradeBookingToOpenHash();

  @override
  String toString() {
    return r'upgradeBookingToOpenProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<
      (
        int?,
        double?,
      )> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<
      (
        int?,
        double?,
      )> create(Ref ref) {
    final argument = this.argument as ({
      Bookings booking,
      int reservedPlayers,
      String? organizerNote,
      bool? isFriendlyMatch,
      bool? isPrivateMatch,
      double? openMatchMinLevel,
      double? openMatchMaxLevel,
      bool? approvalNeeded,
    });
    return upgradeBookingToOpen(
      ref,
      booking: argument.booking,
      reservedPlayers: argument.reservedPlayers,
      organizerNote: argument.organizerNote,
      isFriendlyMatch: argument.isFriendlyMatch,
      isPrivateMatch: argument.isPrivateMatch,
      openMatchMinLevel: argument.openMatchMinLevel,
      openMatchMaxLevel: argument.openMatchMaxLevel,
      approvalNeeded: argument.approvalNeeded,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is UpgradeBookingToOpenProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$upgradeBookingToOpenHash() =>
    r'd917061d564941227097fa62727b35492541449a';

final class UpgradeBookingToOpenFamily extends $Family
    with
        $FunctionalFamilyOverride<
            FutureOr<
                (
                  int?,
                  double?,
                )>,
            ({
              Bookings booking,
              int reservedPlayers,
              String? organizerNote,
              bool? isFriendlyMatch,
              bool? isPrivateMatch,
              double? openMatchMinLevel,
              double? openMatchMaxLevel,
              bool? approvalNeeded,
            })> {
  UpgradeBookingToOpenFamily._()
      : super(
          retry: null,
          name: r'upgradeBookingToOpenProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  UpgradeBookingToOpenProvider call({
    required Bookings booking,
    required int reservedPlayers,
    String? organizerNote,
    bool? isFriendlyMatch,
    bool? isPrivateMatch,
    required double? openMatchMinLevel,
    required double? openMatchMaxLevel,
    bool? approvalNeeded,
  }) =>
      UpgradeBookingToOpenProvider._(argument: (
        booking: booking,
        reservedPlayers: reservedPlayers,
        organizerNote: organizerNote,
        isFriendlyMatch: isFriendlyMatch,
        isPrivateMatch: isPrivateMatch,
        openMatchMinLevel: openMatchMinLevel,
        openMatchMaxLevel: openMatchMaxLevel,
        approvalNeeded: approvalNeeded,
      ), from: this);

  @override
  String toString() => r'upgradeBookingToOpenProvider';
}

@ProviderFor(fetchChatCount)
final fetchChatCountProvider = FetchChatCountFamily._();

final class FetchChatCountProvider
    extends $FunctionalProvider<AsyncValue<double?>, double?, FutureOr<double?>>
    with $FutureModifier<double?>, $FutureProvider<double?> {
  FetchChatCountProvider._(
      {required FetchChatCountFamily super.from, required int super.argument})
      : super(
          retry: null,
          name: r'fetchChatCountProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$fetchChatCountHash();

  @override
  String toString() {
    return r'fetchChatCountProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<double?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<double?> create(Ref ref) {
    final argument = this.argument as int;
    return fetchChatCount(
      ref,
      matchId: argument,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is FetchChatCountProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$fetchChatCountHash() => r'b322e51f3a27c4575af69af38ba3c62353795d05';

final class FetchChatCountFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<double?>, int> {
  FetchChatCountFamily._()
      : super(
          retry: null,
          name: r'fetchChatCountProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  FetchChatCountProvider call({
    required int matchId,
  }) =>
      FetchChatCountProvider._(argument: matchId, from: this);

  @override
  String toString() => r'fetchChatCountProvider';
}

@ProviderFor(bookLessonCourt)
final bookLessonCourtProvider = BookLessonCourtFamily._();

final class BookLessonCourtProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  BookLessonCourtProvider._(
      {required BookLessonCourtFamily super.from,
      required ({
        int lessonTime,
        int courtId,
        int lessonId,
        int coachId,
        int locationId,
        DateTime dateTime,
        LessonVariants? lessonVariant,
      })
          super.argument})
      : super(
          retry: null,
          name: r'bookLessonCourtProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$bookLessonCourtHash();

  @override
  String toString() {
    return r'bookLessonCourtProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    final argument = this.argument as ({
      int lessonTime,
      int courtId,
      int lessonId,
      int coachId,
      int locationId,
      DateTime dateTime,
      LessonVariants? lessonVariant,
    });
    return bookLessonCourt(
      ref,
      lessonTime: argument.lessonTime,
      courtId: argument.courtId,
      lessonId: argument.lessonId,
      coachId: argument.coachId,
      locationId: argument.locationId,
      dateTime: argument.dateTime,
      lessonVariant: argument.lessonVariant,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is BookLessonCourtProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$bookLessonCourtHash() => r'2c5754ed5f3fba4f7166c87d979279df73036d7d';

final class BookLessonCourtFamily extends $Family
    with
        $FunctionalFamilyOverride<
            FutureOr<void>,
            ({
              int lessonTime,
              int courtId,
              int lessonId,
              int coachId,
              int locationId,
              DateTime dateTime,
              LessonVariants? lessonVariant,
            })> {
  BookLessonCourtFamily._()
      : super(
          retry: null,
          name: r'bookLessonCourtProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  BookLessonCourtProvider call({
    required int lessonTime,
    required int courtId,
    required int lessonId,
    required int coachId,
    required int locationId,
    required DateTime dateTime,
    required LessonVariants? lessonVariant,
  }) =>
      BookLessonCourtProvider._(argument: (
        lessonTime: lessonTime,
        courtId: courtId,
        lessonId: lessonId,
        coachId: coachId,
        locationId: locationId,
        dateTime: dateTime,
        lessonVariant: lessonVariant,
      ), from: this);

  @override
  String toString() => r'bookLessonCourtProvider';
}

@ProviderFor(activeMembership)
final activeMembershipProvider = ActiveMembershipProvider._();

final class ActiveMembershipProvider extends $FunctionalProvider<
        AsyncValue<List<ActiveMemberships>>,
        List<ActiveMemberships>,
        FutureOr<List<ActiveMemberships>>>
    with
        $FutureModifier<List<ActiveMemberships>>,
        $FutureProvider<List<ActiveMemberships>> {
  ActiveMembershipProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'activeMembershipProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$activeMembershipHash();

  @$internal
  @override
  $FutureProviderElement<List<ActiveMemberships>> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<ActiveMemberships>> create(Ref ref) {
    return activeMembership(ref);
  }
}

String _$activeMembershipHash() => r'ee8ccc1ba16514605ab88600feb077b13b8fbc9a';

@ProviderFor(fetchActiveAndAllMemberships)
final fetchActiveAndAllMembershipsProvider =
    FetchActiveAndAllMembershipsProvider._();

final class FetchActiveAndAllMembershipsProvider extends $FunctionalProvider<
        AsyncValue<UserActiveMembership>,
        UserActiveMembership,
        FutureOr<UserActiveMembership>>
    with
        $FutureModifier<UserActiveMembership>,
        $FutureProvider<UserActiveMembership> {
  FetchActiveAndAllMembershipsProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'fetchActiveAndAllMembershipsProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$fetchActiveAndAllMembershipsHash();

  @$internal
  @override
  $FutureProviderElement<UserActiveMembership> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<UserActiveMembership> create(Ref ref) {
    return fetchActiveAndAllMemberships(ref);
  }
}

String _$fetchActiveAndAllMembershipsHash() =>
    r'6781ec7fefd91d8883fd9e1f996ed75c840468f0';

@ProviderFor(fetchAllMemberships)
final fetchAllMembershipsProvider = FetchAllMembershipsProvider._();

final class FetchAllMembershipsProvider extends $FunctionalProvider<
        AsyncValue<List<MembershipModel>>,
        List<MembershipModel>,
        FutureOr<List<MembershipModel>>>
    with
        $FutureModifier<List<MembershipModel>>,
        $FutureProvider<List<MembershipModel>> {
  FetchAllMembershipsProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'fetchAllMembershipsProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$fetchAllMembershipsHash();

  @$internal
  @override
  $FutureProviderElement<List<MembershipModel>> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<MembershipModel>> create(Ref ref) {
    return fetchAllMemberships(ref);
  }
}

String _$fetchAllMembershipsHash() =>
    r'007d54c5bde5f6a62f26bf17d547f8dc03edea10';

@ProviderFor(fetchMembershipCategory)
final fetchMembershipCategoryProvider = FetchMembershipCategoryProvider._();

final class FetchMembershipCategoryProvider extends $FunctionalProvider<
        AsyncValue<List<MembershipCategory>>,
        List<MembershipCategory>,
        FutureOr<List<MembershipCategory>>>
    with
        $FutureModifier<List<MembershipCategory>>,
        $FutureProvider<List<MembershipCategory>> {
  FetchMembershipCategoryProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'fetchMembershipCategoryProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$fetchMembershipCategoryHash();

  @$internal
  @override
  $FutureProviderElement<List<MembershipCategory>> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<MembershipCategory>> create(Ref ref) {
    return fetchMembershipCategory(ref);
  }
}

String _$fetchMembershipCategoryHash() =>
    r'af162354acb772960d85b39f152671a69e1c72c5';
