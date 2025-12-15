import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:padelrush/app_styles/app_colors.dart';
import 'package:padelrush/app_styles/app_text_styles.dart';
import 'package:padelrush/components/secondary_button.dart';
import 'package:padelrush/globals/constants.dart';
import 'package:padelrush/globals/images.dart';
import 'package:padelrush/utils/custom_extensions.dart';
import 'package:url_launcher/url_launcher.dart';

import '../globals/utils.dart';

class ChangesCancelledDetailsCard extends StatelessWidget {
  const ChangesCancelledDetailsCard(
      {super.key, required this.heading, required this.description});

  final String heading;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.darkYellow60,
        borderRadius: BorderRadius.circular(25.r),
      ),
      padding: EdgeInsets.only(
        left: 15.w,
        right: 10.w,
        top: 10.h,
        bottom: 15.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                AppImages.warning.path,
                width: 13.w,
                height: 13.w,
                color: AppColors.black2,
              ),
              SizedBox(width: 10.w),
              Text(
                heading,
                style: AppTextStyles.poppinsBold(
                  fontSize: 13.sp
                ),
              ),
            ],
          ),
          SizedBox(height: 5.h),
          Text(
            description,
            style: AppTextStyles.poppinsRegular(
              height: 1,
              fontSize: 13.sp,
            ),
          ),
          // SizedBox(height: 2.h),
          Align(
            alignment: Alignment.centerRight,
            child: SecondaryImageButton(
              onTap: () async {
                // await launchUrl(Uri.parse(sendUsMessageUrl));
                await Utils.openWhatsappSupport(context: context);
              },
              label: "SEND_US_A_MESSAGE".tr(context),
              image: AppImages.whatsaapIcon.path,
              iconColor: AppColors.black2,
              imageHeight: 14.w,
              imageWidth: 14.w,
              color: AppColors.gray,
              labelStyle: AppTextStyles.poppinsRegular(
                fontSize: 13.sp,
              ),
              applyShadow: false,
            ),
          ),
        ],
      ),
    );
  }
}
