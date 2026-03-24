import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:padelrush/app_styles/app_colors.dart';
import 'package:padelrush/app_styles/app_text_styles.dart';
import 'package:padelrush/components/changes_cancelled_listing_card.dart';
import 'package:padelrush/globals/utils.dart';
import 'package:padelrush/models/user_bookings.dart';
import 'package:padelrush/utils/custom_extensions.dart';
import 'package:padelrush/models/court_booking.dart' as bookingModel;
import '../globals/constants.dart';
import '../repository/booking_repo.dart';
import '../repository/user_repo.dart';
import '../screens/home_screen/tabs/booking_tab/book_court_dialog/book_court_dialog.dart';
import 'main_button.dart';

class UserBookingCard extends ConsumerWidget {
  const UserBookingCard({super.key, required this.booking});

  final UserBookings booking;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isPlayerPendingPayment = booking.isPlayerPendingPayment(ref);
    bool isCancelled = booking.isCancelled ?? false;
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
          if (isCancelled || isPlayerPendingPayment)
            _buildStatusBanner(context, ref, isCancelled, isPlayerPendingPayment),

          // Dark header with date/time + location
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            decoration: BoxDecoration(
              color: AppColors.black2,
              borderRadius: (isCancelled || isPlayerPendingPayment)
                  ? BorderRadius.zero
                  : BorderRadius.only(
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
                    booking.formattedDateStartEndTimeAMH,
                    style: AppTextStyles.poppinsSemiBold(
                      fontSize: 13.sp,
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
          ),

          // Body: booking label
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
            child: Row(
              children: [
                Text(
                  "BOOKING".tr(context),
                  style: AppTextStyles.poppinsBold(
                    fontSize: 15.sp,
                    color: AppColors.black2,
                  ),
                ),
              ],
            ),
          ),

          // Footer: court + price
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
                  booking.courtName.capitalizeFirst,
                  style: AppTextStyles.poppinsMedium(
                    fontSize: 12.sp,
                    color: AppColors.black70,
                  ),
                ),
                const Spacer(),
                Text(
                  "${"PRICE".tr(context)} ${Utils.formatPrice(booking.pricePaid(ref))}",
                  style: AppTextStyles.poppinsMedium(
                    fontSize: 12.sp,
                    color: AppColors.black70,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusBanner(BuildContext context, WidgetRef ref,
      bool isCancelled, bool isPlayerPendingPayment) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: isCancelled ? AppColors.black10 : AppColors.darkYellow60,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.r),
          topRight: Radius.circular(16.r),
        ),
      ),
      child: Row(
        children: [
          if (isCancelled)
            Expanded(
              child: ChangesCancelledListingCard(
                text: "BOOKING_CANCELLED".tr(context),
              ),
            ),
          if (isPlayerPendingPayment && !isCancelled) ...[
            ChangesCancelledListingCard(
              color: AppColors.white,
              isUpperCase: false,
              iconColor: AppColors.black2,
              textColor: AppColors.black2,
              padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 15.w),
              style: AppTextStyles.poppinsSemiBold(
                  fontSize: 13.sp, color: AppColors.black2),
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

    dynamic paid = await showDialog(
      context: context,
      builder: (context) {
        return BookCourtDialog(
          allowPayLater: false,
          getPendingPayment: true,
          showRefund: true,
          payRemainingBooking: true,
          payRemainingOpenMatch: false,
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
