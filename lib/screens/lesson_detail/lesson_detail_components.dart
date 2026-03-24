part of 'lesoon_detail.dart';

class _InfoCard extends StatelessWidget {
  const _InfoCard({required this.lesson});

  final ServiceDetail lesson;

  @override
  Widget build(BuildContext context) {
    String? levelRestriction = lesson.service?.event?.levelRestriction;
    final maxPaxValue = lesson.maxPaxValue;
    final bool isLessonVariant = maxPaxValue != null;

    if (isLessonVariant) {
      return _LessonVariantInfoCard(lesson: lesson);
    }

    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(color: AppColors.black2.withOpacity(0.06), blurRadius: 12, offset: const Offset(0, 3)),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header
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
                    (lesson.service?.lesson?.lessonName ?? "").capitalizeFirst,
                    style: AppTextStyles.poppinsSemiBold(
                      fontSize: 15.sp,
                      color: AppColors.white,
                    ),
                  ),
                ),
                Text(
                  (lesson.service?.location?.locationName.trU(context) ?? ""),
                  style: AppTextStyles.poppinsMedium(
                    fontSize: 12.sp,
                    color: AppColors.darkYellow,
                  ),
                ),
              ],
            ),
          ),
          // Body
          Padding(
            padding: EdgeInsets.fromLTRB(16.w, 14.h, 16.w, 14.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Date/Time
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.calendar_today_outlined, size: 13.sp, color: AppColors.black70),
                          SizedBox(width: 4.w),
                          Text(
                            lesson.bookingDate.format("EEE dd MMM"),
                            style: AppTextStyles.poppinsSemiBold(fontSize: 13.sp),
                          ),
                        ],
                      ),
                      SizedBox(height: 4.h),
                      Padding(
                        padding: EdgeInsets.only(left: 17.w),
                        child: Text(
                          "${lesson.bookingStartTime.format("h:mm")} - ${lesson.bookingEndTime.format("h:mm a").toLowerCase()}",
                          style: AppTextStyles.poppinsRegular(fontSize: 12.sp, color: AppColors.black70),
                        ),
                      ),
                    ],
                  ),
                ),
                // Slots badge
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                  decoration: BoxDecoration(
                    color: AppColors.darkYellow30,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'SLOTS'.trU(context),
                        style: AppTextStyles.poppinsSemiBold(fontSize: 11.sp),
                      ),
                      Text(
                        "${lesson.getMinimumCapacity}-${lesson.getMaximumCapacity}",
                        style: AppTextStyles.poppinsBold(fontSize: 16.sp),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 12.w),
                // Level & Price
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
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
                      SizedBox(height: 8.h),
                      Text(
                        "${"PRICE".tr(context)} ${Utils.formatPriceNew(lesson.service?.price)}",
                        style: AppTextStyles.poppinsSemiBold(fontSize: 14.sp),
                      ),
                    ],
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

class _LessonVariantInfoCard extends StatelessWidget {
  const _LessonVariantInfoCard({required this.lesson});

  final ServiceDetail lesson;

  @override
  Widget build(BuildContext context) {
    final coachName =
        (lesson.getCoaches.isNotEmpty ? lesson.getCoaches.first.fullName : "-")
                ?.capitalizeFirst ??
            "-";
    final location =
        lesson.service?.location?.locationName.capitalizeFirst ?? "-";
    final lessonType =
        lesson.service?.lesson?.lessonName?.capitalizeFirst ?? "Private Lesson";
    final court = lesson.courtName.isNotEmpty ? lesson.courtName : "Court 1";
    final paid = Utils.formatPrice(lesson.service?.price);
    final duration = lesson.duration2 > 0 ? "${lesson.duration2} min" : "-";
    final pax = lesson.getMaximumCapacity > 0
        ? "${lesson.getMaximumCapacity} pax"
        : "-";
    final time =
        "${lesson.bookingStartTime.format("H:mm")} - ${lesson.bookingEndTime.format("H:mm")}";
    final date = lesson.bookingDate.format("EEEE d MMM");

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16.h,
        vertical: 16.h,
      ),
      decoration: BoxDecoration(
        color: AppColors.black2,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(color: AppColors.black2.withOpacity(0.15), blurRadius: 12, offset: const Offset(0, 4)),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  coachName,
                  style: AppTextStyles.poppinsBold(
                    color: AppColors.white,
                    fontSize: 16.sp,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  location,
                  textAlign: TextAlign.end,
                  style: AppTextStyles.poppinsMedium(
                    color: AppColors.white,
                    fontSize: 14.sp,
                  ),
                ),
              ),
            ],
          ),
          CDivider(color: AppColors.black25),
          SizedBox(height: 8.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Left column
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      lessonType,
                      style: AppTextStyles.poppinsRegular(
                          color: AppColors.white, fontSize: 13.sp),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      court,
                      style: AppTextStyles.poppinsRegular(
                          color: AppColors.white, fontSize: 13.sp),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      "Paid $paid",
                      style: AppTextStyles.poppinsRegular(
                          color: AppColors.white, fontSize: 13.sp),
                    ),
                  ],
                ),
              ),
              // Right column
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "$duration - $pax",
                      style: AppTextStyles.poppinsRegular(
                          color: AppColors.white, fontSize: 13.sp),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      time,
                      style: AppTextStyles.poppinsRegular(
                          color: AppColors.white, fontSize: 13.sp),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      date,
                      style: AppTextStyles.poppinsRegular(
                          color: AppColors.white, fontSize: 13.sp),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

enum _ConfirmationDialogType { join, leave }

class _ConfirmationDialog extends StatelessWidget {
  const _ConfirmationDialog({required this.type, this.policy});

  final _ConfirmationDialogType type;
  final CancellationPolicy? policy;

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      // closeIconPadding: EdgeInsets.only(right: 6.5.w),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 0.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            type == _ConfirmationDialogType.leave
                ? Text(
                    _headingText(context),
                    style: AppTextStyles.popupHeaderTextStyle,
                    textAlign: TextAlign.center,
                  )
                : Text(
                    _headingText(context),
                    style: AppTextStyles.popupHeaderTextStyle,
                    textAlign: TextAlign.center,
                  ),
            SizedBox(height: 20.h),
            Text(
              type == _ConfirmationDialogType.join
                  ? "LESSON_CANCELATION_POLICY".tr(context)
                  : "IF_YOU_LEAVE_DESC_EVENT".tr(context),
              textAlign: TextAlign.center,
              style: AppTextStyles.popupBodyTextStyle,
            ),
            if (type == _ConfirmationDialogType.leave)
              RefundDescriptionComponent(
                policy: policy,
                text: policy == null ? "LEAVE_POLICY_LESSON".tr(context) : null,
                style: AppTextStyles.popupBodyTextStyle,
              ),
            SizedBox(height: 20.h),
            MainButton(
              isForPopup: true,
              enabled: true,
              label: _buttonText(context),
              padding: EdgeInsets.zero,
              // labelStyle: AppTextStyles.gothicLight().copyWith(fontSize: 18.sp, color: AppColors.mediumGreen),
              // borderRadius: 12.r,
              onTap: () {
                Navigator.pop(context, true);
              },
            ),
            // MainButton(
            //   isForPopup: true,
            //   enabled: true,
            //   label: _buttonText(context),
            //   labelStyle: AppTextStyles.gothamNarrowLight()
            //       .copyWith(fontSize: 18.sp, color: AppColors.darkGreen),
            //   // borderRadius: 12.r,
            //   onTap: () {
            //     Navigator.pop(context, true);
            //   },
            // )
          ],
        ),
      ),
    );
  }

  _headingText(BuildContext context) {
    switch (type) {
      case _ConfirmationDialogType.join:
        return "ARE_YOU_SURE_YOU_WANT_TO_JOIN".trU(context);
      case _ConfirmationDialogType.leave:
        return "ARE_YOU_SURE_YOU_WANT_TO_LEAVE".trU(context);
    }
  }

  _buttonText(BuildContext context) {
    switch (type) {
      case _ConfirmationDialogType.join:
        return "JOIN_AND_PAY_MY_SHARE".trU(context);

      case _ConfirmationDialogType.leave:
        return "LEAVE".trU(context);
    }
  }
}

class _LessonPlayersSlots extends StatelessWidget {
  const _LessonPlayersSlots({
    required this.players,
    required this.maxPlayers,
    required this.onSlotTap,
  });

  final List<BookingPlayerBase> players;
  final int maxPlayers;
  final Function(int, int?) onSlotTap;

  @override
  Widget build(BuildContext context) {
    final int totalParticipants = players.length;
    final int totalRows = (maxPlayers / 4).ceil();
    int playerIndex = 0;

    List<Widget> rows = List.generate(totalRows, (rowIndex) {
      List<Widget> participantsRow = List.generate(
        math.min(4, maxPlayers - 4 * rowIndex),
        (colIndex) {
          return playerIndex < totalParticipants
              ? ParticipantSlot(
                  player: players[playerIndex++],
                  imageBgColor: AppColors.black2,
                  logoColor: AppColors.white,
                )
              : AvailableSlotWidget(
                  text: "AVAILABLE".tr(context),
                  index: colIndex,
                  onTap: (index, __) => onSlotTap(index, null),
                  backgroundColor: AppColors.darkYellow80,
                  textColor: AppColors.black,
                  iconColor: AppColors.black,
                  borderColor: AppColors.black,
                );
        },
      );

      while (participantsRow.length < 4) {
        participantsRow.add(
          Opacity(
            opacity: 0,
            child: AvailableSlotWidget(
              text: "AVAILABLE".tr(context),
              index: -1,
            ),
          ),
        );
      }

      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: participantsRow,
      );
    });

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (int j = 0; j < rows.length; j++) ...[
          rows[j],
          if (j < rows.length - 1) SizedBox(height: 10.h),
        ],
      ],
    );
  }
}
