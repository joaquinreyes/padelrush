import 'dart:developer';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:padelrush/components/custom_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:padelrush/app_styles/app_colors.dart';
import 'package:padelrush/app_styles/app_text_styles.dart';
import 'package:padelrush/components/main_button.dart';
import 'package:padelrush/components/secondary_text.dart';
import 'package:padelrush/components/secondary_textfield.dart';
import 'package:padelrush/globals/images.dart';
import 'package:padelrush/globals/utils.dart';
import 'package:padelrush/models/coupon_model.dart';
import 'package:padelrush/models/payment_methods.dart';
import 'package:padelrush/repository/payment_repo.dart';
import 'package:padelrush/utils/custom_extensions.dart';

import '../../globals/constants.dart';
import '../../models/court_price_model.dart';
import '../../repository/booking_repo.dart';
import '../../routes/app_pages.dart';
import '../home_screen/tabs/booking_tab/book_court_dialog/book_court_dialog.dart';
import 'package:flutter_riverpod/legacy.dart';

part 'payment_components.dart';

final _selectedPaymentMethod = StateProvider<AppPaymentMethods?>((ref) => null);
final _selectedRedeem = StateProvider<AppPaymentMethods?>((ref) => null);
final _selectedWalelt = StateProvider<Wallets?>((ref) => null);
final _appliedCoupon = StateProvider<CouponModel?>((ref) => null);
final _invalidCoupon = StateProvider<bool>((ref) => false);
final _amountPayable = StateProvider<double>((ref) => 0.0);
final _selectedMDR = StateProvider<MDRRates?>((ref) => null);


class PaymentInformation extends ConsumerStatefulWidget {
  const PaymentInformation(
      {super.key,
      required this.locationID,
      required this.price,
      required this.type,
      required this.requestType,
      required this.serviceID,
      required this.startDate,
      required this.duration,
      this.isJoiningApproval = false,
      this.courtPriceModel,
      this.courtId,
      this.variantId,
      this.allowCoupon = true,
      this.bookingToOpenMatch = false,
      this.allowMembership = true,
      this.allowWallet = true,
      this.purchaseMembership = false,
      this.isMultiBooking = false,
      this.getPendingPayment = false,
      this.isOpenMatch = false,
      this.isPrivateMatch = false,
      this.allowPayLater = true,
      this.title});

  final CourtPriceModel? courtPriceModel;

  final bool isMultiBooking;
  final int locationID;
  final double price;
  final int? serviceID;
  final PaymentProcessRequestType requestType;
  final bool isJoiningApproval;
  final PaymentDetailsRequestType type;
  final bool allowCoupon;
  final bool bookingToOpenMatch;
  final String? title;
  final DateTime? startDate;
  final int? duration;
  final int? courtId;
  final int? variantId;
  final bool allowMembership;
  final bool allowWallet;
  final bool purchaseMembership;
  final bool allowPayLater;
  final bool isOpenMatch;
  final bool isPrivateMatch;
  final bool getPendingPayment;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => __PaymentInformationState();
}

class __PaymentInformationState extends ConsumerState<PaymentInformation> {
  @override
  void initState() {
    Future(() {
      ref.read(_selectedPaymentMethod.notifier).state = null;
      ref.read(_selectedRedeem.notifier).state = null;
      ref.read(_selectedWalelt.notifier).state = null;
      ref.read(_appliedCoupon.notifier).state = null;
      ref.read(_invalidCoupon.notifier).state = false;
      ref.read(_amountPayable.notifier).state = widget.price;
      ref.read(_selectedMDR.notifier).state = null;
      ref.read(totalMultiBookingAmount.notifier).state = calculateAmountPayable(ref, widget.price);
    });
    super.initState();
  }

  final TextEditingController _couponController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final paymentDetails =
        ref.watch(fetchAllPaymentMethodsProvider(widget.locationID, widget.serviceID ?? 0, widget.type, widget.startDate, widget.duration,courtId: widget.courtId,variantId: widget.variantId,isOpenMatch: widget.isOpenMatch,isPrivateMatch: widget.isPrivateMatch));
    final appliedCoupon = ref.watch(_appliedCoupon);
    final cancellationHour = widget.courtPriceModel?.cancellationPolicy?.cancellationTimeInHours;
    return CustomDialog(
      maxHeight: MediaQuery.of(context).size.height * 0.85,
      onTapCloseIcon: () async {
        final confirmationDialog = true;

        if (confirmationDialog == true) {
          if (widget.isMultiBooking) {
            ref.invalidate(fetchBookingCartListProvider);
          }
          Navigator.pop(context);
        }
      },
      child: Flexible(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 4.h),
            Text(
              "PAYMENT_INFORMATION".trU(context),
              style: AppTextStyles.poppinsBold(fontSize: 20.sp),
            ),
            SizedBox(height: 6.h),
            if (cancellationHour != null)
              Text(
                cancellationHour == 0
                    ? "YOU_WILL_NOT_GET_REFUND_ON_THIS_BOOKING".tr(context)
                    : "CANCELLATION_POLICY_HOURS".tr(context, params: {"HOUR": cancellationHour.toString()}),
                style: AppTextStyles.poppinsRegular(fontSize: 12.sp, color: AppColors.black70),
                textAlign: TextAlign.center,
              )
            else
              Text(
                "PAYMENT_INFORMATION_TEXT".tr(context),
                style: AppTextStyles.poppinsRegular(fontSize: 12.sp, color: AppColors.black70),
                textAlign: TextAlign.center,
              ),
            SizedBox(height: 16.h),
            _AmountPayable(
              originalAmount: widget.price,
            ),
            if (widget.allowCoupon)
              Padding(
                padding: EdgeInsets.only(top: 12.h),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.lightGray,
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(color: AppColors.gray, width: 1),
                  ),
                  child: SecondaryTextField(
                    hintText: "${"ENTER_COUPON_HERE".tr(context)} (${"OPTIONAL".tr(context).toLowerCase()})",
                    controller: _couponController,
                    contentPadding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
                    onChanged: (value) {
                      setState(() {});
                      ref.read(_appliedCoupon.notifier).state = null;
                      ref.read(_invalidCoupon.notifier).state = false;
                      ref.read(totalMultiBookingAmount.notifier).state = calculateAmountPayable(ref, widget.price);
                    },
                    hintTextStyle: AppTextStyles.poppinsRegular(
                        color: AppColors.black25, fontSize: 13.sp),
                    style: AppTextStyles.poppinsRegular()
                        .copyWith(color: AppColors.black2, fontSize: 13.sp),
                    suffixIcon: Padding(
                      padding: EdgeInsets.only(right: 6.w),
                      child: appliedCoupon == null || _couponController.text != appliedCoupon.coupon
                          ? _CouponApplyButton(
                              price: widget.price,
                              couponController: _couponController,
                            )
                          : Image.asset(
                              AppImages.checkMark.path,
                              width: 18.h,
                              height: 18.h,
                              color: AppColors.darkYellow,
                            ),
                    ),
                  ),
                ),
              ),
            SizedBox(height: 20.h),
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "${"SELECT_PAYMENT_METHOD".tr(context)}",
                  style: AppTextStyles.poppinsSemiBold(fontSize: 14.sp),
                  textAlign: TextAlign.start,
                )),
            SizedBox(height: 10.h),
            paymentDetails.when(
              skipLoadingOnRefresh: false,
              data: (data) {
                return Flexible(child: _body(data));
              },
              error: (error, stackTrace) {
                myPrint("Error: $error");
                myPrint("Stack Trace: $stackTrace");
                return SecondaryText(
                  text: error.toString(),
                  color: AppColors.white,
                );
              },
              loading: () => Center(
                child: CupertinoActivityIndicator(color: AppColors.black25),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column _body(
    PaymentDetails data,
  ) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: _PaymentMethods(
            allowPayLater: widget.allowPayLater,
            isOpenMatch: widget.isOpenMatch,
            courtId: widget.courtId,
            variantId: widget.variantId,
            bookingToOpenMatch: widget.bookingToOpenMatch,
            isMultiBooking: widget.isMultiBooking,
            paymentDetails: data,
            price: widget.price,
            locationID: widget.locationID,
            serviceID: widget.serviceID,
            requestType: widget.type,
            allowMembership: widget.allowMembership,
            allowWallet: widget.allowWallet,
            duration: widget.duration,
            startDate: widget.startDate,
          ),
        ),
        SizedBox(height: 16.h),
        _PaymentButton(
          title: widget.title,
          // boldPosition: widget.boldPosition,
          getPendingPayment: widget.getPendingPayment,
          bookingToOpenMatch: widget.bookingToOpenMatch,
          isMultiBooking: widget.isMultiBooking,
          price: widget.price,
          requestType: widget.requestType,
          serviceID: widget.serviceID,
          locationID: widget.locationID,
          purchaseMembership: widget.purchaseMembership,
          isJoiningApproval: widget.isJoiningApproval,
        )
      ],
    );
  }


// double _calculateAmountPayable() {
//   final coupon = ref.watch(_appliedCoupon);
//   final redeem = ref.watch(_selectedRedeem);
//   double? payableAmount = widget.price;
//   if (coupon != null) {
//     payableAmount -= coupon.discount ?? 0;
//   }
//   if (redeem != null) {
//     payableAmount -= redeem.walletBallance ?? 0;
//   }
//   return payableAmount;
// }
}

double calculateAmountPayable(WidgetRef ref, double price) {
  final coupon = ref.watch(_appliedCoupon);
  final redeem = ref.watch(_selectedRedeem);
  double payableAmount = price;
  if (coupon != null) {
    payableAmount -= coupon.discount ?? 0;
  }
  if (redeem != null) {
    payableAmount -= redeem.walletBalance ?? 0;
  }
  return payableAmount;
}
