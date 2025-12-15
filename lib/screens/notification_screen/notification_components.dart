part of 'notification_screen.dart';

class _ClearAllBtn extends StatelessWidget {
  final VoidCallback onTap;

  const _ClearAllBtn({
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: SecondaryImageButton(image: AppImages.crossIcon.path,
        imageHeight: 10.h,
        imageWidth: 10.h,
        onTap: onTap,
        label:
        "CLEAR_ALL".tr(context),
        // child: Row(
        //   mainAxisSize: MainAxisSize.min,
        //   children: [
        //     Image.asset(
        //       AppImages.crossIcon.path,
        //       color: AppColors.black2,
        //       width: 10.w,
        //     ),
        //     SizedBox(width: 7.w),
        //     Text(
        //       "CLEAR_ALL".tr(context),
        //       style: AppTextStyles.poppinsRegular(fontSize: 11.sp),
        //     ),
        //   ],
        // ),
      ),
    );
  }
}

class NotificationTile extends StatelessWidget {
  final InAppNotification notification;
  final VoidCallback onTap;
  final VoidCallback onDelete;

  const NotificationTile({
    super.key,
    required this.notification,
    required this.onTap,
    required this.onDelete,
  });

  String _formatTime(DateTime? dateTime) {
    if (dateTime == null) return '';

    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inMinutes < 1) {
      return 'Just now';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes}m ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours}h ago';
    } else if (difference.inDays < 7) {
      return '${difference.inDays}d ago';
    } else {
      final day = dateTime.day.toString().padLeft(2, '0');
      final month = _getMonthAbbr(dateTime.month);
      final hour = dateTime.hour.toString().padLeft(2, '0');
      final minute = dateTime.minute.toString().padLeft(2, '0');
      return '$day $month. $hour:$minute hrs';
    }
  }

  String _getMonthAbbr(int month) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];
    return months[month - 1];
  }

  @override
  Widget build(BuildContext context) {
    final isUnread = notification.isRead == false;

    return InkWell(
      onTap: onTap,
      child: Container(
        padding:
            EdgeInsets.only(left: 15.w, right: 10.w, top: 10.h, bottom: 15.h),
        decoration: BoxDecoration(
          color: isUnread
              ? AppColors.gray.withOpacity(0.5)
              : AppColors.gray,
          borderRadius: BorderRadius.circular(12.r),
          // border: isUnread
          //     ? Border.all(color: AppColors.black2.withOpacity(0.3))
          //     : null,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    if (isUnread)
                      Container(
                        width: 4.w,
                        height: 4.w,
                        margin: EdgeInsets.only(right: 8.w),
                        decoration: BoxDecoration(
                          color: AppColors.black2,
                          shape: BoxShape.circle,
                        ),
                      ),
                    Text(
                      _formatTime(notification.createdAt),
                      style: AppTextStyles.poppinsRegular(
                          fontSize: 11.sp, color: AppColors.black70),
                    ),
                  ],
                ),
                InkWell(
                  onTap: onDelete,
                  child: Image.asset(
                    AppImages.crossIcon.path,
                    height: 11.h,
                    color: AppColors.black2,
                    width: 11.h,
                  ),
                ),
              ],
            ),
            SizedBox(height: 2.h),
            Text(
              (notification.title ?? ''),
              style: AppTextStyles.poppinsBold(fontSize: 13.sp),
            ),
            SizedBox(height: 2.h),
            Text(
              notification.body ?? '',
              style: AppTextStyles.poppinsRegular(fontSize: 13.sp),
            ),
          ],
        ),
      ),
    );
  }
}
