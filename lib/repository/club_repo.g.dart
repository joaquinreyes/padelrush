// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'club_repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$clubRepoHash() => r'ab70c530b7048f57a31ab383da079d63c64f5d08';

/// See also [clubRepo].
@ProviderFor(clubRepo)
final clubRepoProvider = AutoDisposeProvider<CourtRepo>.internal(
  clubRepo,
  name: r'clubRepoProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$clubRepoHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ClubRepoRef = AutoDisposeProviderRef<CourtRepo>;
String _$clubLocationsHash() => r'd2bd864a351338cee4e3ec3cedcd2f90f560d122';

/// See also [clubLocations].
@ProviderFor(clubLocations)
final clubLocationsProvider = FutureProvider<List<ClubLocationData>?>.internal(
  clubLocations,
  name: r'clubLocationsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$clubLocationsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ClubLocationsRef = FutureProviderRef<List<ClubLocationData>?>;
String _$getCourtBookingHash() => r'c1926d4f72f268b3a11cd648e1d6d50e8549a72e';

/// See also [getCourtBooking].
@ProviderFor(getCourtBooking)
final getCourtBookingProvider = FutureProvider<CourtBookingData?>.internal(
  getCourtBooking,
  name: r'getCourtBookingProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getCourtBookingHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetCourtBookingRef = FutureProviderRef<CourtBookingData?>;
String _$checkUpdateHash() => r'f8d77a0faaa7f460f415d4c88902efc30796dcfc';

/// See also [checkUpdate].
@ProviderFor(checkUpdate)
final checkUpdateProvider = AutoDisposeFutureProvider<AppUpdateModel?>.internal(
  checkUpdate,
  name: r'checkUpdateProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$checkUpdateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CheckUpdateRef = AutoDisposeFutureProviderRef<AppUpdateModel?>;
String _$selectedDateHash() => r'9c9b25e83b91321a82f2c350cabe9f67eaf4912b';

/// See also [SelectedDate].
@ProviderFor(SelectedDate)
final selectedDateProvider =
    NotifierProvider<SelectedDate, DubaiDateTime>.internal(
  SelectedDate.new,
  name: r'selectedDateProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$selectedDateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SelectedDate = Notifier<DubaiDateTime>;
String _$selectedDateLessonHash() =>
    r'1ee726bea866475f17abcff2825c9088a7bbaffe';

/// See also [SelectedDateLesson].
@ProviderFor(SelectedDateLesson)
final selectedDateLessonProvider =
    NotifierProvider<SelectedDateLesson, DubaiDateTime>.internal(
  SelectedDateLesson.new,
  name: r'selectedDateLessonProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$selectedDateLessonHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SelectedDateLesson = Notifier<DubaiDateTime>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
