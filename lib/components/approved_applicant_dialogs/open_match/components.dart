part of 'open_match_applicants_dialog.dart';

class ApplicantOpenMatchInfoCard extends StatelessWidget {
  const ApplicantOpenMatchInfoCard({
    super.key,
    required this.service,
  });
  final ServiceDetail service;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.h),
      decoration: BoxDecoration(
          color: AppColors.darkYellow,
          borderRadius: BorderRadius.circular(12.r)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "LOCATION".trU(context),
                style: AppTextStyles.qanelasMedium(fontSize: 16.sp,),
              ),
              const Spacer(),
              Text("DATE_AND_TIME".trU(context),
                  style: AppTextStyles.qanelasMedium(fontSize: 16.sp,)),
            ],
          ),
          SizedBox(height: 1.h),
          CDivider(
            color: AppColors.black25,
          ),
          SizedBox(height: 2.h),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    service.courtName.toLowerCase().capitalizeFirst,
                    style: AppTextStyles.qanelasRegular(fontSize: 15.sp,),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    // locationName.capitalizeFirst,
                    (service.service?.location?.locationName ?? "")
                        .capitalizeFirst,
                    style: AppTextStyles.qanelasRegular(fontSize: 15.sp,),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    "${"PRICE".tr(context)} ${Utils.formatPrice(service.service?.price?.toDouble())}",
                    style: AppTextStyles.qanelasRegular(fontSize: 15.sp,),
                  ),
                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    service.formatStartEndTime12,
                    style: AppTextStyles.qanelasRegular(fontSize: 15.sp,),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    service.formatBookingDate,
                    style: AppTextStyles.qanelasRegular(fontSize: 15.sp,),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    service.durationInMinutes(),
                    style: AppTextStyles.qanelasRegular(fontSize: 15.sp,),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
