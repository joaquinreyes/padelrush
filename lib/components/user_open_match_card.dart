import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:padelrush/app_styles/app_colors.dart';
import 'package:padelrush/app_styles/app_text_styles.dart';
import 'package:padelrush/components/c_divider.dart';
import 'package:padelrush/components/changes_cancelled_listing_card.dart';
import 'package:padelrush/components/open_match_participant_row.dart';
import 'package:padelrush/components/waiting_for_approval.dart';
import 'package:padelrush/globals/constants.dart';
import 'package:padelrush/globals/utils.dart';
import 'package:padelrush/models/user_bookings.dart';
import 'package:padelrush/utils/custom_extensions.dart';
import 'package:padelrush/models/court_booking.dart' as bookingModel;
import '../repository/booking_repo.dart';
import '../repository/user_repo.dart';
import '../screens/home_screen/tabs/booking_tab/book_court_dialog/book_court_dialog.dart';
import '../screens/open_match_detail/dupr_ranked_component.dart';
import 'main_button.dart';

class UserOpenMatchCard extends ConsumerWidget {
  const UserOpenMatchCard({super.key, required this.booking});

  final UserBookings booking;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isPlayerPendingPayment = booking.isPlayerPendingPayment(ref);

    bool isCancelled = booking.isCancelled ?? false;
    final color = isCancelled || isPlayerPendingPayment ? AppColors.darkYellow60 : AppColors.gray;
    final textColor = isCancelled || isPlayerPendingPayment ? AppColors.black : AppColors.black;
    bool isWaiting = booking.requestWaitingList?.isNotEmpty ?? false;
    final price = booking.service?.price != null
        ? Utils.formatPriceNew(booking.service?.price?.toDouble())
        : "-";
    return Container(
      padding: EdgeInsets.all(15.h),
      constraints: kComponentWidthConstraint,
      decoration: BoxDecoration(
        color: color,
        border: border,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isWaiting && !isCancelled) ...[
            WaitingForApproval(
              title: "IN_WAITING_LIST".tr(context).capitalizeFirst,
              backgroundColor: AppColors.darkYellow80,
              titleStyle: AppTextStyles.poppinsRegular(
                fontSize: 11.sp,
                color: AppColors.black,
              ),
            )
          ],
          if (isWaiting && !isCancelled) ...[
            10.verticalSpace,
          ],
          if (isCancelled) ...[
            ChangesCancelledListingCard(
              text: "OPEN_MATCH_CANCELLED".tr(context),
            ),
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

                      dynamic paid = await showDialog(
                        context: context,
                        builder: (context) {
                          return BookCourtDialog(
                            allowAddPlayer : false,
                            getPendingPayment: true,
                            allowPayLater: false,
                            showRefund: true,
                            coachId: null,
                            defaultOpenMatch: true,
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
                    height: 30.h,
                    isForPopup: true,
                    labelStyle: AppTextStyles.poppinsBold(
                        fontSize: 14.sp),
                    padding: EdgeInsets.zero,
                  )
                ],
              ),
            ),
          Row(
            children: [
              Text(
                "OPEN_MATCH".tr(context),
                style: AppTextStyles.poppinsBold(
                    color: textColor, fontSize: 15.sp,),
              ),
              const Spacer(),
              Text(
                (booking.service?.location?.locationName ?? ""),
                style: AppTextStyles.poppinsBold(
                    color: textColor,
                    fontSize: 13.sp,),
              ),
            ],
          ),
          SizedBox(height: 1.h),
          CDivider(
            color: isCancelled ? AppColors.gray : AppColors.black5,
          ),
          if (!isCancelled)
            PrivateRankedComponent(
                isPrivate: booking.isPrivateMatch ?? false,
                isRanked: !(booking.isFriendlyMatch ?? true)),
          if (!isCancelled) SizedBox(height: 5.h),
          OpenMatchParticipantRow(
            textForAvailableSlot: "RESERVE".trU(context),
            players: booking.players ?? [],
            textColor: textColor,
            imageBgColor: AppColors.black2,
            borderColor: AppColors.black,
            slotIconColor: AppColors.black,
            backGroundColor: AppColors.darkYellow80,
          ),
          if (!isCancelled) SizedBox(height: 15.h),
          Row(
            children: [
              Text(
                "${booking.courtName.capitalizeFirst}",
                style: AppTextStyles.poppinsRegular(
                  color: textColor,
                  fontSize: 13.sp,
                ),
              ),
              const Spacer(),
              Text(
                booking.formattedDateStartEndTimeAMH,
                style: AppTextStyles.poppinsRegular(
                  color: textColor,
                  fontSize: 13.sp,
                ),
              ),
            ],
          ),
          SizedBox(height: 5.h),
          Row(
            children: [
              Text(
                "${"PRICE".tr(context)} $price",
                style: AppTextStyles.poppinsRegular(
                  color: textColor,
                  fontSize: 13.sp,
                ),
              ),
              const Spacer(),
              Text(
                "${"LEVEL".tr(context)} ${booking.bookingLevel}",
                style: AppTextStyles.poppinsRegular(
                  color: textColor,
                  fontSize: 13.sp,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
