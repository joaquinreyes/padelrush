import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:padelrush/app_styles/app_colors.dart';
import 'package:padelrush/app_styles/app_text_styles.dart';
import 'package:padelrush/components/changes_cancelled_listing_card.dart';
import 'package:padelrush/components/custom_dialog.dart';
import 'package:padelrush/components/open_match_participant_row.dart';
import 'package:padelrush/globals/constants.dart';
import 'package:padelrush/globals/utils.dart';
import 'package:padelrush/managers/user_manager.dart';
import 'package:padelrush/models/user_bookings.dart';
import 'package:padelrush/repository/play_repo.dart';
import 'package:padelrush/utils/custom_extensions.dart';
import 'package:padelrush/models/court_booking.dart' as bookingModel;
import 'package:padelrush/routes/app_pages.dart';
import 'package:padelrush/routes/app_routes.dart';
import '../repository/booking_repo.dart';
import '../repository/user_repo.dart';
import '../screens/home_screen/tabs/booking_tab/book_court_dialog/book_court_dialog.dart';
import 'main_button.dart';
import 'secondary_button.dart';

class UserOpenMatchCard extends ConsumerWidget {
  const UserOpenMatchCard({super.key, required this.booking});

  final UserBookings booking;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isPlayerPendingPayment = booking.isPlayerPendingPayment(ref);
    final isCancelled = booking.isCancelled ?? false;
    final isPrivate = booking.isPrivateMatch ?? false;
    final isRanked = !(booking.isFriendlyMatch ?? true);
    final level = booking.bookingLevel;
    final price = booking.service?.price != null
        ? Utils.formatPriceNew(booking.service?.price?.toDouble())
        : "-";

    // Check if current user is invited (in waiting list)
    final currentUserId = ref.read(userManagerProvider).user?.user?.id;
    final myWaitingEntry = booking.requestWaitingList?.firstWhere(
      (e) => e.id == currentUserId,
      orElse: () => RequestWaitingList(id: null, status: null),
    );
    final isInvited = myWaitingEntry?.id != null;
    final waitingStatus = myWaitingEntry?.status?.toLowerCase() ?? "";
    final isWaitingApproval = waitingStatus == "open_match_waiting_approval" || waitingStatus == "waiting";

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
          // Invited banner with Accept/Reject
          if (isInvited && isWaitingApproval && !isCancelled)
            _buildInvitedBanner(context, ref, myWaitingEntry!)
          // Unpaid banner
          else if (isPlayerPendingPayment && !isCancelled)
            _buildUnpaidBanner(context, ref)
          // Cancelled banner
          else if (isCancelled)
            _buildCancelledBanner(context),

          // Header with date/time and location
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            decoration: BoxDecoration(
              color: AppColors.black2,
              borderRadius: _hasTopBanner(isInvited, isWaitingApproval, isCancelled, isPlayerPendingPayment)
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

          // Match type + players
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      isPrivate
                          ? "PRIVATE_MATCH".tr(context)
                          : "OPEN_MATCH".tr(context),
                      style: AppTextStyles.poppinsBold(
                        fontSize: 15.sp,
                        color: AppColors.black2,
                      ),
                    ),
                    const Spacer(),
                    if (!isCancelled) ...[
                      if (isPrivate)
                        _tag("PRIVATE".tr(context), AppColors.black2, AppColors.white),
                      if (isPrivate) SizedBox(width: 6.w),
                      if (isRanked)
                        _tag("RANKED".tr(context), AppColors.darkYellow, AppColors.black2),
                    ],
                  ],
                ),
                SizedBox(height: 12.h),
                OpenMatchParticipantRow(
                  textForAvailableSlot: "RESERVE".trU(context),
                  players: booking.players ?? [],
                  imageBgColor: AppColors.black2,
                  borderColor: AppColors.black25,
                  slotIconColor: AppColors.black70,
                  backGroundColor: AppColors.lightGray,
                ),
              ],
            ),
          ),

          // Footer with court, price, and level
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
                  "${"PRICE".tr(context)} $price",
                  style: AppTextStyles.poppinsMedium(
                    fontSize: 12.sp,
                    color: AppColors.black70,
                  ),
                ),
                if (level.isNotEmpty) ...[
                  SizedBox(width: 8.w),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
                    decoration: BoxDecoration(
                      color: AppColors.darkYellow30,
                      borderRadius: BorderRadius.circular(100.r),
                    ),
                    child: Text(
                      "${"LEVEL".tr(context)} $level",
                      style: AppTextStyles.poppinsSemiBold(
                        fontSize: 11.sp,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  bool _hasTopBanner(bool isInvited, bool isWaitingApproval, bool isCancelled, bool isPlayerPendingPayment) {
    return (isInvited && isWaitingApproval && !isCancelled) ||
        (isPlayerPendingPayment && !isCancelled) ||
        isCancelled;
  }

  Widget _tag(String text, Color bgColor, Color textColor) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(100.r),
      ),
      child: Text(
        text,
        style: AppTextStyles.poppinsSemiBold(
          fontSize: 11.sp,
          color: textColor,
        ),
      ),
    );
  }

  Widget _buildInvitedBanner(BuildContext context, WidgetRef ref, RequestWaitingList entry) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: AppColors.darkYellow,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.r),
          topRight: Radius.circular(16.r),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(Icons.mail_outline_rounded, size: 18.sp, color: AppColors.black2),
              SizedBox(width: 8.w),
              Text(
                "YOUVE_BEEN_INVITED".tr(context),
                style: AppTextStyles.poppinsBold(
                  fontSize: 14.sp,
                  color: AppColors.black2,
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Row(
            children: [
              Expanded(
                child: SecondaryButton(
                  color: AppColors.white,
                  borderRadius: 100,
                  padding: EdgeInsets.symmetric(vertical: 8.h),
                  onTap: () => _showConfirmationDialog(context, ref, "reject"),
                  child: Center(
                    child: Text(
                      "REJECT".tr(context),
                      style: AppTextStyles.poppinsSemiBold(
                        fontSize: 13.sp,
                        color: AppColors.black2,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: MainButton(
                  label: "ACCEPT_NOW".tr(context),
                  color: AppColors.black2,
                  labelStyle: AppTextStyles.poppinsSemiBold(
                    fontSize: 13.sp,
                    color: AppColors.white,
                  ),
                  applySize: false,
                  applyShadow: false,
                  borderRadius: 100.r,
                  padding: EdgeInsets.symmetric(vertical: 8.h),
                  onTap: () => _showConfirmationDialog(context, ref, "accept"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _showConfirmationDialog(BuildContext context, WidgetRef ref, String action) async {
    final isAccept = action == "accept";

    final bool? confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => CustomDialog(
        color: AppColors.white,
        closeIconColor: AppColors.black2,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              isAccept
                  ? "ARE_YOU_SURE_YOU_WANT_TO_ACCEPT_THE_OPEN_MATCH".trU(context)
                  : "ARE_YOU_SURE_YOU_WANT_TO_REJECT_THE_OPEN_MATCH".trU(context),
              textAlign: TextAlign.center,
              style: AppTextStyles.poppinsMedium(
                fontSize: 19.sp,
                color: AppColors.black2,
              ),
            ),
            SizedBox(height: 20.h),
            MainButton(
              label: isAccept ? "ACCEPT".trU(context) : "REJECT".trU(context),
              color: isAccept ? AppColors.darkYellow : AppColors.darkRosewood,
              labelStyle: AppTextStyles.poppinsMedium(
                fontSize: 18.sp,
                color: isAccept ? AppColors.black2 : AppColors.white,
              ),
              isForPopup: true,
              onTap: () {
                Navigator.pop(dialogContext, true);
              },
            ),
          ],
        ),
      ),
    );

    if (confirmed == true) {
      _handleWaitingListAction(context, ref, action);
    }
  }

  Future<void> _handleWaitingListAction(BuildContext context, WidgetRef ref, String action) async {
    try {
      final provider = waitingListActionProviderProvider(
        waitingListId: booking.id ?? 0,
        action: action,
      );
      final success = await Utils.showLoadingDialog(context, provider, ref);

      if (success == true) {
        ref.invalidate(fetchUserAllBookingsProvider);
        if (action == "accept" && context.mounted) {
          // Navigate to the match detail screen so the user can pay
          ref.read(goRouterProvider).push(
            "${RouteNames.match_info}/${booking.id}",
          );
        }
      }
    } catch (e) {
      if (context.mounted) {
        Utils.showMessageDialog(context, e.toString());
      }
    }
  }

  Widget _buildUnpaidBanner(BuildContext context, WidgetRef ref) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: AppColors.darkYellow60,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.r),
          topRight: Radius.circular(16.r),
        ),
      ),
      child: Row(
        children: [
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
      ),
    );
  }

  Widget _buildCancelledBanner(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: AppColors.black10,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.r),
          topRight: Radius.circular(16.r),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: ChangesCancelledListingCard(
              text: "OPEN_MATCH_CANCELLED".tr(context),
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

    dynamic paid = await showDialog(
      context: context,
      builder: (context) {
        return BookCourtDialog(
          allowAddPlayer: false,
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
              locationName: booking.service!.location!.locationName,
            ),
          ),
          bookingTime: booking.bookingStartTime,
          court: {
            (booking.courts ?? []).first.id ?? 0:
                (booking.courts ?? []).first.courtName ?? ""
          },
        );
      },
    );

    if (paid is bool && paid) {
      Utils.showMessageDialog(context, "YOU_HAVE_PAID_SUCCESSFULLY".tr(context));
      ref.invalidate(fetchUserAllBookingsProvider);
      ref.invalidate(walletInfoProvider);
    }
  }
}
