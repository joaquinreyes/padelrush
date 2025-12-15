import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:padelrush/app_styles/app_colors.dart';
import 'package:padelrush/globals/current_platform.dart';
import 'package:padelrush/globals/images.dart';
import 'package:padelrush/repository/notification_repo.dart';
import 'package:padelrush/routes/app_pages.dart';
import 'package:padelrush/routes/app_routes.dart';

class NotificationButton extends ConsumerStatefulWidget {
  const NotificationButton({
    super.key,
  });

  @override
  ConsumerState<NotificationButton> createState() => _NotificationButtonState();
}

class _NotificationButtonState extends ConsumerState<NotificationButton> {
  @override
  Widget build(BuildContext context) {
    if (PlatformC().isCurrentDesignPlatformDesktop) {
      return Container();
    }

    final unreadCountAsync = ref.watch(notificationUnreadCountProvider);

    return InkWell(
      onTap: () async {
        await ref.read(goRouterProvider).push(RouteNames.notifications);
        ref.read(notificationUnreadCountProvider.notifier).refresh();
      },
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topRight,
        children: [
          Icon(Icons.notifications_rounded,
              color: AppColors.black, size: 32),
          unreadCountAsync.maybeWhen(
            data: (count) {
              if (count > 0) {
                return Positioned(
                  right: count > 9 ? -10 : -4,
                  top: -8,
                  child: Container(
                    padding: EdgeInsets.all(4.w),
                    decoration: BoxDecoration(
                        color: AppColors.darkYellow,
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.white)),
                    constraints: BoxConstraints(
                      minWidth: 16.w,
                      minHeight: 16.w,
                    ),
                    child: Center(
                      child: Text(
                        count > 99 ? '99+' : '$count',
                        style: TextStyle(
                          fontSize: 8.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
              }
              return const SizedBox.shrink();
            },
            orElse: () => const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
