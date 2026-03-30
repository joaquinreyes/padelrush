// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shared_pref_manager.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(sharedPrefManager)
final sharedPrefManagerProvider = SharedPrefManagerProvider._();

final class SharedPrefManagerProvider extends $FunctionalProvider<
    SharedPrefManager,
    SharedPrefManager,
    SharedPrefManager> with $Provider<SharedPrefManager> {
  SharedPrefManagerProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'sharedPrefManagerProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$sharedPrefManagerHash();

  @$internal
  @override
  $ProviderElement<SharedPrefManager> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SharedPrefManager create(Ref ref) {
    return sharedPrefManager(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SharedPrefManager value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SharedPrefManager>(value),
    );
  }
}

String _$sharedPrefManagerHash() => r'32c05dcd1d1109f1338dd948412bedf5e8065d37';
