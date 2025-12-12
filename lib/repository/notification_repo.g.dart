// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$notificationRepoHash() => r'69a0d7756797d298627c9f15c0ef935ce2c4354d';

/// See also [notificationRepo].
@ProviderFor(notificationRepo)
final notificationRepoProvider = Provider<NotificationRepo>.internal(
  notificationRepo,
  name: r'notificationRepoProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$notificationRepoHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef NotificationRepoRef = ProviderRef<NotificationRepo>;
String _$fetchNotificationsHash() =>
    r'b300b403f07f4a7867421eb12f5428651c1169f6';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [fetchNotifications].
@ProviderFor(fetchNotifications)
const fetchNotificationsProvider = FetchNotificationsFamily();

/// See also [fetchNotifications].
class FetchNotificationsFamily extends Family {
  /// See also [fetchNotifications].
  const FetchNotificationsFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'fetchNotificationsProvider';

  /// See also [fetchNotifications].
  FetchNotificationsProvider call({
    int limit = 20,
    int offset = 0,
  }) {
    return FetchNotificationsProvider(
      limit: limit,
      offset: offset,
    );
  }

  @visibleForOverriding
  @override
  FetchNotificationsProvider getProviderOverride(
    covariant FetchNotificationsProvider provider,
  ) {
    return call(
      limit: provider.limit,
      offset: provider.offset,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(
      FutureOr<List<InAppNotification>> Function(FetchNotificationsRef ref)
          create) {
    return _$FetchNotificationsFamilyOverride(this, create);
  }
}

class _$FetchNotificationsFamilyOverride implements FamilyOverride {
  _$FetchNotificationsFamilyOverride(this.overriddenFamily, this.create);

  final FutureOr<List<InAppNotification>> Function(FetchNotificationsRef ref)
      create;

  @override
  final FetchNotificationsFamily overriddenFamily;

  @override
  FetchNotificationsProvider getProviderOverride(
    covariant FetchNotificationsProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// See also [fetchNotifications].
class FetchNotificationsProvider
    extends AutoDisposeFutureProvider<List<InAppNotification>> {
  /// See also [fetchNotifications].
  FetchNotificationsProvider({
    int limit = 20,
    int offset = 0,
  }) : this._internal(
          (ref) => fetchNotifications(
            ref as FetchNotificationsRef,
            limit: limit,
            offset: offset,
          ),
          from: fetchNotificationsProvider,
          name: r'fetchNotificationsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchNotificationsHash,
          dependencies: FetchNotificationsFamily._dependencies,
          allTransitiveDependencies:
              FetchNotificationsFamily._allTransitiveDependencies,
          limit: limit,
          offset: offset,
        );

  FetchNotificationsProvider._internal(
    super.create, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.limit,
    required this.offset,
  }) : super.internal();

  final int limit;
  final int offset;

  @override
  Override overrideWith(
    FutureOr<List<InAppNotification>> Function(FetchNotificationsRef ref)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchNotificationsProvider._internal(
        (ref) => create(ref as FetchNotificationsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        limit: limit,
        offset: offset,
      ),
    );
  }

  @override
  ({
    int limit,
    int offset,
  }) get argument {
    return (
      limit: limit,
      offset: offset,
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<InAppNotification>> createElement() {
    return _FetchNotificationsProviderElement(this);
  }

  FetchNotificationsProvider _copyWith(
    FutureOr<List<InAppNotification>> Function(FetchNotificationsRef ref)
        create,
  ) {
    return FetchNotificationsProvider._internal(
      (ref) => create(ref as FetchNotificationsRef),
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      limit: limit,
      offset: offset,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is FetchNotificationsProvider &&
        other.limit == limit &&
        other.offset == offset;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, limit.hashCode);
    hash = _SystemHash.combine(hash, offset.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FetchNotificationsRef
    on AutoDisposeFutureProviderRef<List<InAppNotification>> {
  /// The parameter `limit` of this provider.
  int get limit;

  /// The parameter `offset` of this provider.
  int get offset;
}

class _FetchNotificationsProviderElement
    extends AutoDisposeFutureProviderElement<List<InAppNotification>>
    with FetchNotificationsRef {
  _FetchNotificationsProviderElement(super.provider);

  @override
  int get limit => (origin as FetchNotificationsProvider).limit;
  @override
  int get offset => (origin as FetchNotificationsProvider).offset;
}

String _$markNotificationAsReadHash() =>
    r'029c2af4b7ae177722a6ab425e8652788bbade06';

/// See also [markNotificationAsRead].
@ProviderFor(markNotificationAsRead)
const markNotificationAsReadProvider = MarkNotificationAsReadFamily();

/// See also [markNotificationAsRead].
class MarkNotificationAsReadFamily extends Family {
  /// See also [markNotificationAsRead].
  const MarkNotificationAsReadFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'markNotificationAsReadProvider';

  /// See also [markNotificationAsRead].
  MarkNotificationAsReadProvider call(
    String notificationId,
  ) {
    return MarkNotificationAsReadProvider(
      notificationId,
    );
  }

  @visibleForOverriding
  @override
  MarkNotificationAsReadProvider getProviderOverride(
    covariant MarkNotificationAsReadProvider provider,
  ) {
    return call(
      provider.notificationId,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(
      FutureOr<bool> Function(MarkNotificationAsReadRef ref) create) {
    return _$MarkNotificationAsReadFamilyOverride(this, create);
  }
}

class _$MarkNotificationAsReadFamilyOverride implements FamilyOverride {
  _$MarkNotificationAsReadFamilyOverride(this.overriddenFamily, this.create);

  final FutureOr<bool> Function(MarkNotificationAsReadRef ref) create;

  @override
  final MarkNotificationAsReadFamily overriddenFamily;

  @override
  MarkNotificationAsReadProvider getProviderOverride(
    covariant MarkNotificationAsReadProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// See also [markNotificationAsRead].
class MarkNotificationAsReadProvider extends AutoDisposeFutureProvider<bool> {
  /// See also [markNotificationAsRead].
  MarkNotificationAsReadProvider(
    String notificationId,
  ) : this._internal(
          (ref) => markNotificationAsRead(
            ref as MarkNotificationAsReadRef,
            notificationId,
          ),
          from: markNotificationAsReadProvider,
          name: r'markNotificationAsReadProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$markNotificationAsReadHash,
          dependencies: MarkNotificationAsReadFamily._dependencies,
          allTransitiveDependencies:
              MarkNotificationAsReadFamily._allTransitiveDependencies,
          notificationId: notificationId,
        );

  MarkNotificationAsReadProvider._internal(
    super.create, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.notificationId,
  }) : super.internal();

  final String notificationId;

  @override
  Override overrideWith(
    FutureOr<bool> Function(MarkNotificationAsReadRef ref) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: MarkNotificationAsReadProvider._internal(
        (ref) => create(ref as MarkNotificationAsReadRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        notificationId: notificationId,
      ),
    );
  }

  @override
  (String,) get argument {
    return (notificationId,);
  }

  @override
  AutoDisposeFutureProviderElement<bool> createElement() {
    return _MarkNotificationAsReadProviderElement(this);
  }

  MarkNotificationAsReadProvider _copyWith(
    FutureOr<bool> Function(MarkNotificationAsReadRef ref) create,
  ) {
    return MarkNotificationAsReadProvider._internal(
      (ref) => create(ref as MarkNotificationAsReadRef),
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      notificationId: notificationId,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is MarkNotificationAsReadProvider &&
        other.notificationId == notificationId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, notificationId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin MarkNotificationAsReadRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `notificationId` of this provider.
  String get notificationId;
}

class _MarkNotificationAsReadProviderElement
    extends AutoDisposeFutureProviderElement<bool>
    with MarkNotificationAsReadRef {
  _MarkNotificationAsReadProviderElement(super.provider);

  @override
  String get notificationId =>
      (origin as MarkNotificationAsReadProvider).notificationId;
}

String _$markAllNotificationsAsReadHash() =>
    r'fba582f14fc1c701644fea0966ba307d1fb6ed21';

/// See also [markAllNotificationsAsRead].
@ProviderFor(markAllNotificationsAsRead)
final markAllNotificationsAsReadProvider =
    AutoDisposeFutureProvider<bool>.internal(
  markAllNotificationsAsRead,
  name: r'markAllNotificationsAsReadProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$markAllNotificationsAsReadHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef MarkAllNotificationsAsReadRef = AutoDisposeFutureProviderRef<bool>;
String _$deleteNotificationHash() =>
    r'b6588d1cfb81c0aabf958ed0499e259a5168381f';

/// See also [deleteNotification].
@ProviderFor(deleteNotification)
const deleteNotificationProvider = DeleteNotificationFamily();

/// See also [deleteNotification].
class DeleteNotificationFamily extends Family {
  /// See also [deleteNotification].
  const DeleteNotificationFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'deleteNotificationProvider';

  /// See also [deleteNotification].
  DeleteNotificationProvider call(
    String notificationId,
  ) {
    return DeleteNotificationProvider(
      notificationId,
    );
  }

  @visibleForOverriding
  @override
  DeleteNotificationProvider getProviderOverride(
    covariant DeleteNotificationProvider provider,
  ) {
    return call(
      provider.notificationId,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(
      FutureOr<bool> Function(DeleteNotificationRef ref) create) {
    return _$DeleteNotificationFamilyOverride(this, create);
  }
}

class _$DeleteNotificationFamilyOverride implements FamilyOverride {
  _$DeleteNotificationFamilyOverride(this.overriddenFamily, this.create);

  final FutureOr<bool> Function(DeleteNotificationRef ref) create;

  @override
  final DeleteNotificationFamily overriddenFamily;

  @override
  DeleteNotificationProvider getProviderOverride(
    covariant DeleteNotificationProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// See also [deleteNotification].
class DeleteNotificationProvider extends AutoDisposeFutureProvider<bool> {
  /// See also [deleteNotification].
  DeleteNotificationProvider(
    String notificationId,
  ) : this._internal(
          (ref) => deleteNotification(
            ref as DeleteNotificationRef,
            notificationId,
          ),
          from: deleteNotificationProvider,
          name: r'deleteNotificationProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$deleteNotificationHash,
          dependencies: DeleteNotificationFamily._dependencies,
          allTransitiveDependencies:
              DeleteNotificationFamily._allTransitiveDependencies,
          notificationId: notificationId,
        );

  DeleteNotificationProvider._internal(
    super.create, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.notificationId,
  }) : super.internal();

  final String notificationId;

  @override
  Override overrideWith(
    FutureOr<bool> Function(DeleteNotificationRef ref) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DeleteNotificationProvider._internal(
        (ref) => create(ref as DeleteNotificationRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        notificationId: notificationId,
      ),
    );
  }

  @override
  (String,) get argument {
    return (notificationId,);
  }

  @override
  AutoDisposeFutureProviderElement<bool> createElement() {
    return _DeleteNotificationProviderElement(this);
  }

  DeleteNotificationProvider _copyWith(
    FutureOr<bool> Function(DeleteNotificationRef ref) create,
  ) {
    return DeleteNotificationProvider._internal(
      (ref) => create(ref as DeleteNotificationRef),
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      notificationId: notificationId,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is DeleteNotificationProvider &&
        other.notificationId == notificationId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, notificationId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DeleteNotificationRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `notificationId` of this provider.
  String get notificationId;
}

class _DeleteNotificationProviderElement
    extends AutoDisposeFutureProviderElement<bool> with DeleteNotificationRef {
  _DeleteNotificationProviderElement(super.provider);

  @override
  String get notificationId =>
      (origin as DeleteNotificationProvider).notificationId;
}

String _$clearAllNotificationsHash() =>
    r'3433d166325725dca1d243f493a41495aafba9aa';

/// See also [clearAllNotifications].
@ProviderFor(clearAllNotifications)
final clearAllNotificationsProvider = AutoDisposeFutureProvider<bool>.internal(
  clearAllNotifications,
  name: r'clearAllNotificationsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$clearAllNotificationsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ClearAllNotificationsRef = AutoDisposeFutureProviderRef<bool>;
String _$notificationUnreadCountHash() =>
    r'7cc3123d767f592c0cc0bd3f118ade17eebd9f8f';

/// See also [NotificationUnreadCount].
@ProviderFor(NotificationUnreadCount)
final notificationUnreadCountProvider =
    AsyncNotifierProvider<NotificationUnreadCount, int>.internal(
  NotificationUnreadCount.new,
  name: r'notificationUnreadCountProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$notificationUnreadCountHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$NotificationUnreadCount = AsyncNotifier<int>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
