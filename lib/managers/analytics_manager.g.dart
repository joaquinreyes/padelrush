// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analytics_manager.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(analyticsManager)
final analyticsManagerProvider = AnalyticsManagerProvider._();

final class AnalyticsManagerProvider extends $FunctionalProvider<
    AnalyticsManager,
    AnalyticsManager,
    AnalyticsManager> with $Provider<AnalyticsManager> {
  AnalyticsManagerProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'analyticsManagerProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$analyticsManagerHash();

  @$internal
  @override
  $ProviderElement<AnalyticsManager> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AnalyticsManager create(Ref ref) {
    return analyticsManager(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AnalyticsManager value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AnalyticsManager>(value),
    );
  }
}

String _$analyticsManagerHash() => r'2c1b415c9bd001c17957236370765af249224ba5';
