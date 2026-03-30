// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(locationRepo)
final locationRepoProvider = LocationRepoProvider._();

final class LocationRepoProvider
    extends $FunctionalProvider<LocationRepo, LocationRepo, LocationRepo>
    with $Provider<LocationRepo> {
  LocationRepoProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'locationRepoProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$locationRepoHash();

  @$internal
  @override
  $ProviderElement<LocationRepo> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  LocationRepo create(Ref ref) {
    return locationRepo(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LocationRepo value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LocationRepo>(value),
    );
  }
}

String _$locationRepoHash() => r'8c8833b6eae0f5f8516c5f835702e4d5ce535f2e';

@ProviderFor(fetchLocation)
final fetchLocationProvider = FetchLocationProvider._();

final class FetchLocationProvider extends $FunctionalProvider<
        AsyncValue<Position?>, Position?, FutureOr<Position?>>
    with $FutureModifier<Position?>, $FutureProvider<Position?> {
  FetchLocationProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'fetchLocationProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$fetchLocationHash();

  @$internal
  @override
  $FutureProviderElement<Position?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Position?> create(Ref ref) {
    return fetchLocation(ref);
  }
}

String _$fetchLocationHash() => r'3f1d050bb034379a536142da7b29341114ff7d00';
