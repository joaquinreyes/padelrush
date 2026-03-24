import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:padelrush/app_styles/app_colors.dart';
import 'package:padelrush/app_styles/app_text_styles.dart';
import 'package:padelrush/components/changes_cancelled_listing_card.dart';
import 'package:padelrush/components/ranked_component.dart';
import 'package:padelrush/components/service_detail_components.dart/event_lesson_card_coach.dart';
import 'package:padelrush/components/waiting_for_approval.dart';
import 'package:padelrush/globals/constants.dart';
import 'package:padelrush/globals/utils.dart';
import 'package:padelrush/managers/user_manager.dart';
import 'package:padelrush/models/user_bookings.dart';
import 'package:padelrush/utils/custom_extensions.dart';
import 'package:padelrush/models/court_booking.dart' as bookingModel;
import '../repository/booking_repo.dart';
import '../repository/user_repo.dart';
import '../screens/home_screen/tabs/booking_tab/book_court_dialog/book_court_dialog.dart';
import 'main_button.dart';

class UserLessonsEventsCard extends ConsumerWidget {
  const UserLessonsEventsCard(
      {super.key,
      required this.booking,
      required this.isPast,
      this.isLesson = false});

  final UserBookings booking;
  final bool isLesson;
  final bool isPast;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isPlayerPendingPayment = booking.isPlayerPendingPayment(ref);

    final currentUserID = ref.read(userManagerProvider).user?.user?.id;
    bool isPlayerCancelled = false;

    final index = booking.players?.indexWhere(
      (element) => element.customer?.id == currentUserID,
    );

    if (index == -1 || index == null) {
      final index2 = booking.requestWaitingList?.indexWhere(
        (element) => element.id == currentUserID,
      );
      if (index2 == -1 || index == null) {
        return const SizedBox();
      }
    } else {
      isPlayerCancelled = booking.players?[index].isCanceled ?? false;
    }
    bool isEventCancelled = booking.isCancelled ?? false;
    bool isCancelled = isPlayerCancelled || isEventCancelled;
    bool isWaiting = false;

    bool isApproved = false;
    bool inWaitingList = false;
    if ((booking.requestWaitingList ?? []).isNotEmpty) {
      String status = (booking.requestWaitingList ?? []).first.status ?? "";
      isWaiting = status == "pending" || status == "waiting_approval";
      inWaitingList = status == "waiting";
      isApproved = status == "approved";
    }
    String cancelText = "";
    if (isPlayerCancelled) {
      cancelText = "YOU_HAVE_LEFT_SUCCESSFULLY".tr(context);
    }
    if (isEventCancelled) {
      cancelText = isLesson
          ? "LESSON_CANCELLED".tr(context)
          : "EVENT_CANCELLED".tr(context);
    }
    final bool hasStatusBanner = isCancelled || isPlayerPendingPayment || ((isWaiting || inWaitingList) && !isCancelled);
    final isRankedEvent = booking.rankedEvent ?? false;
    final String? levelRestriction = booking.service?.event?.levelRestriction;

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
          // Status banner
          if (hasStatusBanner)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
              decoration: BoxDecoration(
                color: isCancelled
                    ? AppColors.black10
                    : isPlayerPendingPayment
                        ? AppColors.darkYellow60
                        : AppColors.darkYellow30,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.r),
                  topRight: Radius.circular(16.r),
                ),
              ),
              child: Row(
                children: [
                  if ((isWaiting || inWaitingList) && !isCancelled && !isPlayerPendingPayment) ...[
                    if (isApproved)
                      Expanded(child: ChangesCancelledListingCard(text: "APPROVED_TO_JOIN_NOW".tr(context))),
                    if (inWaitingList)
                      Expanded(child: ChangesCancelledListingCard(text: "IN_WAITING_LIST".tr(context))),
                    if (isWaiting)
                      Expanded(
                        child: WaitingForApproval(
                          title: "WAITING_FOR_APPROVAL".tr(context).capitalizeFirst,
                          backgroundColor: AppColors.darkYellow80,
                          titleStyle: AppTextStyles.poppinsSemiBold(
                            fontSize: 12.sp,
                            color: AppColors.black2,
                          ),
                        ),
                      ),
                  ],
                  if (isCancelled)
                    Expanded(child: ChangesCancelledListingCard(text: cancelText)),
                  if (isPlayerPendingPayment && !isCancelled) ...[
                    ChangesCancelledListingCard(
                      color: AppColors.white,
                      isUpperCase: false,
                      iconColor: AppColors.black2,
                      textColor: AppColors.black2,
                      padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 15.w),
                      style: AppTextStyles.poppinsSemiBold(fontSize: 13.sp, color: AppColors.black2),
                      text: "BOOKING_UNPAID".tr(context),
                    ),
                    const Spacer(),
                    MainButton(
                      label: "PAY_NOW".tr(context),
                      onTap: () => _handlePayNow(context, ref),
                      width: 85.w,
                      height: 30.h,
                      isForPopup: true,
                      labelStyle: AppTextStyles.poppinsBold(fontSize: 14.sp),
                      padding: EdgeInsets.zero,
                    ),
                  ],
                ],
              ),
            ),

          // Dark header with name + location + time
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            decoration: BoxDecoration(
              color: AppColors.black2,
              borderRadius: hasStatusBanner
                  ? BorderRadius.zero
                  : BorderRadius.only(
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
                        booking.service?.eventLessonName ?? "",
                        style: AppTextStyles.poppinsSemiBold(
                          fontSize: 15.sp,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                    Text(
                      booking.service?.location?.locationName ?? "",
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
                      booking.formattedDateStartEndTimeAMH,
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

          // Body: coaches + price
          Padding(
            padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 12.h),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: EventLessonCardCoach(
                    coaches: booking.getCoaches,
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        Utils.formatPriceNew(booking.service?.price?.toDouble()),
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
                          "${booking.players?.length ?? 0}/${booking.getMaximumCapacity}",
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

          // Footer: status + ranked + level + position
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
                    playersCount: booking.players?.length ?? 0,
                    maxCapacity: booking.getMaximumCapacity,
                    minCapacity: booking.getMinimumCapacity,
                  ).tr(context),
                  style: AppTextStyles.poppinsMedium(
                    fontSize: 12.sp,
                    color: AppColors.black70,
                  ),
                ),
                const Spacer(),
                if ((booking.service?.isEvent ?? false) &&
                    isPast &&
                    (booking.scoreSubmitted ?? false) &&
                    booking.getMyPositionEvent(currentUserID ?? 0) != null) ...[
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
                    decoration: BoxDecoration(
                      color: AppColors.darkYellow,
                      borderRadius: BorderRadius.circular(100.r),
                    ),
                    child: Text(
                      "${(booking.getMyPositionEvent(currentUserID ?? 0) ?? 0).getUserPosition} Place",
                      style: AppTextStyles.poppinsSemiBold(fontSize: 11.sp),
                    ),
                  ),
                  SizedBox(width: 8.w),
                ],
                if (isRankedEvent) ...[
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

  void _handlePayNow(BuildContext context, WidgetRef ref) async {
    String sportName = "";
    if ((booking.players ?? []).isNotEmpty &&
        booking.players!.first.customer!.sportsLevel.isNotEmpty) {
      sportName =
          booking.players!.first.customer!.sportsLevel.first.sportName ?? "";
    }

    List<bookingModel.BookingCourts> listCourts = [];
    (booking.courts ?? []).map((e) {
      listCourts.add(bookingModel.BookingCourts.fromJson(e.toJson()));
    }).toList();

    final isEvent = (booking.service?.serviceType ?? "").toLowerCase() == "event";
    final singleEvent = (booking.service?.eventType ?? "").toLowerCase() == "single";

    dynamic paid = await showDialog(
      context: context,
      builder: (context) {
        return BookCourtDialog(
          allowPayLater: false,
          getPendingPayment: true,
          payRemainingOpenMatch: false,
          payRemainingEvent: isEvent,
          payRemainingLesson: !isEvent,
          eventDoubleJoin: !singleEvent,
          showRefund: true,
          coachId: null,
          courtPriceRequestType: CourtPriceRequestType.join,
          bookings: bookingModel.Bookings(
              id: booking.id,
              price: booking.service!.price,
              duration: booking.duration2,
              isOpenMatch: true,
              sport: bookingModel.Sport(sportName: sportName),
              location: bookingModel.Location(
                  id: booking.service!.location!.id,
                  courts: listCourts,
                  locationName: booking.service!.location!.locationName)),
          bookingTime: booking.bookingStartTime,
          court: {
            (booking.courts ?? []).first.id ?? 0:
                (booking.courts ?? []).first.courtName ?? ""
          },
        );
      },
    );

    if (paid is bool && paid) {
      Utils.showMessageDialog(
          context, "YOU_HAVE_PAID_SUCCESSFULLY".tr(context));
      ref.invalidate(fetchUserAllBookingsProvider);
      ref.invalidate(walletInfoProvider);
    }
  }
}
