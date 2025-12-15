import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:padelrush/app_styles/app_colors.dart';
import 'package:padelrush/app_styles/app_text_styles.dart';
import 'package:padelrush/components/network_circle_image.dart';
import 'package:padelrush/models/service_detail_model.dart';
import 'package:padelrush/utils/custom_extensions.dart';

import '../../globals/constants.dart';

class ServiceCoaches extends StatelessWidget {
  const ServiceCoaches({super.key, required this.coaches});

  final List<ServiceDetailCoach> coaches;

  @override
  Widget build(BuildContext context) {
    if (coaches.isEmpty) {
      return SizedBox();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 14.h),
        Text(
          "${"COACH".tr(context)} ${coaches.length}",
          style: AppTextStyles.poppinsBold(
              fontSize: 16.sp,),
        ),
        SizedBox(height: 10.h),
        ListView.separated(
          shrinkWrap: true,
          itemCount: coaches.length,
          physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (context, index) => SizedBox(height: 10.h),
          itemBuilder: (context, index) => _coachCard(coaches[index]),
        ),
      ],
    );
  }

  _coachCard(ServiceDetailCoach coach) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.gray,
        borderRadius: BorderRadius.circular(25.r),
        border: border
      ),
      padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 10.w),
      child: Row(
        children: [
          Container(
            child: Row(
              children: [
                NetworkCircleImage(
                  path: coach.profileUrl,
                  width: 40.w,
                  height: 40.w,
                  borderRadius: BorderRadius.circular(100.r),
                  boxBorder: Border.all(color: AppColors.white25),
                  bgColor: AppColors.black2,
                  logoColor: AppColors.white,
                ),
                8.horizontalSpace,
                Text(
                  "${coach.fullName}",
                  maxLines: 1,
                  softWrap: true,
                  style: AppTextStyles.poppinsMedium(fontSize: 11.sp,),
                ),
              ],
            ),
          ),
          15.horizontalSpace,
          Flexible(
            flex: 4,
            child: Text(
              coach.description ?? "",
              style: AppTextStyles.poppinsRegular(fontSize: 13.sp,),
            ),
          ),
        ],
      ),
    );
  }
}
