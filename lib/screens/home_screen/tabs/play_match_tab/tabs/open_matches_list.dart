import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:padelrush/app_styles/app_colors.dart';
import 'package:padelrush/app_styles/app_text_styles.dart';
import 'package:padelrush/components/open_match_participant_row.dart';
import 'package:padelrush/components/secondary_text.dart';
import 'package:padelrush/globals/utils.dart';
import 'package:padelrush/models/open_match_model.dart';
import 'package:padelrush/repository/play_repo.dart';
import 'package:padelrush/routes/app_pages.dart';
import 'package:padelrush/routes/app_routes.dart';
import 'package:padelrush/screens/home_screen/tabs/play_match_tab/tabs/tab_parent.dart';
import 'package:padelrush/utils/custom_extensions.dart';

import '../../../../../globals/constants.dart';

class OpenMatchesList extends ConsumerStatefulWidget {
  const OpenMatchesList({
    super.key,
    required this.start,
    required this.end,
    required this.locationIds,
    required this.sportsIds,
    required this.minLevel,
    required this.maxLevel,
    required this.selectedSport,
  });

  final DateTime start;
  final DateTime end;
  final List<int> locationIds;
  final List<int> sportsIds;
  final int minLevel;
  final int maxLevel;
  final String selectedSport;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _OpenMatchesState();
}

class _OpenMatchesState extends ConsumerState<OpenMatchesList> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final openMatches = ref.watch(openMatchesListProvider(
      startDate: widget.start,
      endDate: widget.end,
      locationIDs: widget.locationIds,
      sportsIds: widget.sportsIds,
      minLevel: widget.minLevel,
      maxLevel: widget.maxLevel,
    ));
    return PlayTabsParentWidget(
      onRefresh: () => ref.refresh(openMatchesListProvider(
        startDate: widget.start,
        endDate: widget.end,
        locationIDs: widget.locationIds,
        sportsIds: widget.sportsIds,
        minLevel: widget.minLevel,
        maxLevel: widget.maxLevel,
      ).future),
      child: openMatches.when(
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
                    child: Icon(Icons.sports_tennis, size: 40.sp, color: AppColors.black25),
                  ),
                  SizedBox(height: 20.h),
                  SecondaryText(text: "NO_OPEN_MATCHES_FOUND".tr(context)),
                ],
              ),
            );
          }
          // final dateList = _getDateList(data);
          final dateList = data.dateList;
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: buildBookingWidgets(dateList, data),
          );
        },
        loading: () {
          return const Center(child: CupertinoActivityIndicator());
        },
        error: (error, stackTrace) {
          log("PlayTabsParentWidget :: ${error} :: $stackTrace");
          return SecondaryText(text: error.toString());
        },
      ),
    );
  }

  List<Widget> buildBookingWidgets(
      List<DateTime> dateList, List<OpenMatchModel> matches) {
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
          (match) => Padding(
            padding: EdgeInsets.only(bottom: 12.h),
            child: InkWell(
              borderRadius: BorderRadius.circular(16.r),
              onTap: () async {
                await ref
                    .read(goRouterProvider)
                    .push("${RouteNames.match_info}/${match.id}");
                ref.invalidate(openMatchesListProvider(
                  startDate: widget.start,
                  endDate: widget.end,
                  locationIDs: widget.locationIds,
                  sportsIds: widget.sportsIds,
                  minLevel: widget.minLevel,
                  maxLevel: widget.maxLevel,
                ));
              },
              child: _OpenMatchCard(
                match: match,
                selectedSport: widget.selectedSport,
              ),
            ),
          ),
        ),
      );
    }
    return widgets;
  }
}

class _OpenMatchCard extends ConsumerWidget {
  const _OpenMatchCard({required this.match, required this.selectedSport});

  final OpenMatchModel match;
  final String selectedSport;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String level = match.openMatchLevelRange;
    if (level.isNotEmpty) {
      level = "${"LEVEL".tr(context)} $level";
    }
    return Container(
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
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header with date/time and location
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
                Icon(Icons.access_time_rounded, size: 14.sp, color: AppColors.darkYellow),
                SizedBox(width: 6.w),
                Expanded(
                  child: Text(
                    '${match.bookingDate.format("EEE dd MMM")} | ${match.bookingStartTime.format("h:mm")} - ${match.bookingEndTime.format("h:mm a").toLowerCase()}',
                    style: AppTextStyles.poppinsSemiBold(
                      fontSize: 13.sp,
                      color: AppColors.white,
                    ),
                  ),
                ),
                Text(
                  (match.service?.location?.locationName ?? ""),
                  style: AppTextStyles.poppinsMedium(
                    fontSize: 12.sp,
                    color: AppColors.darkYellow,
                  ),
                ),
              ],
            ),
          ),
          // Player slots
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
            child: OpenMatchParticipantRow(
              textForAvailableSlot: "AVAILABLE".tr(context),
              backGroundColor: AppColors.lightGray,
              slotIconColor: AppColors.black70,
              players: match.players ?? [],
              imageBgColor: AppColors.black2,
              borderColor: AppColors.black25,
            ),
          ),
          // Footer with court and level
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
                Icon(Icons.sports_tennis, size: 14.sp, color: AppColors.black70),
                SizedBox(width: 4.w),
                Text(
                  "${match.court}".capitalizeFirst,
                  style: AppTextStyles.poppinsMedium(
                    fontSize: 12.sp,
                    color: AppColors.black70,
                  ),
                ),
                const Spacer(),
                if (level.isNotEmpty)
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
                    decoration: BoxDecoration(
                      color: AppColors.darkYellow30,
                      borderRadius: BorderRadius.circular(100.r),
                    ),
                    child: Text(
                      level,
                      style: AppTextStyles.poppinsSemiBold(
                        fontSize: 11.sp,
                      ),
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
