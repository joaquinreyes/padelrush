import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:padelrush/app_styles/app_colors.dart';
import 'package:padelrush/app_styles/app_text_styles.dart';
import 'package:padelrush/components/secondary_button.dart';
import 'package:padelrush/globals/current_platform.dart';
import 'package:padelrush/globals/images.dart';
import 'package:padelrush/models/in_app_notification.dart';
import 'package:padelrush/repository/notification_repo.dart';
import 'package:padelrush/routes/app_pages.dart';
import 'package:padelrush/routes/app_routes.dart';
import 'package:padelrush/utils/custom_extensions.dart';
import 'package:padelrush/widgets/background_view.dart';

part 'notification_components.dart';

class NotificationScreen extends ConsumerStatefulWidget {
  const NotificationScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _NotificationScreenState();
}

class _NotificationScreenState extends ConsumerState<NotificationScreen> {
  final List<InAppNotification> _notifications = [];
  bool _isLoading = true;
  bool _isLoadingMore = false;
  bool _hasMore = true;
  String? _error;
  final ScrollController _scrollController = ScrollController();
  static const int _pageSize = 20;

  @override
  void initState() {
    super.initState();
    _loadNotifications();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent * 0.8 &&
        !_isLoadingMore &&
        _hasMore) {
      _loadMoreNotifications();
    }
  }

  Future<void> _loadNotifications() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final notifications = await ref.read(
        fetchNotificationsProvider(limit: _pageSize, offset: 0).future,
      );
      setState(() {
        _notifications.clear();
        _notifications.addAll(notifications);
        _isLoading = false;
        _hasMore = notifications.length >= _pageSize;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
        _error = e.toString();
      });
    }
  }

  Future<void> _loadMoreNotifications() async {
    if (_isLoadingMore) return;

    setState(() {
      _isLoadingMore = true;
    });

    try {
      final notifications = await ref.read(
        fetchNotificationsProvider(
          limit: _pageSize,
          offset: _notifications.length,
        ).future,
      );
      setState(() {
        _notifications.addAll(notifications);
        _isLoadingMore = false;
        _hasMore = notifications.length >= _pageSize;
      });
    } catch (e) {
      setState(() {
        _isLoadingMore = false;
      });
    }
  }

  Future<void> _onRefresh() async {
    await _loadNotifications();
    ref.read(notificationUnreadCountProvider.notifier).refresh();
  }

  Future<void> _clearAllNotifications() async {
    try {
      final success = await ref.read(clearAllNotificationsProvider.future);
      if (success) {
        setState(() {
          _notifications.clear();
        });
        ref.read(notificationUnreadCountProvider.notifier).reset();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.toString())),
        );
      }
    }
  }

  Future<void> _deleteNotification(String id, int index) async {
    try {
      final success = await ref.read(deleteNotificationProvider(id).future);
      if (success) {
        final wasUnread = _notifications[index].isRead == false;
        setState(() {
          _notifications.removeAt(index);
        });
        if (wasUnread) {
          ref.read(notificationUnreadCountProvider.notifier).decrement();
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.toString())),
        );
      }
    }
  }

  Future<void> _markAsRead(String id, int index) async {
    if (_notifications[index].isRead == true) return;

    try {
      final success =
          await ref.read(markNotificationAsReadProvider(id).future);
      if (success) {
        setState(() {
          _notifications[index].isRead = true;
        });
        ref.read(notificationUnreadCountProvider.notifier).decrement();
      }
    } catch (e) {
      // Silent fail for mark as read
    }
  }

  void _handleNotificationTap(InAppNotification notification, int index) {
    if (notification.id != null) {
      _markAsRead(notification.id!, index);
    }

    final serviceBookingId = notification.serviceBookingId;
    if (serviceBookingId == null) return;

    final serviceType = notification.serviceType;
    final bookingType = notification.bookingType;

    if (serviceType == "Booking") {
      if (bookingType == "Open Match") {
        ref
            .read(goRouterProvider)
            .push("${RouteNames.match_info}/$serviceBookingId");
      } else {
        ref
            .read(goRouterProvider)
            .push("${RouteNames.bookingInfo}/$serviceBookingId");
      }
    } else if (serviceType == "Event") {
      ref
          .read(goRouterProvider)
          .push("${RouteNames.event_info}/$serviceBookingId");
    } else if (serviceType == "Lesson") {
      ref
          .read(goRouterProvider)
          .push("${RouteNames.lesson_info}/$serviceBookingId");
    }
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundView(
      child: Scaffold(
        backgroundColor: AppColors.transparentColor,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.5.w),
            child: Column(
              children: [
                SizedBox(height: 24.h),
                if (!PlatformC().isCurrentDesignPlatformDesktop)
                  Align(
                    alignment: Alignment.centerLeft,
                    child: InkWell(
                      onTap: () => ref.read(goRouterProvider).pop(),
                      child: Image.asset(
                        AppImages.back_arrow_new.path,
                        height: 20.h,
                        width: 20.h,
                      ),
                    ),
                  ),
                Text(
                  "NOTIFICATIONS".trU(context),
                  style: AppTextStyles.qanelasMedium(
                    fontSize: 22.sp,
                  ),
                ),
                SizedBox(height: 10.h),
                if (_notifications.isNotEmpty)
                  _ClearAllBtn(onTap: _clearAllNotifications),
                SizedBox(height: 15.h),
                Expanded(
                  child: _buildContent(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContent() {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_error != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_error!, style: AppTextStyles.qanelasSemiBold(fontSize: 13.sp)),
            SizedBox(height: 16.h),
            TextButton(
              onPressed: _loadNotifications,
              child: Text("RETRY".trU(context)),
            ),
          ],
        ),
      );
    }

    if (_notifications.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppImages.noNotificationBell.path,
              height: 60.h,
              width: 60.h,
            ),
            SizedBox(height: 16.h),
            Text(
              "NO_NOTIFICATIONS".trU(context),
              style: AppTextStyles.qanelasSemiBold(fontSize: 13.sp),
            ),
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: _onRefresh,
      child: ListView.separated(
        controller: _scrollController,
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: _notifications.length + (_isLoadingMore ? 1 : 0),
        separatorBuilder: (_, __) => SizedBox(height: 10.h),
        itemBuilder: (context, index) {
          if (index == _notifications.length) {
            return Center(
              child: Padding(
                padding: EdgeInsets.all(16.h),
                child: const CircularProgressIndicator(),
              ),
            );
          }
          final notification = _notifications[index];
          return NotificationTile(
            notification: notification,
            onTap: () => _handleNotificationTap(notification, index),
            onDelete: () {
              if (notification.id != null) {
                _deleteNotification(notification.id!, index);
              }
            },
          );
        },
      ),
    );
  }
}
