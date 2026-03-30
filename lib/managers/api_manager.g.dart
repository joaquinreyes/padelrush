// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_manager.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(apiManager)
final apiManagerProvider = ApiManagerProvider._();

final class ApiManagerProvider
    extends $FunctionalProvider<HttpApiManager, HttpApiManager, HttpApiManager>
    with $Provider<HttpApiManager> {
  ApiManagerProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'apiManagerProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$apiManagerHash();

  @$internal
  @override
  $ProviderElement<HttpApiManager> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  HttpApiManager create(Ref ref) {
    return apiManager(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(HttpApiManager value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<HttpApiManager>(value),
    );
  }
}

String _$apiManagerHash() => r'86ce07e403fd5f9a48ccd2651e277fec08d39477';
