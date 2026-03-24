import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:padelrush/app_styles/app_colors.dart';
import 'package:padelrush/app_styles/app_text_styles.dart';
import 'package:padelrush/components/service_detail_components.dart/event_lesson_card_coach.dart';
import 'package:padelrush/components/secondary_text.dart';
import 'package:padelrush/globals/utils.dart';
import 'package:padelrush/models/events_model.dart';
import 'package:padelrush/repository/play_repo.dart';
import 'package:padelrush/routes/app_pages.dart';
import 'package:padelrush/routes/app_routes.dart';
import 'package:padelrush/screens/home_screen/tabs/play_match_tab/tabs/tab_parent.dart';
import 'package:padelrush/utils/custom_extensions.dart';

import '../../../../../components/ranked_component.dart';

class EventsList extends ConsumerStatefulWidget {
  const EventsList({
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
  ConsumerState<ConsumerStatefulWidget> createState() => _EventListState();
}

class _EventListState extends ConsumerState<EventsList> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final events = ref.watch(eventsListProvider(
      startDate: widget.start,
      endDate: widget.end,
      locationIDs: widget.locationIds,
      sportsIds: widget.sportsIds,
    ));
    return PlayTabsParentWidget(
      onRefresh: () => ref.refresh(eventsListProvider(
        startDate: widget.start,
        endDate: widget.end,
        locationIDs: widget.locationIds,
        sportsIds: widget.sportsIds,
      ).future),
      child: events.when(
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
                    child: Icon(Icons.event_outlined, size: 40.sp, color: AppColors.black25),
                  ),
                  SizedBox(height: 20.h),
                  SecondaryText(text: "NO_EVENTS_FOUND".tr(context)),
                ],
              ),
            );
          }
          final dateList = data.dateList;
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: buildBookingWidgets(dateList, data),
          );
        },
        loading: () => const Center(child: CupertinoActivityIndicator()),
        error: (error, _) => SecondaryText(text: error.toString()),
      ),
    );
  }

  List<Widget> buildBookingWidgets(
      List<DateTime> dateList, List<EventsModel> matches) {
    final widgets = <Widget>[];
    for (var date in dateList) {
      widgets.add(
        Padding(
          padding: EdgeInsets.only(bottom: 12.h, top: 4.h),
          child: Row(
            children: [
              Container(
                width: 3.w,
                height: 18.h,
                decoration: BoxDecoration(
                  color: AppColors.darkYellow,
                  borderRadius: BorderRadius.circular(2.r),
                ),
              ),
              SizedBox(width: 8.w),
              Text(
                Utils.formatBookingDate(date, context),
                style: AppTextStyles.poppinsBold(
                  fontSize: 16.sp,
                ),
              ),
            ],
          ),
        ),
      );

      final dataMatches = matches.where((e) => e.bookingDate == date).toList();

      widgets.addAll(
        dataMatches.map(
          (event) => Padding(
            padding: EdgeInsets.only(bottom: 12.h),
            child: InkWell(
              borderRadius: BorderRadius.circular(16.r),
              onTap: () async {
                await ref
                    .read(goRouterProvider)
                    .push("${RouteNames.event_info}/${event.id}");
                ref.invalidate(
                  eventsListProvider(
                    startDate: widget.start,
                    endDate: widget.end,
                    locationIDs: widget.locationIds,
                    sportsIds: widget.sportsIds,
                  ),
                );
              },
              child: EventsCard(event: event),
            ),
          ),
        ),
      );
    }
    return widgets;
  }
}

class EventsCard extends ConsumerWidget {
  const EventsCard({required this.event});

  final EventsModel event;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String? levelRestriction = event.service?.event?.levelRestriction;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.black2.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Dark header with event name, time, location
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            decoration: BoxDecoration(
              color: AppColors.black2,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.r),
                topRight: Radius.circular(16.r),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        (event.service?.event?.eventName ?? "").capitalizeFirst,
                        style: AppTextStyles.poppinsSemiBold(
                          fontSize: 15.sp,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                    Text(
                      event.service?.location?.locationName ?? "",
                      style: AppTextStyles.poppinsMedium(
                        fontSize: 12.sp,
                        color: AppColors.darkYellow,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 6.h),
                Row(
                  children: [
                    Icon(Icons.access_time_rounded, size: 13.sp, color: AppColors.darkYellow),
                    SizedBox(width: 5.w),
                    Text(
                      '${event.bookingDate.format("EEE dd MMM")} | ${event.bookingStartTime.format("HH:mm")} - ${event.bookingEndTime.format("HH:mm a").toLowerCase()}',
                      style: AppTextStyles.poppinsRegular(
                        fontSize: 12.sp,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Body: coaches, price, capacity
          Padding(
            padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 12.h),
            child: Row(
              children: [
                if (event.getCoaches?.isNotEmpty == true)
                  Expanded(
                    flex: 2,
                    child: EventLessonCardCoach(
                      coaches: event.getCoaches,
                    ),
                  ),
                if (event.getCoaches?.isNotEmpty != true)
                  const Spacer(),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        Utils.formatPrice(event.service?.price),
                        style: AppTextStyles.poppinsBold(fontSize: 15.sp),
                      ),
                      SizedBox(height: 4.h),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                        decoration: BoxDecoration(
                          color: AppColors.darkYellow30,
                          borderRadius: BorderRadius.circular(100.r),
                        ),
                        child: Text(
                          "${event.players?.length.toString() ?? "0"}/${event.getMaximumCapacity.toString()}",
                          style: AppTextStyles.poppinsBold(
                            color: AppColors.black2,
                            fontSize: 13.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Footer with level and ranked badge
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
            decoration: BoxDecoration(
              color: AppColors.lightGray,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16.r),
                bottomRight: Radius.circular(16.r),
              ),
            ),
            child: Row(
              children: [
                Text(
                  Utils.eventLessonStatusText(
                    context: context,
                    playersCount: event.players?.length ?? 0,
                    maxCapacity: event.getMaximumCapacity,
                    minCapacity: event.getMinimumCapacity,
                  ).tr(context),
                  style: AppTextStyles.poppinsMedium(
                    fontSize: 12.sp,
                    color: AppColors.black70,
                  ),
                ),
                const Spacer(),
                if (event.rankedEvent ?? false) ...[
                  RankedComponent(),
                  SizedBox(width: 8.w),
                ],
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
