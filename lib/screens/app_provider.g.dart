// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(crashlytics)
final crashlyticsProvider = CrashlyticsProvider._();

final class CrashlyticsProvider extends $FunctionalProvider<
    FirebaseCrashlytics,
    FirebaseCrashlytics,
    FirebaseCrashlytics> with $Provider<FirebaseCrashlytics> {
  CrashlyticsProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'crashlyticsProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$crashlyticsHash();

  @$internal
  @override
  $ProviderElement<FirebaseCrashlytics> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  FirebaseCrashlytics create(Ref ref) {
    return crashlytics(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FirebaseCrashlytics value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FirebaseCrashlytics>(value),
    );
  }
}

String _$crashlyticsHash() => r'0d2a39fb408c9c2a052b32979546402417f1abab';

@ProviderFor(pageController)
final pageControllerProvider = PageControllerProvider._();

final class PageControllerProvider
    extends $FunctionalProvider<PageController, PageController, PageController>
    with $Provider<PageController> {
  PageControllerProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'pageControllerProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$pageControllerHash();

  @$internal
  @override
  $ProviderElement<PageController> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  PageController create(Ref ref) {
    return pageController(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PageController value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PageController>(value),
    );
  }
}

String _$pageControllerHash() => r'13983697a6def5f45b2740e5748d528d3b29a115';

@ProviderFor(PageIndex)
final pageIndexProvider = PageIndexProvider._();

final class PageIndexProvider extends $NotifierProvider<PageIndex, int> {
  PageIndexProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'pageIndexProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$pageIndexHash();

  @$internal
  @override
  PageIndex create() => PageIndex();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$pageIndexHash() => r'a03781324adfd37f4dd0417f78c1097140c6e36c';

abstract class _$PageIndex extends $Notifier<int> {
  int build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<int, int>;
    final element = ref.element
        as $ClassProviderElement<AnyNotifier<int, int>, int, Object?, Object?>;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(SelectedSport)
final selectedSportProvider = SelectedSportProvider._();

final class SelectedSportProvider
    extends $NotifierProvider<SelectedSport, ClubLocationSports?> {
  SelectedSportProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'selectedSportProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$selectedSportHash();

  @$internal
  @override
  SelectedSport create() => SelectedSport();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ClubLocationSports? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ClubLocationSports?>(value),
    );
  }
}

String _$selectedSportHash() => r'b659e11d98098f56918756a00b02899c70feea22';

abstract class _$SelectedSport extends $Notifier<ClubLocationSports?> {
  ClubLocationSports? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<ClubLocationSports?, ClubLocationSports?>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<ClubLocationSports?, ClubLocationSports?>,
        ClubLocationSports?,
        Object?,
        Object?>;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(SelectedSportLesson)
final selectedSportLessonProvider = SelectedSportLessonProvider._();

final class SelectedSportLessonProvider
    extends $NotifierProvider<SelectedSportLesson, ClubLocationSports?> {
  SelectedSportLessonProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'selectedSportLessonProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$selectedSportLessonHash();

  @$internal
  @override
  SelectedSportLesson create() => SelectedSportLesson();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ClubLocationSports? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ClubLocationSports?>(value),
    );
  }
}

String _$selectedSportLessonHash() =>
    r'97acc32099e8d804f17eff0e222b63ad32a2bc1b';

abstract class _$SelectedSportLesson extends $Notifier<ClubLocationSports?> {
  ClubLocationSports? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<ClubLocationSports?, ClubLocationSports?>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<ClubLocationSports?, ClubLocationSports?>,
        ClubLocationSports?,
        Object?,
        Object?>;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(SettingSportsValue)
final settingSportsValueProvider = SettingSportsValueProvider._();

final class SettingSportsValueProvider
    extends $NotifierProvider<SettingSportsValue, String> {
  SettingSportsValueProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'settingSportsValueProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$settingSportsValueHash();

  @$internal
  @override
  SettingSportsValue create() => SettingSportsValue();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$settingSportsValueHash() =>
    r'4d6d7eaf72d2a6a52de5144faefe7587d778163b';

abstract class _$SettingSportsValue extends $Notifier<String> {
  String build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<String, String>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<String, String>, String, Object?, Object?>;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(SportList)
final sportListProvider = SportListProvider._();

final class SportListProvider
    extends $NotifierProvider<SportList, List<ClubLocationSports>> {
  SportListProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'sportListProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$sportListHash();

  @$internal
  @override
  SportList create() => SportList();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<ClubLocationSports> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<ClubLocationSports>>(value),
    );
  }
}

String _$sportListHash() => r'53b2234871ff5be7e97dfb92ef28a57f49291747';

abstract class _$SportList extends $Notifier<List<ClubLocationSports>> {
  List<ClubLocationSports> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<List<ClubLocationSports>, List<ClubLocationSports>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<List<ClubLocationSports>, List<ClubLocationSports>>,
        List<ClubLocationSports>,
        Object?,
        Object?>;
    element.handleCreate(ref, build);
  }
}
