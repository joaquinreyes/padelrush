import 'package:padelrush/components/custom_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:padelrush/app_styles/app_colors.dart';
import 'package:padelrush/app_styles/app_text_styles.dart';
import 'package:padelrush/components/c_divider.dart';
import 'package:padelrush/components/network_circle_image.dart';
import 'package:padelrush/components/service_detail_components.dart/event_lesson_card_coach.dart';
import 'package:padelrush/components/main_button.dart';
import 'package:padelrush/components/secondary_text.dart';
import 'package:padelrush/globals/constants.dart';
import 'package:padelrush/globals/utils.dart';
import 'package:padelrush/models/lesson_models.dart';
import 'package:padelrush/repository/payment_repo.dart';
import 'package:padelrush/repository/play_repo.dart';
import 'package:padelrush/routes/app_pages.dart';
import 'package:padelrush/routes/app_routes.dart';
import 'package:padelrush/screens/home_screen/tabs/play_match_tab/tabs/tab_parent.dart';
import 'package:padelrush/screens/payment_information/payment_information.dart';
import 'package:padelrush/utils/custom_extensions.dart';

import '../../../../../../repository/booking_repo.dart';

part 'lessons_list_components.dart';

class LessonsList extends ConsumerStatefulWidget {
  const LessonsList({
    super.key,
    required this.start,
    required this.end,
    required this.locationIds,
    required this.sportsIds,
  });

  final DateTime start;
  final DateTime end;
  final List<int> locationIds;
  final List<int> sportsIds;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LessonState();
}

class _LessonState extends ConsumerState<LessonsList> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final lessons = ref.watch(lessonsListProvider(
      startDate: widget.start,
      endDate: widget.end,
      locationIDs: widget.locationIds,
      sportsIds: widget.sportsIds,
    ));
    return PlayTabsParentWidget(
      onRefresh: () => ref.refresh(lessonsListProvider(
        startDate: widget.start,
        endDate: widget.end,
        locationIDs: widget.locationIds,
        sportsIds: widget.sportsIds,
      ).future),
      child: lessons.when(
        data: (data) {
          if (data.isEmpty) {
            return Padding(
              padding: const EdgeInsets.only(top: 80),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: EdgeInsets.all(20.h),
                    decoration: BoxDecoration(
                      color: AppColors.lightGray,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.school_outlined, size: 40.sp, color: AppColors.black25),
                  ),
                  SizedBox(height: 20.h),
                  SecondaryText(text: "NO_LESSONS_FOUND".tr(context)),
                ],
              ),
            );
          }
          return ListView.builder(
            itemCount: data.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return _Lessons(
                lesson: data[index],
                start: widget.start,
                end: widget.end,
                locationIds: widget.locationIds,
                sportsIds: widget.sportsIds,
              );
            },
          );
        },
        loading: () => const Center(child: CupertinoActivityIndicator()),
        error: (error, _) => SecondaryText(text: error.toString()),
      ),
    );
  }
}

class _Lessons extends ConsumerStatefulWidget {
  const _Lessons({
    required this.lesson,
    required this.start,
    required this.end,
    required this.locationIds,
    required this.sportsIds,
  });

  final LessonsModel lesson;
  final DateTime start;
  final DateTime end;
  final List<int> locationIds;
  final List<int> sportsIds;

  @override
  ConsumerState<_Lessons> createState() => _LessonsState();
}

class _LessonsState extends ConsumerState<_Lessons> {
  bool isDatesVisible = false;

  @override
  Widget build(BuildContext context) {
    final String? levelRestriction = widget.lesson.levelRestriction;
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.black2.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Dark header with lesson name + location
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            decoration: BoxDecoration(
              color: AppColors.black2,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.r),
                topRight: Radius.circular(16.r),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    (widget.lesson.lessonName ?? "").capitalizeFirst,
                    style: AppTextStyles.poppinsSemiBold(
                      fontSize: 15.sp,
                      color: AppColors.white,
                    ),
                  ),
                ),
                Text(
                  widget.lesson.location?.locationName ?? '',
                  style: AppTextStyles.poppinsMedium(
                    fontSize: 12.sp,
                    color: AppColors.darkYellow,
                  ),
                ),
              ],
            ),
          ),
          // Body: coaches, description, price
          Padding(
            padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 10.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      EventLessonCardCoach(
                        coaches: widget.lesson.coaches,
                      ),
                      if (widget.lesson.description.isNotEmpty) ...[
                        SizedBox(height: 6.h),
                        Text(
                          widget.lesson.description,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.poppinsRegular(
                            fontSize: 12.sp,
                            color: AppColors.black70,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                SizedBox(width: 12.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      Utils.formatPrice(widget.lesson.price),
                      style: AppTextStyles.poppinsBold(fontSize: 15.sp),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Footer: level pill + see dates button
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
            decoration: BoxDecoration(
              color: AppColors.lightGray,
              borderRadius: isDatesVisible
                  ? BorderRadius.zero
                  : BorderRadius.only(
                      bottomLeft: Radius.circular(16.r),
                      bottomRight: Radius.circular(16.r),
                    ),
            ),
            child: Row(
              children: [
                if (levelRestriction != null)
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
                    decoration: BoxDecoration(
                      color: AppColors.darkYellow30,
                      borderRadius: BorderRadius.circular(100.r),
                    ),
                    child: Text(
                      "${"LEVEL".tr(context)} $levelRestriction",
                      style: AppTextStyles.poppinsSemiBold(fontSize: 11.sp),
                    ),
                  ),
                const Spacer(),
                _HideShowDatesButton(
                  isDatesVisible: isDatesVisible,
                  onTap: () {
                    setState(() {
                      isDatesVisible = !isDatesVisible;
                    });
                  },
                ),
              ],
            ),
          ),
          // Expandable dates section
          if (isDatesVisible) ...[
            Padding(
              padding: EdgeInsets.fromLTRB(16.w, 10.h, 16.w, 14.h),
              child: _LessonDatesListView(
                services: widget.lesson.services,
                onTap: (index) {
                  final serviceBooking =
                      widget.lesson.services![index].serviceBookings?.first;
                  _onJoinTap(serviceBooking);
                },
              ),
            ),
          ],
        ],
      ),
    );
  }

  void _onJoinTap(LessonServiceBookings? serviceBooking) async {
    final maxCapacity = widget.lesson.maximumCapacity ?? 0;
    if (maxCapacity == 1) {
      await _joinSingle(serviceBooking);
    } else {
      await ref
          .read(goRouterProvider)
          .push("${RouteNames.lesson_info}/${serviceBooking?.id}");
    }
    ref.invalidate(lessonsListProvider(
      startDate: widget.start,
      endDate: widget.end,
      locationIDs: widget.locationIds,
      sportsIds: widget.sportsIds,
    ));
  }

  Future<void> _joinSingle(LessonServiceBookings? serviceBooking) async {
    final confirmed = await showDialog(
        context: context, builder: (_) => const _ConfirmationDialog());
    if (confirmed == true && context.mounted) {
      final canProceed = await Utils().checkForLevelAssessment(
          ref: ref,
          context: context,
          sportsName: serviceBooking?.getSportsName(ref));

      if (!canProceed) {
        return;
      }
      final courtPrice = fetchCourtPriceProvider(
          coachId: serviceBooking?.coachesId,
          serviceId: serviceBooking!.id ?? 0,
          courtId: [serviceBooking.courtId],
          durationInMin: serviceBooking.duration2,
          requestType: CourtPriceRequestType.join,
          dateTime: DateTime.now());
      await Utils.showLoadingDialog(context, courtPrice, ref);
      final provider = joinServiceProvider(
        serviceBooking.id!,
        position: 0,
        isLesson: true,
        playerId: null,
        isEvent: false,
        isOpenMatch: false,
        isDouble: false,
        isReserve: false,
        isApprovalNeeded: false,
      );
      if (!mounted) {
        return;
      }
      final double? price =
          await Utils.showLoadingDialog(context, provider, ref);
      if (price != null && context.mounted && mounted) {
        final data = await showDialog(
          context: context,
          builder: (context) {
            return PaymentInformation(
                title: "PAY".trU(context),
                // boldPosition: 1,
                type: PaymentDetailsRequestType.join,
                locationID: widget.lesson.location!.id!,
                price: price,
                requestType: PaymentProcessRequestType.join,
                serviceID: serviceBooking.id!,
                duration: serviceBooking.duration2,
                startDate: serviceBooking.bookingStartTime);
          },
        );

        var (int? paymentDone, double? amount) = (null, null);
        if (data is (int, double?)) {
          (paymentDone, amount) = data;
        }

        if (paymentDone != null && context.mounted && mounted) {
          Utils.showMessageDialog(
            context,
            "YOU_HAVE_JOINED_SUCCESSFULLY".tr(context),
          );
        }
      }
    }
  }
}
