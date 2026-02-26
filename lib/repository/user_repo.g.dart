// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(authRepo)
final authRepoProvider = AuthRepoProvider._();

final class AuthRepoProvider
    extends $FunctionalProvider<AuthRepo, AuthRepo, AuthRepo>
    with $Provider<AuthRepo> {
  AuthRepoProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'authRepoProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$authRepoHash();

  @$internal
  @override
  $ProviderElement<AuthRepo> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AuthRepo create(Ref ref) {
    return authRepo(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AuthRepo value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AuthRepo>(value),
    );
  }
}

String _$authRepoHash() => r'97ad17a1d489e0d3aa8886512915644a524a1af8';

@ProviderFor(loginUser)
final loginUserProvider = LoginUserFamily._();

final class LoginUserProvider extends $FunctionalProvider<AsyncValue<AppUser?>,
        AppUser?, FutureOr<AppUser?>>
    with $FutureModifier<AppUser?>, $FutureProvider<AppUser?> {
  LoginUserProvider._(
      {required LoginUserFamily super.from,
      required (
        String,
        String,
      )
          super.argument})
      : super(
          retry: null,
          name: r'loginUserProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$loginUserHash();

  @override
  String toString() {
    return r'loginUserProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<AppUser?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<AppUser?> create(Ref ref) {
    final argument = this.argument as (
      String,
      String,
    );
    return loginUser(
      ref,
      argument.$1,
      argument.$2,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is LoginUserProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$loginUserHash() => r'95c6eefc8a3812de181d508311d8fa3ce6914504';

final class LoginUserFamily extends $Family
    with
        $FunctionalFamilyOverride<
            FutureOr<AppUser?>,
            (
              String,
              String,
            )> {
  LoginUserFamily._()
      : super(
          retry: null,
          name: r'loginUserProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  LoginUserProvider call(
    String email,
    String password,
  ) =>
      LoginUserProvider._(argument: (
        email,
        password,
      ), from: this);

  @override
  String toString() => r'loginUserProvider';
}

@ProviderFor(registerUser)
final registerUserProvider = RegisterUserFamily._();

final class RegisterUserProvider extends $FunctionalProvider<
        AsyncValue<AppUser?>, AppUser?, FutureOr<AppUser?>>
    with $FutureModifier<AppUser?>, $FutureProvider<AppUser?> {
  RegisterUserProvider._(
      {required RegisterUserFamily super.from,
      required RegisterModel super.argument})
      : super(
          retry: null,
          name: r'registerUserProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$registerUserHash();

  @override
  String toString() {
    return r'registerUserProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<AppUser?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<AppUser?> create(Ref ref) {
    final argument = this.argument as RegisterModel;
    return registerUser(
      ref,
      argument,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is RegisterUserProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$registerUserHash() => r'd3536289e6051dceae6e528cf28030aa5a4011c9';

final class RegisterUserFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<AppUser?>, RegisterModel> {
  RegisterUserFamily._()
      : super(
          retry: null,
          name: r'registerUserProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  RegisterUserProvider call(
    RegisterModel model,
  ) =>
      RegisterUserProvider._(argument: model, from: this);

  @override
  String toString() => r'registerUserProvider';
}

@ProviderFor(fetchUser)
final fetchUserProvider = FetchUserProvider._();

final class FetchUserProvider
    extends $FunctionalProvider<AsyncValue<bool>, bool, FutureOr<bool>>
    with $FutureModifier<bool>, $FutureProvider<bool> {
  FetchUserProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'fetchUserProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$fetchUserHash();

  @$internal
  @override
  $FutureProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<bool> create(Ref ref) {
    return fetchUser(ref);
  }
}

String _$fetchUserHash() => r'41a69c9ceac0c5a8ca41c14f86d81e8b9e5dd7c8';

@ProviderFor(updateUser)
final updateUserProvider = UpdateUserFamily._();

final class UpdateUserProvider
    extends $FunctionalProvider<AsyncValue<bool>, bool, FutureOr<bool>>
    with $FutureModifier<bool>, $FutureProvider<bool> {
  UpdateUserProvider._(
      {required UpdateUserFamily super.from, required User super.argument})
      : super(
          retry: null,
          name: r'updateUserProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$updateUserHash();

  @override
  String toString() {
    return r'updateUserProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<bool> create(Ref ref) {
    final argument = this.argument as User;
    return updateUser(
      ref,
      argument,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is UpdateUserProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$updateUserHash() => r'6e09f6c67347edcae1e39a038ca65cc663905c9c';

final class UpdateUserFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<bool>, User> {
  UpdateUserFamily._()
      : super(
          retry: null,
          name: r'updateUserProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  UpdateUserProvider call(
    User user,
  ) =>
      UpdateUserProvider._(argument: user, from: this);

  @override
  String toString() => r'updateUserProvider';
}

@ProviderFor(updateProfile)
final updateProfileProvider = UpdateProfileFamily._();

final class UpdateProfileProvider
    extends $FunctionalProvider<AsyncValue<bool>, bool, FutureOr<bool>>
    with $FutureModifier<bool>, $FutureProvider<bool> {
  UpdateProfileProvider._(
      {required UpdateProfileFamily super.from, required File? super.argument})
      : super(
          retry: null,
          name: r'updateProfileProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$updateProfileHash();

  @override
  String toString() {
    return r'updateProfileProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<bool> create(Ref ref) {
    final argument = this.argument as File?;
    return updateProfile(
      ref,
      argument,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is UpdateProfileProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$updateProfileHash() => r'13c111f47f5d8cb7ef253793fe3f802821901f78';

final class UpdateProfileFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<bool>, File?> {
  UpdateProfileFamily._()
      : super(
          retry: null,
          name: r'updateProfileProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  UpdateProfileProvider call(
    File? file,
  ) =>
      UpdateProfileProvider._(argument: file, from: this);

  @override
  String toString() => r'updateProfileProvider';
}

@ProviderFor(fetchAllCustomFields)
final fetchAllCustomFieldsProvider = FetchAllCustomFieldsProvider._();

final class FetchAllCustomFieldsProvider extends $FunctionalProvider<
        AsyncValue<List<CustomFields>>,
        List<CustomFields>,
        FutureOr<List<CustomFields>>>
    with
        $FutureModifier<List<CustomFields>>,
        $FutureProvider<List<CustomFields>> {
  FetchAllCustomFieldsProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'fetchAllCustomFieldsProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$fetchAllCustomFieldsHash();

  @$internal
  @override
  $FutureProviderElement<List<CustomFields>> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<CustomFields>> create(Ref ref) {
    return fetchAllCustomFields(ref);
  }
}

String _$fetchAllCustomFieldsHash() =>
    r'd8f547f245c46bef12098ba1d946238ee1f16858';

@ProviderFor(updatePictureAndUser)
final updatePictureAndUserProvider = UpdatePictureAndUserFamily._();

final class UpdatePictureAndUserProvider extends $FunctionalProvider<
        AsyncValue<
            (
              bool?,
              bool?,
            )>,
        (
          bool?,
          bool?,
        ),
        FutureOr<
            (
              bool?,
              bool?,
            )>>
    with
        $FutureModifier<
            (
              bool?,
              bool?,
            )>,
        $FutureProvider<
            (
              bool?,
              bool?,
            )> {
  UpdatePictureAndUserProvider._(
      {required UpdatePictureAndUserFamily super.from,
      required (
        File?,
        User,
      )
          super.argument})
      : super(
          retry: null,
          name: r'updatePictureAndUserProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$updatePictureAndUserHash();

  @override
  String toString() {
    return r'updatePictureAndUserProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<
      (
        bool?,
        bool?,
      )> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<
      (
        bool?,
        bool?,
      )> create(Ref ref) {
    final argument = this.argument as (
      File?,
      User,
    );
    return updatePictureAndUser(
      ref,
      argument.$1,
      argument.$2,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is UpdatePictureAndUserProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$updatePictureAndUserHash() =>
    r'1d5641e3722bd159fbbc8e85cc398f6fdd62a79a';

final class UpdatePictureAndUserFamily extends $Family
    with
        $FunctionalFamilyOverride<
            FutureOr<
                (
                  bool?,
                  bool?,
                )>,
            (
              File?,
              User,
            )> {
  UpdatePictureAndUserFamily._()
      : super(
          retry: null,
          name: r'updatePictureAndUserProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  UpdatePictureAndUserProvider call(
    File? file,
    User user,
  ) =>
      UpdatePictureAndUserProvider._(argument: (
        file,
        user,
      ), from: this);

  @override
  String toString() => r'updatePictureAndUserProvider';
}

@ProviderFor(updatePassword)
final updatePasswordProvider = UpdatePasswordFamily._();

final class UpdatePasswordProvider
    extends $FunctionalProvider<AsyncValue<bool>, bool, FutureOr<bool>>
    with $FutureModifier<bool>, $FutureProvider<bool> {
  UpdatePasswordProvider._(
      {required UpdatePasswordFamily super.from,
      required ({
        String oldPassword,
        String newPassword,
      })
          super.argument})
      : super(
          retry: null,
          name: r'updatePasswordProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$updatePasswordHash();

  @override
  String toString() {
    return r'updatePasswordProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<bool> create(Ref ref) {
    final argument = this.argument as ({
      String oldPassword,
      String newPassword,
    });
    return updatePassword(
      ref,
      oldPassword: argument.oldPassword,
      newPassword: argument.newPassword,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is UpdatePasswordProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$updatePasswordHash() => r'a21d921bf0443cbc9cbbdd4f3357101361896c9f';

final class UpdatePasswordFamily extends $Family
    with
        $FunctionalFamilyOverride<
            FutureOr<bool>,
            ({
              String oldPassword,
              String newPassword,
            })> {
  UpdatePasswordFamily._()
      : super(
          retry: null,
          name: r'updatePasswordProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  UpdatePasswordProvider call({
    required String oldPassword,
    required String newPassword,
  }) =>
      UpdatePasswordProvider._(argument: (
        oldPassword: oldPassword,
        newPassword: newPassword,
      ), from: this);

  @override
  String toString() => r'updatePasswordProvider';
}

@ProviderFor(deleteAccount)
final deleteAccountProvider = DeleteAccountFamily._();

final class DeleteAccountProvider
    extends $FunctionalProvider<AsyncValue<bool>, bool, FutureOr<bool>>
    with $FutureModifier<bool>, $FutureProvider<bool> {
  DeleteAccountProvider._(
      {required DeleteAccountFamily super.from, required String super.argument})
      : super(
          retry: null,
          name: r'deleteAccountProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$deleteAccountHash();

  @override
  String toString() {
    return r'deleteAccountProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<bool> create(Ref ref) {
    final argument = this.argument as String;
    return deleteAccount(
      ref,
      password: argument,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is DeleteAccountProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$deleteAccountHash() => r'bbfa8a9b19d4fe69f1595787ff5a5ed24063352d';

final class DeleteAccountFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<bool>, String> {
  DeleteAccountFamily._()
      : super(
          retry: null,
          name: r'deleteAccountProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  DeleteAccountProvider call({
    required String password,
  }) =>
      DeleteAccountProvider._(argument: password, from: this);

  @override
  String toString() => r'deleteAccountProvider';
}

@ProviderFor(saveFCMToken)
final saveFCMTokenProvider = SaveFCMTokenFamily._();

final class SaveFCMTokenProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  SaveFCMTokenProvider._(
      {required SaveFCMTokenFamily super.from, required String super.argument})
      : super(
          retry: null,
          name: r'saveFCMTokenProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$saveFCMTokenHash();

  @override
  String toString() {
    return r'saveFCMTokenProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    final argument = this.argument as String;
    return saveFCMToken(
      ref,
      argument,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SaveFCMTokenProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$saveFCMTokenHash() => r'4b408ae7b37649a52490dc6e66fb567f71d6d7ed';

final class SaveFCMTokenFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<void>, String> {
  SaveFCMTokenFamily._()
      : super(
          retry: null,
          name: r'saveFCMTokenProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  SaveFCMTokenProvider call(
    String token,
  ) =>
      SaveFCMTokenProvider._(argument: token, from: this);

  @override
  String toString() => r'saveFCMTokenProvider';
}

@ProviderFor(recoverPassword)
final recoverPasswordProvider = RecoverPasswordFamily._();

final class RecoverPasswordProvider
    extends $FunctionalProvider<AsyncValue<bool?>, bool?, FutureOr<bool?>>
    with $FutureModifier<bool?>, $FutureProvider<bool?> {
  RecoverPasswordProvider._(
      {required RecoverPasswordFamily super.from,
      required String super.argument})
      : super(
          retry: null,
          name: r'recoverPasswordProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$recoverPasswordHash();

  @override
  String toString() {
    return r'recoverPasswordProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<bool?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<bool?> create(Ref ref) {
    final argument = this.argument as String;
    return recoverPassword(
      ref,
      argument,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is RecoverPasswordProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$recoverPasswordHash() => r'd22edd6fd6a381a697ff5c8772560a49cba099e1';

final class RecoverPasswordFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<bool?>, String> {
  RecoverPasswordFamily._()
      : super(
          retry: null,
          name: r'recoverPasswordProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  RecoverPasswordProvider call(
    String email,
  ) =>
      RecoverPasswordProvider._(argument: email, from: this);

  @override
  String toString() => r'recoverPasswordProvider';
}

@ProviderFor(updateRecoveryPassword)
final updateRecoveryPasswordProvider = UpdateRecoveryPasswordFamily._();

final class UpdateRecoveryPasswordProvider
    extends $FunctionalProvider<AsyncValue<bool?>, bool?, FutureOr<bool?>>
    with $FutureModifier<bool?>, $FutureProvider<bool?> {
  UpdateRecoveryPasswordProvider._(
      {required UpdateRecoveryPasswordFamily super.from,
      required ({
        String email,
        String password,
        String token,
      })
          super.argument})
      : super(
          retry: null,
          name: r'updateRecoveryPasswordProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$updateRecoveryPasswordHash();

  @override
  String toString() {
    return r'updateRecoveryPasswordProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<bool?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<bool?> create(Ref ref) {
    final argument = this.argument as ({
      String email,
      String password,
      String token,
    });
    return updateRecoveryPassword(
      ref,
      email: argument.email,
      password: argument.password,
      token: argument.token,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is UpdateRecoveryPasswordProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$updateRecoveryPasswordHash() =>
    r'b7436465de7e61f6c394f85dde095583ad244d7d';

final class UpdateRecoveryPasswordFamily extends $Family
    with
        $FunctionalFamilyOverride<
            FutureOr<bool?>,
            ({
              String email,
              String password,
              String token,
            })> {
  UpdateRecoveryPasswordFamily._()
      : super(
          retry: null,
          name: r'updateRecoveryPasswordProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  UpdateRecoveryPasswordProvider call({
    required String email,
    required String password,
    required String token,
  }) =>
      UpdateRecoveryPasswordProvider._(argument: (
        email: email,
        password: password,
        token: token,
      ), from: this);

  @override
  String toString() => r'updateRecoveryPasswordProvider';
}

@ProviderFor(fetchUserAssessment)
final fetchUserAssessmentProvider = FetchUserAssessmentFamily._();

final class FetchUserAssessmentProvider extends $FunctionalProvider<
        AsyncValue<UserAssessment>, UserAssessment, FutureOr<UserAssessment>>
    with $FutureModifier<UserAssessment>, $FutureProvider<UserAssessment> {
  FetchUserAssessmentProvider._(
      {required FetchUserAssessmentFamily super.from,
      required int super.argument})
      : super(
          retry: null,
          name: r'fetchUserAssessmentProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$fetchUserAssessmentHash();

  @override
  String toString() {
    return r'fetchUserAssessmentProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<UserAssessment> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<UserAssessment> create(Ref ref) {
    final argument = this.argument as int;
    return fetchUserAssessment(
      ref,
      id: argument,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is FetchUserAssessmentProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$fetchUserAssessmentHash() =>
    r'771f158811b7bbbe45afa475e197b06c56cf9d59';

final class FetchUserAssessmentFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<UserAssessment>, int> {
  FetchUserAssessmentFamily._()
      : super(
          retry: null,
          name: r'fetchUserAssessmentProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  FetchUserAssessmentProvider call({
    required int id,
  }) =>
      FetchUserAssessmentProvider._(argument: id, from: this);

  @override
  String toString() => r'fetchUserAssessmentProvider';
}

@ProviderFor(walletInfo)
final walletInfoProvider = WalletInfoProvider._();

final class WalletInfoProvider extends $FunctionalProvider<
        AsyncValue<List<WalletInfo>>,
        List<WalletInfo>,
        FutureOr<List<WalletInfo>>>
    with $FutureModifier<List<WalletInfo>>, $FutureProvider<List<WalletInfo>> {
  WalletInfoProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'walletInfoProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$walletInfoHash();

  @$internal
  @override
  $FutureProviderElement<List<WalletInfo>> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<WalletInfo>> create(Ref ref) {
    return walletInfo(ref);
  }
}

String _$walletInfoHash() => r'bfe5233d8c626c2c7b8b0a51786f95f536132cb8';

@ProviderFor(transactions)
final transactionsProvider = TransactionsProvider._();

final class TransactionsProvider extends $FunctionalProvider<
        AsyncValue<List<TransactionModel>>,
        List<TransactionModel>,
        FutureOr<List<TransactionModel>>>
    with
        $FutureModifier<List<TransactionModel>>,
        $FutureProvider<List<TransactionModel>> {
  TransactionsProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'transactionsProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$transactionsHash();

  @$internal
  @override
  $FutureProviderElement<List<TransactionModel>> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<TransactionModel>> create(Ref ref) {
    return transactions(ref);
  }
}

String _$transactionsHash() => r'dbf53bcfd7ac1204891efc75c52aa7e1aa60ee39';

@ProviderFor(fetchPlayersRanking)
final fetchPlayersRankingProvider = FetchPlayersRankingFamily._();

final class FetchPlayersRankingProvider extends $FunctionalProvider<
        AsyncValue<PlayersRanking>, PlayersRanking, FutureOr<PlayersRanking>>
    with $FutureModifier<PlayersRanking>, $FutureProvider<PlayersRanking> {
  FetchPlayersRankingProvider._(
      {required FetchPlayersRankingFamily super.from,
      required ({
        int page,
        int limit,
        String sportName,
      })
          super.argument})
      : super(
          retry: null,
          name: r'fetchPlayersRankingProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$fetchPlayersRankingHash();

  @override
  String toString() {
    return r'fetchPlayersRankingProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<PlayersRanking> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<PlayersRanking> create(Ref ref) {
    final argument = this.argument as ({
      int page,
      int limit,
      String sportName,
    });
    return fetchPlayersRanking(
      ref,
      page: argument.page,
      limit: argument.limit,
      sportName: argument.sportName,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is FetchPlayersRankingProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$fetchPlayersRankingHash() =>
    r'0f161df982d97b8b2fa87afdcb21100f26f869f1';

final class FetchPlayersRankingFamily extends $Family
    with
        $FunctionalFamilyOverride<
            FutureOr<PlayersRanking>,
            ({
              int page,
              int limit,
              String sportName,
            })> {
  FetchPlayersRankingFamily._()
      : super(
          retry: null,
          name: r'fetchPlayersRankingProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  FetchPlayersRankingProvider call({
    required int page,
    required int limit,
    required String sportName,
  }) =>
      FetchPlayersRankingProvider._(argument: (
        page: page,
        limit: limit,
        sportName: sportName,
      ), from: this);

  @override
  String toString() => r'fetchPlayersRankingProvider';
}

@ProviderFor(getUserMatchLevels)
final getUserMatchLevelsProvider = GetUserMatchLevelsFamily._();

final class GetUserMatchLevelsProvider extends $FunctionalProvider<
        AsyncValue<List<MatchLevel>>,
        List<MatchLevel>,
        FutureOr<List<MatchLevel>>>
    with $FutureModifier<List<MatchLevel>>, $FutureProvider<List<MatchLevel>> {
  GetUserMatchLevelsProvider._(
      {required GetUserMatchLevelsFamily super.from,
      required ({
        int userId,
        int matchNumber,
        String sportName,
      })
          super.argument})
      : super(
          retry: null,
          name: r'getUserMatchLevelsProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$getUserMatchLevelsHash();

  @override
  String toString() {
    return r'getUserMatchLevelsProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<List<MatchLevel>> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<MatchLevel>> create(Ref ref) {
    final argument = this.argument as ({
      int userId,
      int matchNumber,
      String sportName,
    });
    return getUserMatchLevels(
      ref,
      userId: argument.userId,
      matchNumber: argument.matchNumber,
      sportName: argument.sportName,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is GetUserMatchLevelsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$getUserMatchLevelsHash() =>
    r'972287ba8969ef7617c58f32eaaa6ff396abc860';

final class GetUserMatchLevelsFamily extends $Family
    with
        $FunctionalFamilyOverride<
            FutureOr<List<MatchLevel>>,
            ({
              int userId,
              int matchNumber,
              String sportName,
            })> {
  GetUserMatchLevelsFamily._()
      : super(
          retry: null,
          name: r'getUserMatchLevelsProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  GetUserMatchLevelsProvider call({
    required int userId,
    required int matchNumber,
    required String sportName,
  }) =>
      GetUserMatchLevelsProvider._(argument: (
        userId: userId,
        matchNumber: matchNumber,
        sportName: sportName,
      ), from: this);

  @override
  String toString() => r'getUserMatchLevelsProvider';
}

@ProviderFor(followFriend)
final followFriendProvider = FollowFriendFamily._();

final class FollowFriendProvider
    extends $FunctionalProvider<AsyncValue<bool>, bool, FutureOr<bool>>
    with $FutureModifier<bool>, $FutureProvider<bool> {
  FollowFriendProvider._(
      {required FollowFriendFamily super.from, required int super.argument})
      : super(
          retry: null,
          name: r'followFriendProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$followFriendHash();

  @override
  String toString() {
    return r'followFriendProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<bool> create(Ref ref) {
    final argument = this.argument as int;
    return followFriend(
      ref,
      userId: argument,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is FollowFriendProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$followFriendHash() => r'62af62e95e66451ef654710fa10e94ef1641fc79';

final class FollowFriendFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<bool>, int> {
  FollowFriendFamily._()
      : super(
          retry: null,
          name: r'followFriendProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  FollowFriendProvider call({
    required int userId,
  }) =>
      FollowFriendProvider._(argument: userId, from: this);

  @override
  String toString() => r'followFriendProvider';
}

@ProviderFor(unfollowFriend)
final unfollowFriendProvider = UnfollowFriendFamily._();

final class UnfollowFriendProvider
    extends $FunctionalProvider<AsyncValue<bool>, bool, FutureOr<bool>>
    with $FutureModifier<bool>, $FutureProvider<bool> {
  UnfollowFriendProvider._(
      {required UnfollowFriendFamily super.from, required int super.argument})
      : super(
          retry: null,
          name: r'unfollowFriendProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$unfollowFriendHash();

  @override
  String toString() {
    return r'unfollowFriendProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<bool> create(Ref ref) {
    final argument = this.argument as int;
    return unfollowFriend(
      ref,
      userId: argument,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is UnfollowFriendProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$unfollowFriendHash() => r'2626a72e7c4c3ad1c831b2f2d09008aa8e4b5f7b';

final class UnfollowFriendFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<bool>, int> {
  UnfollowFriendFamily._()
      : super(
          retry: null,
          name: r'unfollowFriendProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  UnfollowFriendProvider call({
    required int userId,
  }) =>
      UnfollowFriendProvider._(argument: userId, from: this);

  @override
  String toString() => r'unfollowFriendProvider';
}

@ProviderFor(checkFollowStatus)
final checkFollowStatusProvider = CheckFollowStatusFamily._();

final class CheckFollowStatusProvider
    extends $FunctionalProvider<AsyncValue<bool>, bool, FutureOr<bool>>
    with $FutureModifier<bool>, $FutureProvider<bool> {
  CheckFollowStatusProvider._(
      {required CheckFollowStatusFamily super.from,
      required int super.argument})
      : super(
          retry: null,
          name: r'checkFollowStatusProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$checkFollowStatusHash();

  @override
  String toString() {
    return r'checkFollowStatusProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<bool> create(Ref ref) {
    final argument = this.argument as int;
    return checkFollowStatus(
      ref,
      userId: argument,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is CheckFollowStatusProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$checkFollowStatusHash() => r'cc24d93d3429f1158f5cf1984f7ed6148af77ee9';

final class CheckFollowStatusFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<bool>, int> {
  CheckFollowStatusFamily._()
      : super(
          retry: null,
          name: r'checkFollowStatusProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  CheckFollowStatusProvider call({
    required int userId,
  }) =>
      CheckFollowStatusProvider._(argument: userId, from: this);

  @override
  String toString() => r'checkFollowStatusProvider';
}

@ProviderFor(getFollowingList)
final getFollowingListProvider = GetFollowingListProvider._();

final class GetFollowingListProvider extends $FunctionalProvider<
        AsyncValue<FollowList>, FollowList, FutureOr<FollowList>>
    with $FutureModifier<FollowList>, $FutureProvider<FollowList> {
  GetFollowingListProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'getFollowingListProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$getFollowingListHash();

  @$internal
  @override
  $FutureProviderElement<FollowList> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<FollowList> create(Ref ref) {
    return getFollowingList(ref);
  }
}

String _$getFollowingListHash() => r'63295dc0042f8c7105cefc76b20d6fca2934d216';

@ProviderFor(getFollowerList)
final getFollowerListProvider = GetFollowerListProvider._();

final class GetFollowerListProvider extends $FunctionalProvider<
        AsyncValue<FollowList>, FollowList, FutureOr<FollowList>>
    with $FutureModifier<FollowList>, $FutureProvider<FollowList> {
  GetFollowerListProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'getFollowerListProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$getFollowerListHash();

  @$internal
  @override
  $FutureProviderElement<FollowList> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<FollowList> create(Ref ref) {
    return getFollowerList(ref);
  }
}

String _$getFollowerListHash() => r'db2b30e6db83b3bd780cdd5c11c59ac844ba8eb5';

@ProviderFor(searchUsers)
final searchUsersProvider = SearchUsersFamily._();

final class SearchUsersProvider extends $FunctionalProvider<
        AsyncValue<UserSearchResponse>,
        UserSearchResponse,
        FutureOr<UserSearchResponse>>
    with
        $FutureModifier<UserSearchResponse>,
        $FutureProvider<UserSearchResponse> {
  SearchUsersProvider._(
      {required SearchUsersFamily super.from,
      required ({
        int page,
        int pageSize,
        String search,
      })
          super.argument})
      : super(
          retry: null,
          name: r'searchUsersProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$searchUsersHash();

  @override
  String toString() {
    return r'searchUsersProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<UserSearchResponse> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<UserSearchResponse> create(Ref ref) {
    final argument = this.argument as ({
      int page,
      int pageSize,
      String search,
    });
    return searchUsers(
      ref,
      page: argument.page,
      pageSize: argument.pageSize,
      search: argument.search,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SearchUsersProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$searchUsersHash() => r'3af45b0fa8fa0d7560cd08ff4a6a90b231fe6574';

final class SearchUsersFamily extends $Family
    with
        $FunctionalFamilyOverride<
            FutureOr<UserSearchResponse>,
            ({
              int page,
              int pageSize,
              String search,
            })> {
  SearchUsersFamily._()
      : super(
          retry: null,
          name: r'searchUsersProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  SearchUsersProvider call({
    required int page,
    required int pageSize,
    required String search,
  }) =>
      SearchUsersProvider._(argument: (
        page: page,
        pageSize: pageSize,
        search: search,
      ), from: this);

  @override
  String toString() => r'searchUsersProvider';
}
