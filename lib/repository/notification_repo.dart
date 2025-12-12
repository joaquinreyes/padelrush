import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:hop/globals/api_endpoints.dart';
import 'package:hop/managers/api_manager.dart';
import 'package:hop/managers/user_manager.dart';
import 'package:hop/models/in_app_notification.dart';

part 'notification_repo.g.dart';

class NotificationRepo {
  Future<List<InAppNotification>> fetchNotifications(
    Ref ref, {
    int limit = 20,
    int offset = 0,
  }) async {
    try {
      final apiManager = ref.read(apiManagerProvider);
      final token = ref.read(userManagerProvider).user?.accessToken;
      final response = await apiManager.get(
        ref,
        ApiEndPoint.notifications,
        token: token,
        queryParams: {
          'limit': limit,
          'offset': offset,
        },
      );
      if (response['data'] != null) {
        return (response['data'] as List)
            .map((e) => InAppNotification.fromJson(e))
            .toList();
      }
      return [];
    } catch (e) {
      if (e is Map<String, dynamic>) {
        throw e['message'] ?? e;
      }
      rethrow;
    }
  }

  Future<int> fetchUnreadCount(Ref ref) async {
    try {
      final apiManager = ref.read(apiManagerProvider);
      final token = ref.read(userManagerProvider).user?.accessToken;
      final response = await apiManager.get(
        ref,
        ApiEndPoint.notificationsUnreadCount,
        token: token,
      );
      if (response['data'] != null) {
        return response['data']['unread_count'] ?? 0;
      }
      return 0;
    } catch (e) {
      if (e is Map<String, dynamic>) {
        throw e['message'] ?? e;
      }
      rethrow;
    }
  }

  Future<bool> markAsRead(Ref ref, String notificationId) async {
    try {
      final apiManager = ref.read(apiManagerProvider);
      final token = ref.read(userManagerProvider).user?.accessToken;
      await apiManager.patch(
        ref,
        ApiEndPoint.notificationMarkAsRead,
        {},
        token: token,
        pathParams: [notificationId],
      );
      return true;
    } catch (e) {
      if (e is Map<String, dynamic>) {
        throw e['message'] ?? e;
      }
      rethrow;
    }
  }

  Future<bool> markAllAsRead(Ref ref) async {
    try {
      final apiManager = ref.read(apiManagerProvider);
      final token = ref.read(userManagerProvider).user?.accessToken;
      await apiManager.patch(
        ref,
        ApiEndPoint.notificationMarkAllAsRead,
        {},
        token: token,
      );
      return true;
    } catch (e) {
      if (e is Map<String, dynamic>) {
        throw e['message'] ?? e;
      }
      rethrow;
    }
  }

  Future<bool> deleteNotification(Ref ref, String notificationId) async {
    try {
      final apiManager = ref.read(apiManagerProvider);
      final token = ref.read(userManagerProvider).user?.accessToken;
      await apiManager.delete(
        ref,
        ApiEndPoint.notificationDelete,
        token: token,
        pathParams: [notificationId],
      );
      return true;
    } catch (e) {
      if (e is Map<String, dynamic>) {
        throw e['message'] ?? e;
      }
      rethrow;
    }
  }

  Future<bool> clearAllNotifications(Ref ref) async {
    try {
      final apiManager = ref.read(apiManagerProvider);
      final token = ref.read(userManagerProvider).user?.accessToken;
      await apiManager.delete(
        ref,
        ApiEndPoint.notificationClearAll,
        token: token,
      );
      return true;
    } catch (e) {
      if (e is Map<String, dynamic>) {
        throw e['message'] ?? e;
      }
      rethrow;
    }
  }
}

@Riverpod(keepAlive: true)
NotificationRepo notificationRepo(Ref ref) {
  return NotificationRepo();
}

@riverpod
Future<List<InAppNotification>> fetchNotifications(
  Ref ref, {
  int limit = 20,
  int offset = 0,
}) async {
  return ref.watch(notificationRepoProvider).fetchNotifications(
        ref,
        limit: limit,
        offset: offset,
      );
}

@Riverpod(keepAlive: true)
class NotificationUnreadCount extends _$NotificationUnreadCount {
  @override
  Future<int> build() async {
    return ref.watch(notificationRepoProvider).fetchUnreadCount(ref);
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() =>
        ref.read(notificationRepoProvider).fetchUnreadCount(ref));
  }

  void decrement() {
    state.whenData((count) {
      if (count > 0) {
        state = AsyncValue.data(count - 1);
      }
    });
  }

  void reset() {
    state = const AsyncValue.data(0);
  }
}

@riverpod
Future<bool> markNotificationAsRead(Ref ref, String notificationId) async {
  final result = await ref
      .watch(notificationRepoProvider)
      .markAsRead(ref, notificationId);
  if (result) {
    ref.read(notificationUnreadCountProvider.notifier).decrement();
  }
  return result;
}

@riverpod
Future<bool> markAllNotificationsAsRead(Ref ref) async {
  final result =
      await ref.watch(notificationRepoProvider).markAllAsRead(ref);
  if (result) {
    ref.read(notificationUnreadCountProvider.notifier).reset();
  }
  return result;
}

@riverpod
Future<bool> deleteNotification(Ref ref, String notificationId) async {
  return ref
      .watch(notificationRepoProvider)
      .deleteNotification(ref, notificationId);
}

@riverpod
Future<bool> clearAllNotifications(Ref ref) async {
  final result =
      await ref.watch(notificationRepoProvider).clearAllNotifications(ref);
  if (result) {
    ref.read(notificationUnreadCountProvider.notifier).reset();
  }
  return result;
}
