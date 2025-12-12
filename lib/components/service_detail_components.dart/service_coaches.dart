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
          "${"COACH".trU(context)} ${coaches.length}",
          style: AppTextStyles.qanelasMedium(
              fontSize: 17.sp,),
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
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: border
      ),
      padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 10.w),
      child: Row(
        children: [
          Expanded(
            child: Container(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 9.5.w),
                    child: NetworkCircleImage(
                      path: coach.profileUrl,
                      width: 37.w,
                      height: 37.w,
                      borderRadius: BorderRadius.circular(4.r),
                      boxBorder: Border.all(color: AppColors.white25),
                      bgColor: AppColors.black2,
                      logoColor: AppColors.white,
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 9.5.w),
                    child: Text(
                      "${coach.fullName?.toUpperCase()}",
                      maxLines: 1,
                      softWrap: true,
                      style: AppTextStyles.qanelasMedium(fontSize: 11.sp,),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Text(
              coach.description ?? "",
              style: AppTextStyles.qanelasRegular(fontSize: 13.sp,),
            ),
          ),
        ],
      ),
    );
  }
}
