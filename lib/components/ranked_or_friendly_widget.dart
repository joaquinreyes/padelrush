import 'package:padelrush/app_styles/app_colors.dart';
import 'package:padelrush/app_styles/app_text_styles.dart';
import 'package:padelrush/utils/custom_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:padelrush/box_shadow/flutter_inset_box_shadow.dart' as inset;
import '../globals/constants.dart';

class RankedOrFriendly extends StatelessWidget {
  const RankedOrFriendly({
    super.key,
    this.isRanked = true,
  });

  final bool isRanked;

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: inset.BoxDecoration(
      //   boxShadow: kInsetShadow,
      //   color: AppColors.tileBgColor,
      //   borderRadius: BorderRadius.circular(12.r),
      // ),
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 4.h),
      child: Row(
        children: [
          _buildWidget("FRIENDLY".tr(context), !isRanked),
          2.horizontalSpace,
          _buildWidget("RANKED".tr(context), isRanked),
        ],
      ),
    );
  }

  _buildWidget(String text, bool isSelected) {
    return Container(
      decoration: decoration.copyWith(color: isSelected ? AppColors.darkYellow : AppColors.white),
      padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 10.w),
      child: Text(
        text,
        style: isSelected
            ? AppTextStyles.qanelasSemiBold(
          fontSize: 14.sp,)
            : AppTextStyles.qanelasRegular(
          color: AppColors.black70,
          fontSize: 13.sp,
        ),
      ),
    );
  }
}
