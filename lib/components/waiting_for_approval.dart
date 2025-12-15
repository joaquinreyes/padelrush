import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:padelrush/app_styles/app_colors.dart';
import 'package:padelrush/app_styles/app_text_styles.dart';
import 'package:padelrush/utils/custom_extensions.dart';

class WaitingForApproval extends StatelessWidget {
  final String? title;
  final TextStyle? titleStyle;
  final Color? backgroundColor;
  const WaitingForApproval({
    super.key,
    this.title,
    this.backgroundColor,
    this.titleStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor ?? AppColors.black,
          borderRadius: BorderRadius.circular(100.r),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 15.w,
          vertical: 2.h,
        ),
        child: Text(
          title ?? "WAITING_FOR_APPROVAL".trU(context),
          style: titleStyle ??
              AppTextStyles.poppinsRegular(
                color: AppColors.white,
              ),
        ),
      ),
    );
  }
}
