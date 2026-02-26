// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signin_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(test)
final testProvider = TestProvider._();

final class TestProvider
    extends $FunctionalProvider<AsyncValue<bool>, bool, FutureOr<bool>>
    with $FutureModifier<bool>, $FutureProvider<bool> {
  TestProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'testProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$testHash();

  @$internal
  @override
  $FutureProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<bool> create(Ref ref) {
    return test(ref);
  }
}

String _$testHash() => r'5a8449b7c3cea23725e341bc26da01b27f7cb610';

@ProviderFor(test2)
final test2Provider = Test2Provider._();

final class Test2Provider
    extends $FunctionalProvider<AsyncValue<String>, String, FutureOr<String>>
    with $FutureModifier<String>, $FutureProvider<String> {
  Test2Provider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'test2Provider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$test2Hash();

  @$internal
  @override
  $FutureProviderElement<String> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<String> create(Ref ref) {
    return test2(ref);
  }
}

String _$test2Hash() => r'7bc542ff33dd7afe42eae0af9a41c9c8d1f7d447';
