part of 'open_match_detail.dart';

class _RankedOrFriendly extends StatelessWidget {
  const _RankedOrFriendly({
    this.isRanked = true,
  });

  final bool isRanked;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.gray,
        borderRadius: BorderRadius.circular(100.r),
      ),
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
      decoration: BoxDecoration(color: isSelected ? AppColors.black70 : AppColors.transparentColor,
      borderRadius: BorderRadius.circular(100.r),),
      padding: EdgeInsets.symmetric(vertical: 7.h, horizontal: 10.w),
      child: Text(
        text,
        style: isSelected
            ? AppTextStyles.poppinsSemiBold(
            fontSize: 14.sp, color: AppColors.white)
            : AppTextStyles.poppinsRegular(
                color: AppColors.black70,
                fontSize: 13.sp,
              ),
      ),
    );
  }
}

class _OrganizerNote extends StatelessWidget {
  const _OrganizerNote({
    required this.note,
  });

  final String note;

  @override
  Widget build(BuildContext context) {
    if (note.isEmpty) {
      return Container();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20.h),
        Text(
          "NOTE_FROM_ORGANIZER".trU(context),
          style: AppTextStyles.poppinsMedium(
              fontSize: 17.sp,),
        ),
        SizedBox(height: 10.h),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            border: border,
            color: AppColors.gray,
            borderRadius: BorderRadius.circular(12.r)
          ),
          padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 12.w),
          child: Text(
            note,
            style: AppTextStyles.poppinsRegular(
                fontSize: 13.sp,),
          ),
        ),
      ],
    );
  }
}

class _InfoCard extends ConsumerWidget {
  const _InfoCard({required this.service});

  final ServiceDetail service;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String level = service.openMatchLevelRange;
    if (level.isNotEmpty) {
      level = "${"LEVEL".tr(context)} $level |";
    }
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 15.h,
        vertical: 15.h,
      ),
      decoration: BoxDecoration(
        color: AppColors.gray,
        border: border,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'ORGANIZER'.tr(context),
                style: AppTextStyles.poppinsMedium(fontSize: 16.sp),
              ),
              const Spacer(),
              Text(
                'BOOKING'.tr(context),
                style: AppTextStyles.poppinsMedium(
                    fontSize: 16.sp),
              ),
              if (service.isPrivate)
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: AppColors.darkYellow50),
                  padding: EdgeInsets.all(2),
                  margin: EdgeInsets.only(left: 8),
                  child: Icon(
                    Icons.lock,
                    size: 16,
                    color: AppColors.black2,
                  ),
                )
            ],
          ),
          CDivider(color: AppColors.white25),
          SizedBox(height: 5.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: _organizer(context, service.organizer, ref),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    // "${DateFormat("EEE dd MMM").format(booking.startingTime ?? (DubaiDateTime.now().dateTime))} • ${DateFormat(DateFormat.HOUR_MINUTE).format(booking.startingTime ?? (DubaiDateTime.now().dateTime))} - ${DateFormat(DateFormat.HOUR_MINUTE).format((booking.endingTime ?? (DubaiDateTime.now().dateTime)))}",
                    service.formattedDateStartEndTimeAM12,
                    style: AppTextStyles.poppinsRegular(
                      fontSize: 15.sp,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    "${service.courts?.first.courtName ?? ""} | ${service.service?.location?.locationName ?? ""}"
                        .capitalizeFirst,
                    style: AppTextStyles.poppinsRegular(
                      fontSize: 15.sp,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    "$level Price ${Utils.formatPrice(service.pricePaid(ref))}",
                    style: AppTextStyles.poppinsRegular(
                      fontSize: 15.sp,
                    ),
                  ),
                ],
              ),
              SizedBox(width: 15.h),
            ],
          ),
        ],
      ),
    );
  }

  Widget _organizer(
      BuildContext context, ServiceDetail_Players? organizer, WidgetRef ref) {
    if (organizer == null) {
      return SizedBox(
        child: Text(
          "NO_ORGANIZER".tr(context),
          textAlign: TextAlign.center,
          style: AppTextStyles.poppinsRegular(fontSize: 15.sp),
        ),
      );
    }
    String level =
        organizer.customer?.level(getSportsName(ref)).toString() ?? "N/A";
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {},
          child: NetworkCircleImage(
            // path: participant?.imgUrl,
            path: organizer.customer?.profileUrl,
            width: 37.h,
            height: 37.h,
            bgColor: AppColors.black2,
            boxBorder: Border.all(color: AppColors.white25),
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),
        SizedBox(height: 5.h),
        Text(
          organizer.getCustomerName.capitalizeFirst,
          textAlign: TextAlign.center,
          style: AppTextStyles.poppinsMedium(
            fontSize: 11.sp,
          ),
        ),
        Text(
          "$level ${getRankLabel(double.tryParse(level) ?? 0)}", // • SIDE",
          textAlign: TextAlign.center,
          style: AppTextStyles.poppinsRegular(
            fontSize: 12.sp,
          ),
        ),
      ],
    );
  }
}

class _WaitingList extends ConsumerStatefulWidget {
  const _WaitingList(
      {required this.id,
      required this.onApprove,
      required this.onJoinAfterApproval,
      required this.onWithdraw,
      required this.isCurrentOrganizer,this.refreshApis});

  final int id;
  final Function(int) onApprove;
  final Function? refreshApis;
  final Function(int) onJoinAfterApproval;
  final Function(int) onWithdraw;
  final bool isCurrentOrganizer;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => __WaitingListState();
}

class __WaitingListState extends ConsumerState<_WaitingList> {
  @override
  Widget build(BuildContext context) {
    final provider = ref.watch(fetchServiceWaitingPlayersProvider(
        widget.id, RequestServiceType.booking));
    return provider.when(
      skipLoadingOnRefresh: false,
      data: (list) {
        final data = list.map((e) => e).toList();
        final user = ref.read(userManagerProvider).user;
        if (user == null) {
          return SecondaryText(text: "USER_NOT_FOUND".tr(context));
        }
        int uid = user.user?.id ?? -1;
        final inWaitingList = list.indexWhere((element) => element.customer?.id == uid) !=
            -1;
        Future(() {
          if (inWaitingList) {
            ref.read(_inWaitingList.notifier).state = true;
          } else {
            ref.read(_inWaitingList.notifier).state = false;
          }
        });

        if (widget.isCurrentOrganizer) {
          // data.removeWhere((element) => element.isApproved);
        } else {
          final currentID = ref.read(userProvider)?.user?.id;
          data.removeWhere((element) => element.customer?.id != currentID);
        }
        if (data.isEmpty) {
          return SizedBox();
        }
        if (!widget.isCurrentOrganizer) {
          return WaitingListApprovalStatus(
            serviceBookingId: widget.id,
            data: data.first,
            onJoin: widget.onJoinAfterApproval,
            onWithdraw: widget.onWithdraw,
            refreshApis: widget.refreshApis,
            isForEvent: false,
          );
        }
        return OpenMatchWaitingForApprovalPlayers(
          data: data,
          onApprove: widget.onApprove,
        );
      },
      error: (error, stackTrace) {
        return SecondaryText(text: error.toString());
      },
      loading: () => const Center(
        child: CupertinoActivityIndicator(radius: 5),
      ),
    );
  }
}

class _MatchInfoSettingsTabSelector extends ConsumerWidget {
  const _MatchInfoSettingsTabSelector();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedTab = ref.watch(_selectedTabIndexProvider);
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
        decoration: BoxDecoration(
          color: AppColors.gray,
          border: border,
          borderRadius: BorderRadius.circular(25.r),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildTab(context, ref, "MATCH_INFO".tr(context), 0, selectedTab),
            _buildTab(context, ref, "SETTINGS".tr(context), 1, selectedTab),
          ],
        ),
      ),
    );
  }

  Widget _buildTab(BuildContext context, WidgetRef ref, String text, int index, int selectedTab) {
    final isSelected = selectedTab == index;
    return GestureDetector(
      onTap: () {
        ref.read(_selectedTabIndexProvider.notifier).state = index;
      },
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? AppColors.darkYellow80 : Colors.transparent,
          borderRadius: BorderRadius.circular(25.r),
        ),
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 18.w),
        child: Text(
          text,
          style: isSelected
              ? AppTextStyles.poppinsMedium(
                  fontSize: 13.sp,
                )
              : AppTextStyles.poppinsRegular(
                  color: AppColors.black50,
                  fontSize: 13.sp,
                ),
        ),
      ),
    );
  }
}

class _SettingsTab extends ConsumerWidget {
  const _SettingsTab({required this.service});

  final ServiceDetail service;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final approveBeforeJoin = ref.watch(_approveBeforeJoinProvider);
    final isFriendlyMatch = ref.watch(_isFriendlyMatchProvider);
    final minLevel = ref.watch(_minLevelProvider);
    final maxLevel = ref.watch(_maxLevelProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "SETTINGS".tr(context),
          style: AppTextStyles.poppinsBold(fontSize: 16.sp),
        ),
        SizedBox(height: 15.h),
        // Approve players before they join
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "APPROVE_PLAYERS_BEFORE_THEY_JOIN".tr(context),
              style: AppTextStyles.poppinsRegular(fontSize: 16.sp, color: AppColors.black),
            ),
            GestureDetector(
              onTap: () {
                ref.read(_approveBeforeJoinProvider.notifier).state = !approveBeforeJoin;
              },
              child: Container(
                width: 18.w,
                height: 18.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: approveBeforeJoin ? AppColors.darkYellow80 : AppColors.white,
                  border: Border.all(
                    color: AppColors.black,
                    width: 1.5,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 18.h),
        // Friendly/Ranked Match
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "FRIENDLY_RANKED_MATCH".tr(context),
              style: AppTextStyles.poppinsRegular(fontSize: 14.sp),
            ),
            Row(
              children: [
                _buildToggleButton(
                  context,
                  ref,
                  "FRIENDLY".tr(context),
                  isFriendlyMatch,
                  () {
                    ref.read(_isFriendlyMatchProvider.notifier).state = true;
                  },
                ),
                SizedBox(width: 8.w),
                _buildToggleButton(
                  context,
                  ref,
                  "RANKED".tr(context),
                  !isFriendlyMatch,
                  () {
                    ref.read(_isFriendlyMatchProvider.notifier).state = false;
                  },
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 18.h),
        // Match Level
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "MATCH_LEVEL".tr(context),
              style: AppTextStyles.poppinsRegular(fontSize: 16.sp, color: AppColors.black),
            ),
            Text(
              "${minLevel.toStringAsFixed(1)} - ${maxLevel.toStringAsFixed(1)}",
              style: AppTextStyles.poppinsRegular(fontSize: 14.sp),
            ),
          ],
        ),
        SizedBox(height: 10.h),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            activeTrackColor: AppColors.darkYellow80.withOpacity(0.3),
            inactiveTrackColor: AppColors.black.withOpacity(0.1),
            thumbColor: AppColors.darkYellow80,
            overlayColor: AppColors.darkYellow80.withOpacity(0.1),
            trackHeight: 4.h,
            rangeThumbShape: RoundRangeSliderThumbShape(
              enabledThumbRadius: 10.r,
            ),
          ),
          child: RangeSlider(
            values: RangeValues(minLevel, maxLevel),
            min: 0,
            max: 7,
            divisions: 14,
            onChanged: (values) {
              ref.read(_minLevelProvider.notifier).state = values.start;
              ref.read(_maxLevelProvider.notifier).state = values.end;
            },
          ),
        ),
        // Level labels
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(8, (index) {
              return Text(
                "$index",
                style: AppTextStyles.poppinsRegular(
                  fontSize: 12.sp,
                  color: AppColors.black50,
                ),
              );
            }),
          ),
        ),
      ],
    );
  }

  Widget _buildToggleButton(
    BuildContext context,
    WidgetRef ref,
    String text,
    bool isSelected,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? AppColors.darkYellow80 : AppColors.white,
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: isSelected ? AppColors.darkYellow80 : AppColors.black70,
            width: 1,
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 14.w),
        child: Text(
          text,
          style: isSelected
              ? AppTextStyles.poppinsBold(
                  fontSize: 13.sp,
                )
              : AppTextStyles.poppinsRegular(
                  color: AppColors.black70,
                  fontSize: 13.sp,
                ),
        ),
      ),
    );
  }
}

class _SaveSettingsButton extends ConsumerWidget {
  const _SaveSettingsButton({required this.serviceId, required this.service});

  final int serviceId;
  final ServiceDetail service;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final approveBeforeJoin = ref.watch(_approveBeforeJoinProvider);
    final isFriendlyMatch = ref.watch(_isFriendlyMatchProvider);
    final minLevel = ref.watch(_minLevelProvider);
    final maxLevel = ref.watch(_maxLevelProvider);

    // Compare current values with original service values
    final originalApproveBeforeJoin = service.approveBeforeJoin ?? false;
    final originalIsFriendlyMatch = service.isFriendlyMatch ?? true;
    final originalMinLevel = service.options?.minLevel?.toDouble() ?? 0;
    final originalMaxLevel = service.options?.maxLevel?.toDouble() ?? 7;

    final hasChanges = approveBeforeJoin != originalApproveBeforeJoin ||
        isFriendlyMatch != originalIsFriendlyMatch ||
        minLevel != originalMinLevel ||
        maxLevel != originalMaxLevel;

    if (!hasChanges) return const SizedBox.shrink();

    return Padding(
      padding: EdgeInsets.only(top: 20.h),
      child: MainButton(
        label: "SAVE".trU(context),
        onTap: () async {
          final approveBeforeJoin = ref.read(_approveBeforeJoinProvider);
          final isFriendlyMatch = ref.read(_isFriendlyMatchProvider);
          final minLevel = ref.read(_minLevelProvider);
          final maxLevel = ref.read(_maxLevelProvider);

          try {
            final provider = updateServiceSettingsProvider(
              serviceId: serviceId,
              approveBeforeJoin: approveBeforeJoin,
              friendlyMatch: isFriendlyMatch,
              minLevel: minLevel,
              maxLevel: maxLevel,
            );
            await Utils.showLoadingDialog(context, provider, ref);

            ref.invalidate(fetchServiceDetailProvider(serviceId));

            if (context.mounted) {
              Utils.showMessageDialog(
                context,
                "SETTINGS_SAVED_SUCCESSFULLY".tr(context),
              );
            }
          } catch (e) {
            if (context.mounted) {
              Utils.showMessageDialog(context, e.toString());
            }
          }
        },
      ),
    );
  }
}
