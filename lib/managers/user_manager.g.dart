// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_manager.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(userManager)
final userManagerProvider = UserManagerProvider._();

final class UserManagerProvider
    extends $FunctionalProvider<UserManager, UserManager, UserManager>
    with $Provider<UserManager> {
  UserManagerProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'userManagerProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$userManagerHash();

  @$internal
  @override
  $ProviderElement<UserManager> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  UserManager create(Ref ref) {
    return userManager(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UserManager value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UserManager>(value),
    );
  }
}

String _$userManagerHash() => r'8e60d72a3fb90dd5f0419c90b24e2b90b3f8cee7';

@ProviderFor(isAuthenticated)
final isAuthenticatedProvider = IsAuthenticatedProvider._();

final class IsAuthenticatedProvider
    extends $FunctionalProvider<AsyncValue<bool>, bool, FutureOr<bool>>
    with $FutureModifier<bool>, $FutureProvider<bool> {
  IsAuthenticatedProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'isAuthenticatedProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$isAuthenticatedHash();

  @$internal
  @override
  $FutureProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<bool> create(Ref ref) {
    return isAuthenticated(ref);
  }
}

String _$isAuthenticatedHash() => r'e58b9a8b92f56f010e9997498a58f15a9db705c5';
