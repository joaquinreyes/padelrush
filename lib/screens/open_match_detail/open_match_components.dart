part of 'open_match_detail.dart';

class _RequestWaitingApprovalCard extends ConsumerWidget {
  const _RequestWaitingApprovalCard({required this.onWithdraw});

  final VoidCallback onWithdraw;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.read(userProvider)?.user;
    final sportsName = getSportsName(ref);
    final levelValue = user?.level(sportsName);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "YOU_ARE_WAITING_FOR_APPROVAL".trU(context),
          style: AppTextStyles.poppinsBold(fontSize: 16.sp),
        ),
        SizedBox(height: 10.h),
        Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(16.r),
            boxShadow: [
              BoxShadow(color: AppColors.black2.withOpacity(0.06), blurRadius: 12, offset: const Offset(0, 3)),
            ],
          ),
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
          child: Row(
            children: [
              NetworkCircleImage(
                path: user?.profileUrl,
                width: 40.w,
                height: 40.h,
                logoColor: AppColors.white,
                borderRadius: BorderRadius.circular(12.r),
                bgColor: AppColors.black2,
                boxBorder: Border.all(color: AppColors.black10),
              ),
              SizedBox(width: 12.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    (user?.firstName ?? "").toUpperCase(),
                    style: AppTextStyles.poppinsSemiBold(fontSize: 13.sp),
                  ),
                  if (levelValue != null)
                    Text(
                      levelValue.toString(),
                      style: AppTextStyles.poppinsRegular(fontSize: 12.sp, color: AppColors.black70),
                    ),
                ],
              ),
              const Spacer(),
              MainButton(
                label: "WITHDRAW_FROM_THE_MATCH".tr(context),
                color: AppColors.darkYellow,
                labelStyle: AppTextStyles.poppinsMedium(fontSize: 12.sp),
                applySize: false,
                applyShadow: true,
                borderRadius: 100.r,
                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 6.h),
                onTap: onWithdraw,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _WaitingApprovalCard extends ConsumerWidget {
  const _WaitingApprovalCard({
    required this.player,
    required this.onWithdraw,
  });

  final ServiceDetail_Players player;
  final VoidCallback onWithdraw;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "YOU_ARE_WAITING_FOR_APPROVAL".trU(context),
          style: AppTextStyles.poppinsMedium(fontSize: 17.sp),
        ),
        SizedBox(height: 10.h),
        Container(
          decoration: BoxDecoration(
            color: AppColors.gray,
            border: border,
            borderRadius: BorderRadius.circular(12.r),
          ),
          padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 15.h),
          child: Row(
            children: [
              NetworkCircleImage(
                path: player.customer?.profileUrl,
                width: 37.w,
                height: 37.h,
                logoColor: AppColors.white,
                borderRadius: BorderRadius.circular(4.r),
                bgColor: AppColors.black2,
                boxBorder: Border.all(color: AppColors.white25),
              ),
              SizedBox(width: 15.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    player.getCustomerName.toUpperCase(),
                    style: AppTextStyles.poppinsMedium(fontSize: 12.sp),
                  ),
                  if ((player.customer?.level(getSportsName(ref))?.isNotEmpty) ?? false)
                    Text(
                      player.customer!.level(getSportsName(ref))!,
                      style: AppTextStyles.poppinsRegular(fontSize: 12.sp),
                    ),
                ],
              ),
              const Spacer(),
              MainButton(
                label: "WITHDRAW_FROM_THE_MATCH".tr(context),
                color: AppColors.darkYellow,
                labelStyle: AppTextStyles.poppinsMedium(fontSize: 13.sp),
                applySize: false,
                applyShadow: true,
                borderRadius: 100.r,
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 6.h),
                onTap: onWithdraw,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _OrganizerPendingApprovalCard extends ConsumerWidget {
  const _OrganizerPendingApprovalCard({
    required this.requests,
    required this.onApprove,
  });

  final List<RequestWaitingList> requests;
  final Function(int) onApprove;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sportsName = getSportsName(ref);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "PLAYERS_REQUESTING_TO_JOIN".trU(context),
          style: AppTextStyles.poppinsMedium(fontSize: 17.sp),
        ),
        SizedBox(height: 10.h),
        Container(
          decoration: BoxDecoration(
            color: AppColors.gray,
            border: border,
            borderRadius: BorderRadius.circular(12.r),
          ),
          padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 15.h),
          child: Column(
            children: [
              for (int i = 0; i < requests.length; i++) ...[
                Row(
                  children: [
                    NetworkCircleImage(
                      borderRadius: BorderRadius.circular(4.r),
                      path: requests[i].customer?.profileUrl,
                      width: 37.h,
                      height: 37.h,
                      boxBorder: Border.all(color: AppColors.white25),
                      bgColor: AppColors.black2,
                    ),
                    SizedBox(width: 15.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          (requests[i].customer?.firstName ?? "").toUpperCase(),
                          style: AppTextStyles.poppinsMedium(fontSize: 12.sp),
                        ),
                        if ((requests[i].customer?.level(sportsName)?.isNotEmpty) ?? false)
                          Text(
                            requests[i].customer!.level(sportsName)!,
                            style: AppTextStyles.poppinsRegular(fontSize: 12.sp),
                          ),
                      ],
                    ),
                    const Spacer(),
                    MainButton(
                      label: "APPROVE".tr(context),
                      color: AppColors.darkYellow,
                      padding: EdgeInsets.only(
                          left: 15.w, right: 15.w, top: 6.h, bottom: 6.h),
                      labelStyle: AppTextStyles.poppinsMedium(fontSize: 13.sp),
                      borderRadius: 100.r,
                      applySize: false,
                      applyShadow: true,
                      onTap: () => onApprove(requests[i].id!),
                    ),
                  ],
                ),
                if (i < requests.length - 1) ...[
                  SizedBox(height: 5.h),
                  CDivider(),
                  SizedBox(height: 5.h),
                ],
              ],
            ],
          ),
        ),
      ],
    );
  }
}

class _RankedOrFriendly extends StatelessWidget {
  const _RankedOrFriendly({
    this.isRanked = true,
  });

  final bool isRanked;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.lightGray,
        borderRadius: BorderRadius.circular(100.r),
      ),
      padding: EdgeInsets.all(3.h),
      child: Row(
        children: [
          _buildWidget("FRIENDLY".tr(context), !isRanked),
          SizedBox(width: 2.w),
          _buildWidget("RANKED".tr(context), isRanked),
        ],
      ),
    );
  }

  _buildWidget(String text, bool isSelected) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.black2 : Colors.transparent,
        borderRadius: BorderRadius.circular(100.r),
      ),
      padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 12.w),
      child: Text(
        text,
        style: isSelected
            ? AppTextStyles.poppinsSemiBold(
                fontSize: 12.sp, color: AppColors.white)
            : AppTextStyles.poppinsRegular(
                color: AppColors.black70,
                fontSize: 12.sp,
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
          style: AppTextStyles.poppinsBold(fontSize: 16.sp),
        ),
        SizedBox(height: 8.h),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: AppColors.darkYellow30,
            borderRadius: BorderRadius.circular(14.r),
          ),
          padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 14.w),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.format_quote_rounded, size: 18.sp, color: AppColors.black70),
              SizedBox(width: 8.w),
              Expanded(
                child: Text(
                  note,
                  style: AppTextStyles.poppinsRegular(fontSize: 13.sp),
                ),
              ),
            ],
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Dark header
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
                    service.formattedDateStartEndTimeAM12,
                    style: AppTextStyles.poppinsSemiBold(
                      fontSize: 13.sp,
                      color: AppColors.white,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: service.isPrivate ? AppColors.darkYellow : AppColors.darkYellow50,
                    borderRadius: BorderRadius.circular(100.r),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        service.isPrivate ? Icons.lock : Icons.public,
                        size: 12.sp,
                        color: AppColors.black2,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        service.isPrivate
                            ? "PRIVATE".tr(context)
                            : "OPEN".tr(context),
                        style: AppTextStyles.poppinsSemiBold(
                          fontSize: 11.sp,
                          color: AppColors.black2,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Body
          Padding(
            padding: EdgeInsets.all(16.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Organizer
                _organizer(context, service.organizer, ref),
                SizedBox(width: 16.w),
                // Details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(Icons.location_on_outlined, size: 14.sp, color: AppColors.black70),
                          SizedBox(width: 3.w),
                          Flexible(
                            child: Text(
                              "${service.courts?.first.courtName ?? ""} | ${service.service?.location?.locationName ?? ""}"
                                  .capitalizeFirst,
                              textAlign: TextAlign.end,
                              style: AppTextStyles.poppinsMedium(
                                fontSize: 13.sp,
                                color: AppColors.black70,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8.h),
                      if (level.isNotEmpty)
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
                          decoration: BoxDecoration(
                            color: AppColors.darkYellow30,
                            borderRadius: BorderRadius.circular(100.r),
                          ),
                          child: Text(
                            level,
                            style: AppTextStyles.poppinsSemiBold(fontSize: 11.sp),
                          ),
                        ),
                      SizedBox(height: 8.h),
                      Text(
                        "${"PRICE".tr(context)} ${Utils.formatPrice(service.pricePaid(ref))}",
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

  Widget _organizer(
      BuildContext context, ServiceDetail_Players? organizer, WidgetRef ref) {
    if (organizer == null) {
      return SizedBox(
        child: Text(
          "NO_ORGANIZER".tr(context),
          textAlign: TextAlign.center,
          style: AppTextStyles.poppinsRegular(fontSize: 13.sp),
        ),
      );
    }
    String level =
        organizer.customer?.level(getSportsName(ref)).toString() ?? "N/A";
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'ORGANIZER'.tr(context),
          style: AppTextStyles.poppinsRegular(fontSize: 10.sp, color: AppColors.black70),
        ),
        SizedBox(height: 6.h),
        NetworkCircleImage(
          path: organizer.customer?.profileUrl,
          width: 44.h,
          height: 44.h,
          bgColor: AppColors.black2,
          boxBorder: Border.all(color: AppColors.black10),
          borderRadius: BorderRadius.circular(14.r),
        ),
        SizedBox(height: 6.h),
        Text(
          organizer.getCustomerName.capitalizeFirst,
          textAlign: TextAlign.center,
          style: AppTextStyles.poppinsSemiBold(fontSize: 12.sp),
        ),
        Text(
          "$level ${getRankLabel(double.tryParse(level) ?? 0)}",
          textAlign: TextAlign.center,
          style: AppTextStyles.poppinsRegular(fontSize: 11.sp, color: AppColors.black70),
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
      required this.isCurrentOrganizer,
      this.refreshApis,
      this.excludeCustomerIds = const {}});

  final int id;
  final Function(int) onApprove;
  final Function? refreshApis;
  final Function(int) onJoinAfterApproval;
  final Function(int) onWithdraw;
  final bool isCurrentOrganizer;
  final Set<int> excludeCustomerIds;

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
        final data = list.where((e) =>
            !widget.excludeCustomerIds.contains(e.customer?.id)).toList();
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
          return const SizedBox.shrink();
        }
        if (!widget.isCurrentOrganizer) {
          return Padding(
            padding: EdgeInsets.only(top: 20.h, bottom: 5.h),
            child: WaitingListApprovalStatus(
              serviceBookingId: widget.id,
              data: data.first,
              onJoin: widget.onJoinAfterApproval,
              onWithdraw: widget.onWithdraw,
              refreshApis: widget.refreshApis,
              isForEvent: false,
            ),
          );
        }
        return Padding(
          padding: EdgeInsets.only(top: 20.h, bottom: 5.h),
          child: OpenMatchWaitingForApprovalPlayers(
            data: data,
            onApprove: widget.onApprove,
          ),
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
    return Container(
      padding: EdgeInsets.all(3.h),
      decoration: BoxDecoration(
        color: AppColors.lightGray,
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Row(
        children: [
          _buildTab(context, ref, "MATCH_INFO".tr(context), 0, selectedTab),
          _buildTab(context, ref, "SETTINGS".tr(context), 1, selectedTab),
        ],
      ),
    );
  }

  Widget _buildTab(BuildContext context, WidgetRef ref, String text, int index, int selectedTab) {
    final isSelected = selectedTab == index;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          ref.read(_selectedTabIndexProvider.notifier).state = index;
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.black2 : Colors.transparent,
            borderRadius: BorderRadius.circular(11.r),
            boxShadow: isSelected
                ? [BoxShadow(color: AppColors.black2.withOpacity(0.15), blurRadius: 8, offset: const Offset(0, 2))]
                : [],
          ),
          padding: EdgeInsets.symmetric(vertical: 10.h),
          alignment: Alignment.center,
          child: Text(
            text,
            style: isSelected
                ? AppTextStyles.poppinsSemiBold(fontSize: 13.sp, color: AppColors.white)
                : AppTextStyles.poppinsMedium(color: AppColors.black50, fontSize: 13.sp),
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
