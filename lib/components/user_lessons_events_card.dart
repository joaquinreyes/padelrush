import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:padelrush/app_styles/app_colors.dart';
import 'package:padelrush/app_styles/app_text_styles.dart';
import 'package:padelrush/components/c_divider.dart';
import 'package:padelrush/components/changes_cancelled_listing_card.dart';
import 'package:padelrush/components/ranked_component.dart';
import 'package:padelrush/components/service_detail_components.dart/event_lesson_card_coach.dart';
import 'package:padelrush/components/service_detail_components.dart/level_restriction_container.dart';
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
    final color = isCancelled || isPlayerPendingPayment ? AppColors.darkYellow60 : AppColors.gray;
    final textColor = isCancelled || isPlayerPendingPayment ? AppColors.black : AppColors.black;
    final pax = booking.minimumCapacity == null
        ? " - ${booking.maximumCapacity ?? 0} pax"
        : "";

    final isRankedEvent = booking.rankedEvent ?? false;
    return Container(
      padding: EdgeInsets.all(15.h),
      constraints: kComponentWidthConstraint,
      decoration: BoxDecoration(
        color: color,
        border: border,
        borderRadius: BorderRadius.all(Radius.circular(12.r)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if ((isWaiting || inWaitingList) && !isCancelled) ...[
            if (isApproved)
              ChangesCancelledListingCard(
                  text: "APPROVED_TO_JOIN_NOW".tr(context)),
            if (inWaitingList)
              ChangesCancelledListingCard(text: "IN_WAITING_LIST".tr(context)),
            if (isWaiting) const WaitingForApproval(),
            SizedBox(height: 5.h)
          ],
          if (isCancelled) ...[
            ChangesCancelledListingCard(text: cancelText),
            SizedBox(height: 10.h),
          ],
          if (isPlayerPendingPayment)
            Padding(
              padding: EdgeInsets.only(bottom: 15.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ChangesCancelledListingCard(
                    color: AppColors.white,
                    isUpperCase: false,
                    iconColor: AppColors.black2,
                    textColor: AppColors.black2,
                    padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 15.w),
                    style: AppTextStyles.poppinsSemiBold(fontSize: 13.sp, color: AppColors.black2),
                    text: "BOOKING_UNPAID".tr(context),
                  ),
                  MainButton(
                    label: "PAY_NOW".tr(context),
                    onTap: () async {
                      String sportName = "";
                      if ((booking.players ?? []).isNotEmpty &&
                          booking.players!.first.customer!.sportsLevel
                              .isNotEmpty) {
                        sportName = booking.players!.first.customer!.sportsLevel
                            .first.sportName ??
                            "";
                      }

                      List<bookingModel.BookingCourts> listCourts = [];

                      (booking.courts ?? []).map((e) {
                        listCourts.add(
                            bookingModel.BookingCourts.fromJson(e.toJson()));
                      }).toList();
                      final isEvent = (booking.service?.serviceType ?? "").toLowerCase() == "event";
                      final singleEvent =
                          (booking.service?.eventType ?? "").toLowerCase() == "single";
                      dynamic paid = await showDialog(
                        context: context,
                        builder: (context) {
                          return BookCourtDialog(
                            allowPayLater: false,

                            getPendingPayment: true,
                            joinOpenMatch: false,
                            joinEvent: isEvent,
                            joinLesson: !isEvent,
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
                                    locationName: booking
                                        .service!.location!.locationName)),
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
                    },
                    width: 85.w,
                    isForPopup: true,
                    height: 30.h,
                    labelStyle: AppTextStyles.poppinsBold(
                        fontSize: 14.sp),
                    padding: EdgeInsets.zero,
                  )
                ],
              ),
            ),
          Row(
            children: [
              Expanded(
                flex: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      booking.service?.eventLessonName ?? "",
                      style: AppTextStyles.poppinsBold(
                        color: textColor,
                        fontSize: 15.sp,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    LevelRestrictionContainer(
                      levelRestriction:
                          booking.service?.event?.levelRestriction,
                    )
                  ],
                ),
              ),
              const Spacer(),
              Expanded(
                flex: 8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      Utils.eventLessonStatusText(
                        context: context,
                        playersCount: booking.players?.length ?? 0,
                        maxCapacity: booking.getMaximumCapacity,
                        minCapacity: booking.getMinimumCapacity,
                      ),
                      style: AppTextStyles.poppinsBold(
                        color: textColor,
                        fontSize: 13.sp,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    EventLessonCardCoach(
                      coaches: booking.getCoaches,
                      textColor: textColor,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 1.h),
          CDivider(
            color: isCancelled ? AppColors.white25 : AppColors.black5,
          ),
          if (isRankedEvent)
            Align(alignment: Alignment.centerRight, child: RankedComponent()),
          SizedBox(height: 2.h),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ("${booking.service?.location?.locationName ?? ""}" )
                        .capitalizeFirst,
                    style: AppTextStyles.poppinsRegular(
                      color: textColor,
                      fontSize: 13.sp,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    "${"PRICE".tr(context)} ${Utils.formatPriceNew(booking.service?.price?.toDouble())}",
                    style: AppTextStyles.poppinsRegular(
                      color: textColor,
                      fontSize: 13.sp,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    booking.formatBookingDate,
                    style: AppTextStyles.poppinsRegular(
                      color: textColor,
                      fontSize: 13.sp,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    "${booking.formatStartEndTimeAM.toLowerCase()}$pax",
                    style: AppTextStyles.poppinsRegular(
                      color: textColor,
                      fontSize: 13.sp,
                    ),
                  ),
                ],
              ),
            ],
          ),
          if ((booking.service?.isEvent ?? false) &&
              isPast &&
              (booking.scoreSubmitted ?? false) &&
              booking.getMyPositionEvent(currentUserID ?? 0) != null)
            Container(
              decoration: BoxDecoration(
                color: AppColors.darkYellow,
                borderRadius: BorderRadius.circular(12.r),
              ),
              margin: EdgeInsets.only(top: 5),
              padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 13.w),
              child: Text(
                "${(booking.getMyPositionEvent(currentUserID ?? 0) ?? 0).getUserPosition} Place",
                style: AppTextStyles.poppinsSemiBold(
                  fontSize: 14.sp,
                ),
              ),
            )
        ],
      ),
    );
  }
}
