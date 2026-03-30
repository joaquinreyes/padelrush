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

String _$userManagerHash() => r'b68aeef9dcd5d5c04196c952c366fa5d6ed212ca';

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

String _$isAuthenticatedHash() => r'1464431722f0452d193a0aedf274b007900820a7';
