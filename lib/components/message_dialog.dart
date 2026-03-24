import 'package:padelrush/components/custom_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:padelrush/app_styles/app_colors.dart';
import 'package:padelrush/app_styles/app_text_styles.dart';

class MessageDialog extends StatelessWidget {
  const MessageDialog({super.key, required this.message, this.backgroundColor, this.subtitle});
  final String message;
  final String? subtitle;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      color: backgroundColor ?? AppColors.white,
      showCloseIcon: false,
      contentPadding: EdgeInsets.fromLTRB(24.w, 30.h, 24.w, 24.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 56.w,
            height: 56.w,
            decoration: BoxDecoration(
              color: AppColors.darkYellow,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.check_rounded,
              color: AppColors.black2,
              size: 32.w,
            ),
          ),
          SizedBox(height: 18.h),
          Text(
            message.toUpperCase(),
            style: AppTextStyles.popupHeaderTextStyle,
            textAlign: TextAlign.center,
          ),
          if (subtitle != null) ...[
            SizedBox(height: 10.h),
            Text(
              subtitle!,
              style: AppTextStyles.poppinsRegular(
                fontSize: 13.sp,
                color: AppColors.black50,
              ),
              textAlign: TextAlign.center,
            ),
          ],
          SizedBox(height: 22.h),
          SizedBox(
            width: double.infinity,
            height: 46.h,
            child: ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.black2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
                elevation: 0,
              ),
              child: Text(
                "GOT IT",
                style: AppTextStyles.poppinsMedium(
                  fontSize: 15.sp,
                  color: AppColors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MessageDialog2 extends StatelessWidget {
  const MessageDialog2({super.key, required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      contentPadding: EdgeInsets.fromLTRB(20.w, 15.h, 20.w, 45.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // MultiStyleTextFirstLight(text: message, fontSize: 19.sp, color: AppColors.white,),
          Text(
            message,
            style: AppTextStyles.popupHeaderTextStyle,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
