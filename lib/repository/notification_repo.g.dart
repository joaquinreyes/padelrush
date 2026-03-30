// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(notificationRepo)
final notificationRepoProvider = NotificationRepoProvider._();

final class NotificationRepoProvider extends $FunctionalProvider<
    NotificationRepo,
    NotificationRepo,
    NotificationRepo> with $Provider<NotificationRepo> {
  NotificationRepoProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'notificationRepoProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$notificationRepoHash();

  @$internal
  @override
  $ProviderElement<NotificationRepo> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  NotificationRepo create(Ref ref) {
    return notificationRepo(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(NotificationRepo value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<NotificationRepo>(value),
    );
  }
}

String _$notificationRepoHash() => r'70ef1a1fbebb6220da9963064026928b9c59fa7f';

@ProviderFor(fetchNotifications)
final fetchNotificationsProvider = FetchNotificationsFamily._();

final class FetchNotificationsProvider extends $FunctionalProvider<
        AsyncValue<List<InAppNotification>>,
        List<InAppNotification>,
        FutureOr<List<InAppNotification>>>
    with
        $FutureModifier<List<InAppNotification>>,
        $FutureProvider<List<InAppNotification>> {
  FetchNotificationsProvider._(
      {required FetchNotificationsFamily super.from,
      required ({
        int limit,
        int offset,
      })
          super.argument})
      : super(
          retry: null,
          name: r'fetchNotificationsProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$fetchNotificationsHash();

  @override
  String toString() {
    return r'fetchNotificationsProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<List<InAppNotification>> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<InAppNotification>> create(Ref ref) {
    final argument = this.argument as ({
      int limit,
      int offset,
    });
    return fetchNotifications(
      ref,
      limit: argument.limit,
      offset: argument.offset,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is FetchNotificationsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$fetchNotificationsHash() =>
    r'3c6404a7e9d6711f777f952ebbd55d64071e6d2e';

final class FetchNotificationsFamily extends $Family
    with
        $FunctionalFamilyOverride<
            FutureOr<List<InAppNotification>>,
            ({
              int limit,
              int offset,
            })> {
  FetchNotificationsFamily._()
      : super(
          retry: null,
          name: r'fetchNotificationsProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  FetchNotificationsProvider call({
    int limit = 20,
    int offset = 0,
  }) =>
      FetchNotificationsProvider._(argument: (
        limit: limit,
        offset: offset,
      ), from: this);

  @override
  String toString() => r'fetchNotificationsProvider';
}

@ProviderFor(NotificationUnreadCount)
final notificationUnreadCountProvider = NotificationUnreadCountProvider._();

final class NotificationUnreadCountProvider
    extends $AsyncNotifierProvider<NotificationUnreadCount, int> {
  NotificationUnreadCountProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'notificationUnreadCountProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$notificationUnreadCountHash();

  @$internal
  @override
  NotificationUnreadCount create() => NotificationUnreadCount();
}

String _$notificationUnreadCountHash() =>
    r'7cc3123d767f592c0cc0bd3f118ade17eebd9f8f';

abstract class _$NotificationUnreadCount extends $AsyncNotifier<int> {
  FutureOr<int> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<int>, int>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<int>, int>, AsyncValue<int>, Object?, Object?>;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(markNotificationAsRead)
final markNotificationAsReadProvider = MarkNotificationAsReadFamily._();

final class MarkNotificationAsReadProvider
    extends $FunctionalProvider<AsyncValue<bool>, bool, FutureOr<bool>>
    with $FutureModifier<bool>, $FutureProvider<bool> {
  MarkNotificationAsReadProvider._(
      {required MarkNotificationAsReadFamily super.from,
      required String super.argument})
      : super(
          retry: null,
          name: r'markNotificationAsReadProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$markNotificationAsReadHash();

  @override
  String toString() {
    return r'markNotificationAsReadProvider'
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
    return markNotificationAsRead(
      ref,
      argument,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is MarkNotificationAsReadProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$markNotificationAsReadHash() =>
    r'23a8dd48952cc33a3910071345f41ab181cc1650';

final class MarkNotificationAsReadFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<bool>, String> {
  MarkNotificationAsReadFamily._()
      : super(
          retry: null,
          name: r'markNotificationAsReadProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  MarkNotificationAsReadProvider call(
    String notificationId,
  ) =>
      MarkNotificationAsReadProvider._(argument: notificationId, from: this);

  @override
  String toString() => r'markNotificationAsReadProvider';
}

@ProviderFor(markAllNotificationsAsRead)
final markAllNotificationsAsReadProvider =
    MarkAllNotificationsAsReadProvider._();

final class MarkAllNotificationsAsReadProvider
    extends $FunctionalProvider<AsyncValue<bool>, bool, FutureOr<bool>>
    with $FutureModifier<bool>, $FutureProvider<bool> {
  MarkAllNotificationsAsReadProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'markAllNotificationsAsReadProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$markAllNotificationsAsReadHash();

  @$internal
  @override
  $FutureProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<bool> create(Ref ref) {
    return markAllNotificationsAsRead(ref);
  }
}

String _$markAllNotificationsAsReadHash() =>
    r'656f2854e59f55f1af70f07f848caaa1de5a85e1';

@ProviderFor(deleteNotification)
final deleteNotificationProvider = DeleteNotificationFamily._();

final class DeleteNotificationProvider
    extends $FunctionalProvider<AsyncValue<bool>, bool, FutureOr<bool>>
    with $FutureModifier<bool>, $FutureProvider<bool> {
  DeleteNotificationProvider._(
      {required DeleteNotificationFamily super.from,
      required String super.argument})
      : super(
          retry: null,
          name: r'deleteNotificationProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$deleteNotificationHash();

  @override
  String toString() {
    return r'deleteNotificationProvider'
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
    return deleteNotification(
      ref,
      argument,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is DeleteNotificationProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$deleteNotificationHash() =>
    r'6749a6fb2dfb4d5a840c4570949dc222fefc24fd';

final class DeleteNotificationFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<bool>, String> {
  DeleteNotificationFamily._()
      : super(
          retry: null,
          name: r'deleteNotificationProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  DeleteNotificationProvider call(
    String notificationId,
  ) =>
      DeleteNotificationProvider._(argument: notificationId, from: this);

  @override
  String toString() => r'deleteNotificationProvider';
}

@ProviderFor(clearAllNotifications)
final clearAllNotificationsProvider = ClearAllNotificationsProvider._();

final class ClearAllNotificationsProvider
    extends $FunctionalProvider<AsyncValue<bool>, bool, FutureOr<bool>>
    with $FutureModifier<bool>, $FutureProvider<bool> {
  ClearAllNotificationsProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'clearAllNotificationsProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$clearAllNotificationsHash();

  @$internal
  @override
  $FutureProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<bool> create(Ref ref) {
    return clearAllNotifications(ref);
  }
}

String _$clearAllNotificationsHash() =>
    r'e42143b1838242fee62cc5b4382fa2096a4f232b';
