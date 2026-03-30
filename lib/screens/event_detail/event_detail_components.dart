part of 'event_detail.dart';

class _InfoCard extends ConsumerWidget {
  const _InfoCard({
    required this.event,
  });

  final ServiceDetail event;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String? levelRestriction = event.service?.event?.levelRestriction;
    final coaches = event.getCoaches;
    final hasCoaches = coaches.isNotEmpty;
    final String? imageUrl = event.service?.event?.imageUrl;
    final bool hasImage = imageUrl != null && imageUrl.isNotEmpty;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20.r),
      child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.black2.withOpacity(0.10),
            blurRadius: 20,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // ── Cover image ──
          if (hasImage)
            SizedBox(
              width: double.infinity,
              height: 160.h,
              child: Image.network(
                imageUrl!,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => const SizedBox.shrink(),
              ),
            ),
          // ── Dark header ──
          Container(
            padding: EdgeInsets.fromLTRB(20.w, 18.h, 20.w, 16.h),
            decoration: BoxDecoration(
              color: AppColors.black2,
              borderRadius: BorderRadius.only(
                topLeft: hasImage ? Radius.zero : Radius.circular(20.r),
                topRight: hasImage ? Radius.zero : Radius.circular(20.r),
                bottomLeft: hasCoaches ? Radius.zero : Radius.circular(20.r),
                bottomRight: hasCoaches ? Radius.zero : Radius.circular(20.r),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Event name + location
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        (event.service?.event?.eventName ?? "").capitalizeFirst,
                        style: AppTextStyles.poppinsBold(
                          fontSize: 20.sp,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 12.w, vertical: 5.h),
                      decoration: BoxDecoration(
                        color: AppColors.darkYellow,
                        borderRadius: BorderRadius.circular(100.r),
                      ),
                      child: Text(
                        event.service?.location?.locationName ?? "",
                        style: AppTextStyles.poppinsSemiBold(
                          fontSize: 11.sp,
                          color: AppColors.black2,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 14.h),

                // Date & Time row
                Row(
                  children: [
                    Icon(Icons.calendar_today_rounded,
                        size: 14.sp, color: AppColors.darkYellow),
                    SizedBox(width: 6.w),
                    Text(
                      event.bookingDate.format("EEE dd MMM yyyy"),
                      style: AppTextStyles.poppinsMedium(
                        fontSize: 13.sp,
                        color: AppColors.white,
                      ),
                    ),
                    SizedBox(width: 16.w),
                    Icon(Icons.access_time_rounded,
                        size: 14.sp, color: AppColors.darkYellow),
                    SizedBox(width: 4.w),
                    Text(
                      "${event.bookingStartTime.format("HH:mm")} – ${event.bookingEndTime.format("HH:mm")}",
                      style: AppTextStyles.poppinsMedium(
                        fontSize: 13.sp,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.h),

                // Stats chips row
                Row(
                  children: [
                    // Price chip
                    _statChip(
                      icon: Icons.payments_outlined,
                      label: Utils.formatPrice(event.service?.price),
                    ),
                    SizedBox(width: 8.w),
                    // Slots chip
                    _statChip(
                      icon: Icons.group_outlined,
                      label:
                          "${event.players?.length ?? 0}/${event.getMaximumCapacity}",
                    ),
                    if (levelRestriction != null) ...[
                      SizedBox(width: 8.w),
                      _statChip(
                        icon: Icons.trending_up_rounded,
                        label:
                            "${"LEVEL".tr(context)} $levelRestriction",
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),

          // ── Coach strip ──
          if (hasCoaches)
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
              decoration: BoxDecoration(
                color: AppColors.darkYellow,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20.r),
                  bottomRight: Radius.circular(20.r),
                ),
              ),
              child: Row(
                children: [
                  ...coaches.take(3).map((coach) => Padding(
                        padding: EdgeInsets.only(right: 6.w),
                        child: NetworkCircleImage(
                          path: coach.profileUrl,
                          width: 28.w,
                          height: 28.w,
                          borderRadius: BorderRadius.circular(100.r),
                          boxBorder:
                              Border.all(color: AppColors.black2, width: 1.5),
                          bgColor: AppColors.black2,
                          logoColor: AppColors.white,
                        ),
                      )),
                  SizedBox(width: 4.w),
                  Flexible(
                    child: Text(
                      coaches.length == 1
                          ? "${"COACH".tr(context)} ${coaches.first.fullName ?? ""}"
                          : "${coaches.length} ${"COACHES".tr(context)}",
                      style: AppTextStyles.poppinsSemiBold(
                        fontSize: 12.sp,
                        color: AppColors.black2,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
      ),
    );
  }

  Widget _statChip({required IconData icon, required String label}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: AppColors.white10,
        borderRadius: BorderRadius.circular(100.r),
        border: Border.all(color: AppColors.white25, width: 0.5),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14.sp, color: AppColors.darkYellow),
          SizedBox(width: 5.w),
          Text(
            label,
            style: AppTextStyles.poppinsSemiBold(
              fontSize: 12.sp,
              color: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }
}

enum _ConfirmationDialogType {
  join,
  leave,
  joinWaitingLit,
  approvePlayer,
  applyForApproval,
  withdraw,
  reserve,
  releaseReserve,
}

class _ConfirmationDialog extends StatelessWidget {
  const _ConfirmationDialog({required this.type, this.policy});

  final _ConfirmationDialogType type;
  final CancellationPolicy? policy;

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
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
          if (type != _ConfirmationDialogType.withdraw) ...[
            SizedBox(height: 5.h),
            Text(
              _descText(context),
              textAlign: TextAlign.center,
              style: AppTextStyles.popupBodyTextStyle,
            ),
          ],
          if (type == _ConfirmationDialogType.leave)
            Text(
              policy == null
                  ? "LEAVE_POLICY_EVENT".tr(context)
                  : (policy!.cancellationHours == 0
                      ? "YOU_WILL_NOT_GET_REFUND_ON_THIS_BOOKING".tr(context)
                      : "CANCELLATION_POLICY_3".tr(context, params: {
                          "HOUR": policy!.cancellationHours.toString(),
                          "REFUND": (policy!.refund ?? 0).toStringAsFixed(1)
                        })),
              textAlign: TextAlign.center,
              style: AppTextStyles.popupBodyTextStyle,
            ),
          SizedBox(height: 20.h),
          MainButton(
            label: _buttonText(context),
            isForPopup: true,
            onTap: () {
              Navigator.pop(context, true);
            },
          )
        ],
      ),
    );
  }

  _headingText(BuildContext context) {
    switch (type) {
      case _ConfirmationDialogType.join:
        return "ARE_YOU_SURE_YOU_WANT_TO_JOIN".trU(context);
      case _ConfirmationDialogType.leave:
        return "ARE_YOU_SURE_YOU_WANT_TO_LEAVE".trU(context);
      case _ConfirmationDialogType.joinWaitingLit:
        return "ARE_YOU_SURE_YOU_WANT_TO_JOIN_THE_WAITING_LIST".trU(context);
      case _ConfirmationDialogType.approvePlayer:
        return "ARE_YOU_SURE_YOU_WANT_TO_APPROVE_THIS_PLAYER".trU(context);
      case _ConfirmationDialogType.applyForApproval:
        return "WILL_REQUIRE_APPROVAL".trU(context);
      case _ConfirmationDialogType.reserve:
        return "ARE_YOU_SURE_YOU_WANT_TO_RESERVE_THIS_SPOT".trU(context);
      case _ConfirmationDialogType.releaseReserve:
        return "ARE_YOU_SURE_YOU_WANT_TO_RELEASE_THIS_RESERVED_SPOT"
            .trU(context);
      case _ConfirmationDialogType.withdraw:
        return "ARE_YOU_SURE_YOU_WANT_TO_WITHDRAW_FROM_THE_MATCH".trU(context);
    }
  }

  _descText(BuildContext context) {
    switch (type) {
      case _ConfirmationDialogType.join:
        return "IF_YOU_JOIN_DESC_EVENT".tr(context);
      case _ConfirmationDialogType.leave:
        return "IF_YOU_LEAVE_DESC_EVENT".tr(context);
      case _ConfirmationDialogType.joinWaitingLit:
        return "IF_YOU_JOIN_DESC_WAITING_LIST".tr(context);
      case _ConfirmationDialogType.releaseReserve:
      case _ConfirmationDialogType.approvePlayer:
        return "THIS_ACTION_CANNOT_BE_UNDONE".tr(context);
      case _ConfirmationDialogType.applyForApproval:
        return "WILL_REQUIRE_APPROVAL_DESC".tr(context);
      case _ConfirmationDialogType.reserve:
        return "YOU_WONT_BE_ABLE_TO_EDIT_THIS_LATER".tr(context);
      case _ConfirmationDialogType.withdraw:
        return "";
    }
  }

  _buttonText(BuildContext context) {
    switch (type) {
      case _ConfirmationDialogType.join:
        return "JOIN_PAY_MY_SHARE".trU(context);

      case _ConfirmationDialogType.leave:
        return "LEAVE".trU(context);
      case _ConfirmationDialogType.joinWaitingLit:
        return "JOIN_WAITING_LIST".trU(context);
      case _ConfirmationDialogType.approvePlayer:
        return "APPROVE_PLAYER".trU(context);
      case _ConfirmationDialogType.applyForApproval:
        return "APPLY_TO_TEAM".trU(context);
      case _ConfirmationDialogType.withdraw:
        return "YES_WITHDRAW".trU(context);
      case _ConfirmationDialogType.releaseReserve:
        return "RELEASE_THIS_SPOT".trU(context);
      case _ConfirmationDialogType.reserve:
        return "RESERVE_PAY_SLOT".trU(context);
    }
  }
}

class _WaitingPlayersSlots extends ConsumerStatefulWidget {
  const _WaitingPlayersSlots({
    required this.players,
    required this.maxPlayers,
    required this.onSlotTap,
    required this.service,
    required this.isDoubleEvents,
    required this.isInWaitingList,
    required this.id,
    required this.onWithdraw,
  });

  final List<BookingPlayerBase> players;
  final int maxPlayers;
  final Function(int, int?) onSlotTap;
  final Function onWithdraw;

  final bool isDoubleEvents;
  final ServiceDetail service;
  final int id;
  final bool isInWaitingList;

  @override
  ConsumerState<_WaitingPlayersSlots> createState() =>
      _WaitingPlayersSlotsState();
}

class _WaitingPlayersSlotsState extends ConsumerState<_WaitingPlayersSlots> {
  @override
  Widget build(BuildContext context) {
    int maxPlayers = widget.isDoubleEvents
        ? (widget.maxPlayers.isEven ? widget.maxPlayers : widget.maxPlayers - 1)
        : widget.maxPlayers;
    bool showWaitingList = checkShowWaitingList(widget.service);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(6.h),
              decoration: BoxDecoration(
                color: AppColors.darkYellow30,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Icon(Icons.hourglass_bottom_rounded,
                  size: 14.sp, color: AppColors.black2),
            ),
            SizedBox(width: 10.w),
            Text(
              "WAITING_LIST".tr(context),
              style: AppTextStyles.poppinsBold(
                fontSize: 16.sp,
              ),
            ),
            const Spacer(),
            if (showWaitingList)
              Container(
                padding:
                    EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: AppColors.lightGray,
                  borderRadius: BorderRadius.circular(100.r),
                ),
                child: Text(
                  "${widget.players.length}",
                  style: AppTextStyles.poppinsSemiBold(fontSize: 12.sp),
                ),
              ),
          ],
        ),
        SizedBox(height: 10.h),
        showWaitingList
            ? Container(
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
                padding: EdgeInsets.all(16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    widget.isDoubleEvents
                        ? _DoubleEventPlayers(
                            id: widget.id,
                            service: widget.service,
                            players: widget.players,
                            onSlotTap: widget.onSlotTap,
                            maxPlayers: maxPlayers,
                            isWellnessSports: widget.service.isWellnessSport,
                            isWaitingList: true,
                            onRelease: null,
                            showRelease: false,
                          )
                        : _SingleEventPlayers(
                            service: widget.service,
                            maxPlayers: maxPlayers - 2,
                            players: widget.players,
                            onSlotTap: widget.onSlotTap,
                            isWellnessSports: widget.service.isWellnessSport,
                          )
                  ],
                ))
            : Padding(
                padding: EdgeInsets.only(top: 0, left: 12.w),
                child: Text("THERE_IS_NO_WAITING_LIST".tr(context),
                    style: AppTextStyles.poppinsRegular(
                      color: AppColors.black70,
                      fontSize: 13.sp,
                    )),
              ),
        SizedBox(height: 10.h),
        if (showWaitingList && widget.isInWaitingList)
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: SecondaryImageButton(
              label: "LEAVE_WAITING_LIST".tr(context),
              image: AppImages.crossIcon.path,
              imageHeight: 10.w,
              imageWidth: 10.w,
              onTap: () {
                widget.onWithdraw();
              },
            ),
          )
      ],
    );
  }
}

bool checkIfPlayerFilled(ServiceDetail service) {
  var servicePlayers = [...(service.players ?? [])];
  servicePlayers
      .removeWhere((e) => (e.isCanceled ?? false) || (e.isWaiting ?? false));

  int maxCount = service.getMaximumCapacity;

  return (service.service?.isDoubleEvent ?? false)
      ? (servicePlayers.length >= (maxCount))
      : (servicePlayers.length == maxCount);
}

bool checkShowWaitingList(ServiceDetail service) {
  return service.service?.event?.waitingList ?? true;
}
