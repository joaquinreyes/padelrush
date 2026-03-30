// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'club_repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(clubRepo)
final clubRepoProvider = ClubRepoProvider._();

final class ClubRepoProvider
    extends $FunctionalProvider<CourtRepo, CourtRepo, CourtRepo>
    with $Provider<CourtRepo> {
  ClubRepoProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'clubRepoProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$clubRepoHash();

  @$internal
  @override
  $ProviderElement<CourtRepo> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  CourtRepo create(Ref ref) {
    return clubRepo(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CourtRepo value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CourtRepo>(value),
    );
  }
}

String _$clubRepoHash() => r'ab70c530b7048f57a31ab383da079d63c64f5d08';

@ProviderFor(clubLocations)
final clubLocationsProvider = ClubLocationsProvider._();

final class ClubLocationsProvider extends $FunctionalProvider<
        AsyncValue<List<ClubLocationData>?>,
        List<ClubLocationData>?,
        FutureOr<List<ClubLocationData>?>>
    with
        $FutureModifier<List<ClubLocationData>?>,
        $FutureProvider<List<ClubLocationData>?> {
  ClubLocationsProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'clubLocationsProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$clubLocationsHash();

  @$internal
  @override
  $FutureProviderElement<List<ClubLocationData>?> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<ClubLocationData>?> create(Ref ref) {
    return clubLocations(ref);
  }
}

String _$clubLocationsHash() => r'd2bd864a351338cee4e3ec3cedcd2f90f560d122';

@ProviderFor(getCourtBooking)
final getCourtBookingProvider = GetCourtBookingProvider._();

final class GetCourtBookingProvider extends $FunctionalProvider<
        AsyncValue<CourtBookingData?>,
        CourtBookingData?,
        FutureOr<CourtBookingData?>>
    with
        $FutureModifier<CourtBookingData?>,
        $FutureProvider<CourtBookingData?> {
  GetCourtBookingProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'getCourtBookingProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$getCourtBookingHash();

  @$internal
  @override
  $FutureProviderElement<CourtBookingData?> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<CourtBookingData?> create(Ref ref) {
    return getCourtBooking(ref);
  }
}

String _$getCourtBookingHash() => r'c1926d4f72f268b3a11cd648e1d6d50e8549a72e';

@ProviderFor(SelectedDate)
final selectedDateProvider = SelectedDateProvider._();

final class SelectedDateProvider
    extends $NotifierProvider<SelectedDate, DubaiDateTime> {
  SelectedDateProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'selectedDateProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$selectedDateHash();

  @$internal
  @override
  SelectedDate create() => SelectedDate();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DubaiDateTime value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DubaiDateTime>(value),
    );
  }
}

String _$selectedDateHash() => r'9c9b25e83b91321a82f2c350cabe9f67eaf4912b';

abstract class _$SelectedDate extends $Notifier<DubaiDateTime> {
  DubaiDateTime build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<DubaiDateTime, DubaiDateTime>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<DubaiDateTime, DubaiDateTime>,
        DubaiDateTime,
        Object?,
        Object?>;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(SelectedDateLesson)
final selectedDateLessonProvider = SelectedDateLessonProvider._();

final class SelectedDateLessonProvider
    extends $NotifierProvider<SelectedDateLesson, DubaiDateTime> {
  SelectedDateLessonProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'selectedDateLessonProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$selectedDateLessonHash();

  @$internal
  @override
  SelectedDateLesson create() => SelectedDateLesson();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DubaiDateTime value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DubaiDateTime>(value),
    );
  }
}

String _$selectedDateLessonHash() =>
    r'1ee726bea866475f17abcff2825c9088a7bbaffe';

abstract class _$SelectedDateLesson extends $Notifier<DubaiDateTime> {
  DubaiDateTime build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<DubaiDateTime, DubaiDateTime>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<DubaiDateTime, DubaiDateTime>,
        DubaiDateTime,
        Object?,
        Object?>;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(checkUpdate)
final checkUpdateProvider = CheckUpdateProvider._();

final class CheckUpdateProvider extends $FunctionalProvider<
        AsyncValue<AppUpdateModel?>, AppUpdateModel?, FutureOr<AppUpdateModel?>>
    with $FutureModifier<AppUpdateModel?>, $FutureProvider<AppUpdateModel?> {
  CheckUpdateProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'checkUpdateProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$checkUpdateHash();

  @$internal
  @override
  $FutureProviderElement<AppUpdateModel?> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<AppUpdateModel?> create(Ref ref) {
    return checkUpdate(ref);
  }
}

String _$checkUpdateHash() => r'f8d77a0faaa7f460f415d4c88902efc30796dcfc';
