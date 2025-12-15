import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:padelrush/app_styles/app_colors.dart';
import 'package:padelrush/app_styles/app_text_styles.dart';
import 'package:padelrush/globals/images.dart';
import 'package:padelrush/models/service_detail_model.dart';
import 'package:padelrush/utils/custom_extensions.dart';

class ServiceInformationText extends StatelessWidget {
  const ServiceInformationText({
    super.key,
    required this.service,
    this.desStyle,
    this.titleStyle,
  });

  final ServiceDetail service;
  final TextStyle? desStyle;
  final TextStyle? titleStyle;

  @override
  Widget build(BuildContext context) {
    if (service.info.isEmpty) {
      return SizedBox();
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20.h),
        Row(
          children: [
            Image.asset(
              AppImages.infoIcon.path,
              width: 12.w,
              height: 12.h,
              color: AppColors.black,
            ),
            SizedBox(width: 10.w),
            Text(
              "INFORMATION".tr(context),
              style: titleStyle ??
                  AppTextStyles.poppinsBold(
                      fontSize: 16.sp,),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 12.w),
          child: Text(
            service.info,
            style: desStyle ??
                AppTextStyles.poppinsRegular(
                    color: AppColors.black, fontSize: 13.sp),
            textAlign: TextAlign.start,
          ),
        ),
      ],
    );
  }
}
