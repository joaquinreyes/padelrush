import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../app_styles/app_colors.dart';
import '../../../../../../app_styles/app_text_styles.dart';
import '../../../../../../components/custom_dialog.dart';
import '../../../../../../components/main_button.dart';
import '../../../../../../globals/constants.dart';
import '../../../../../../globals/utils.dart';
import '../../../../../../models/voucher_model.dart';
import '../../../../../../utils/custom_extensions.dart';

class VoucherCarousel extends StatefulWidget {
  final List<VoucherModel> vouchers;
  final void Function(VoucherModel) onTapVoucher;

  const VoucherCarousel({
    super.key,
    required this.vouchers,
    required this.onTapVoucher,
  });

  @override
  State<VoucherCarousel> createState() => _VoucherCarouselState();
}

class _VoucherCarouselState extends State<VoucherCarousel> {
  late final PageController _controller;
  int _page = 0;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _go(int delta) {
    final next = (_page + delta).clamp(0, widget.vouchers.length - 1);
    _controller.animateToPage(
      next,
      duration: const Duration(milliseconds: 320),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final count = widget.vouchers.length;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 200.h,
          child: Stack(
            children: [
              PageView.builder(
                controller: _controller,
                itemCount: count,
                onPageChanged: (i) => setState(() => _page = i),
                itemBuilder: (context, i) {
                  return _VoucherHeroCard(
                    voucher: widget.vouchers[i],
                    onTap: () => widget.onTapVoucher(widget.vouchers[i]),
                  );
                },
              ),
              if (count > 1)
                Positioned(
                  right: 16.w,
                  bottom: 18.h,
                  child: Row(
                    children: [
                      _ArrowButton(
                        icon: Icons.chevron_left_rounded,
                        enabled: _page > 0,
                        onTap: () => _go(-1),
                      ),
                      SizedBox(width: 8.w),
                      _ArrowButton(
                        icon: Icons.chevron_right_rounded,
                        enabled: _page < count - 1,
                        onTap: () => _go(1),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
        if (count > 1) ...[
          SizedBox(height: 10.h),
          Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(count, (i) {
                final active = i == _page;
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 220),
                  margin: EdgeInsets.symmetric(horizontal: 3.w),
                  width: active ? 18.w : 6.w,
                  height: 6.h,
                  decoration: BoxDecoration(
                    color: active
                        ? AppColors.darkYellow
                        : AppColors.darkYellow.withOpacity(0.25),
                    borderRadius: BorderRadius.circular(3.r),
                  ),
                );
              }),
            ),
          ),
        ],
      ],
    );
  }
}

class _ArrowButton extends StatelessWidget {
  final IconData icon;
  final bool enabled;
  final VoidCallback onTap;

  const _ArrowButton({
    required this.icon,
    required this.enabled,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: enabled ? onTap : null,
      child: Opacity(
        opacity: enabled ? 1 : 0.35,
        child: Container(
          width: 36.w,
          height: 36.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.white.withOpacity(0.18),
            border: Border.all(
              color: AppColors.white.withOpacity(0.3),
              width: 0.8,
            ),
          ),
          child: Icon(
            icon,
            color: AppColors.white,
            size: 20.sp,
          ),
        ),
      ),
    );
  }
}

class _VoucherHeroCard extends StatelessWidget {
  final VoucherModel voucher;
  final VoidCallback onTap;

  const _VoucherHeroCard({required this.voucher, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final credits = voucher.value ?? 0;
    final price = voucher.price ?? 0;
    final savings = credits - price;
    final hasBonus = savings > 0;

    final priceStr = price.toStringAsFixed(0);
    final creditsStr = credits.toStringAsFixed(0);
    final savingsStr = savings.toStringAsFixed(0);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            boxShadow: [
              BoxShadow(
                color: AppColors.black.withOpacity(0.3),
                blurRadius: 16,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.r),
            child: Stack(
              fit: StackFit.expand,
              children: [
                // Dark canvas
                Container(color: const Color(0xFF071410)),
                // Deep green gradient
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      colors: [
                        const Color(0xFF071410),
                        AppColors.darkGreen.withOpacity(0.9),
                      ],
                    ),
                  ),
                ),
                // Yellow glow top-right
                Positioned(
                  right: -100.w,
                  top: -50.h,
                  child: Container(
                    width: 340.w,
                    height: 340.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: RadialGradient(
                        colors: [
                          AppColors.darkYellow.withOpacity(0.65),
                          AppColors.darkYellow.withOpacity(0.12),
                          AppColors.darkYellow.withOpacity(0.0),
                        ],
                        stops: const [0.0, 0.45, 1.0],
                      ),
                    ),
                  ),
                ),
                // Highlight streak
                Positioned(
                  right: -30.w,
                  top: 38.h,
                  child: Transform.rotate(
                    angle: -0.18,
                    child: Container(
                      width: 300.w,
                      height: 36.h,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            AppColors.darkYellow.withOpacity(0.0),
                            AppColors.darkYellow.withOpacity(0.45),
                            AppColors.darkYellow.withOpacity(0.0),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(36.r),
                      ),
                    ),
                  ),
                ),
                // Vignette left
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        AppColors.black.withOpacity(0.5),
                        AppColors.black.withOpacity(0.0),
                      ],
                      stops: const [0.0, 0.65],
                    ),
                  ),
                ),
                // Content
                Padding(
                  padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 20.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if ((voucher.voucherName ?? '').isNotEmpty)
                        Text(
                          (voucher.voucherName ?? '').toUpperCase(),
                          style: AppTextStyles.poppinsBold(
                            fontSize: 9.sp,
                            color: AppColors.white.withOpacity(0.65),
                          ).copyWith(letterSpacing: 1.4),
                        ),
                      const Spacer(),
                      Text(
                        hasBonus
                            ? "$currency$savingsStr bonus credit on us"
                            : "Top up your wallet",
                        style: AppTextStyles.poppinsRegular(
                          fontSize: 12.sp,
                          color: AppColors.white.withOpacity(0.85),
                        ),
                      ),
                      SizedBox(height: 6.h),
                      Padding(
                        padding: EdgeInsets.only(right: 100.w),
                        child: Text(
                          hasBonus
                              ? "Buy $currency$priceStr, Get $currency$creditsStr Credit"
                              : "Buy $currency$creditsStr Credit",
                          style: AppTextStyles.poppinsBold(
                            fontSize: 20.sp,
                            color: AppColors.white,
                          ).copyWith(height: 1.25),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class VoucherConfirmDialog extends StatelessWidget {
  final VoucherModel voucher;

  const VoucherConfirmDialog({super.key, required this.voucher});

  @override
  Widget build(BuildContext context) {
    final credits = voucher.value ?? 0;
    final price = voucher.price ?? 0;
    final savings = credits - price;
    final hasBonus = savings > 0;
    final bonusPercent =
        price > 0 ? ((savings / price) * 100).round() : 0;

    return CustomDialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "VOUCHER_INFORMATION".trU(context),
            style: AppTextStyles.poppinsBold(
              fontSize: 20.sp,
              color: AppColors.black2,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8.h),
          Text(
            "VOUCHER_DESCRIPTION".tr(context),
            style: AppTextStyles.poppinsRegular(
              fontSize: 13.sp,
              color: AppColors.black2.withOpacity(0.6),
            ).copyWith(height: 1.5),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 18.h),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: AppColors.lightGray,
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(
                color: AppColors.darkYellow,
                width: 1.5,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if ((voucher.voucherName ?? '').isNotEmpty) ...[
                  Text(
                    (voucher.voucherName ?? '').toUpperCase(),
                    style: AppTextStyles.poppinsSemiBold(
                      fontSize: 11.sp,
                      color: AppColors.darkGray,
                    ).copyWith(letterSpacing: 0.6),
                  ),
                  SizedBox(height: 6.h),
                ],
                Text(
                  hasBonus
                      ? "Buy $currency${price.toStringAsFixed(0)}, Get $currency${credits.toStringAsFixed(0)}"
                      : "Buy $currency${credits.toStringAsFixed(0)} Credit",
                  style: AppTextStyles.poppinsBold(
                    fontSize: 20.sp,
                    color: AppColors.black2,
                  ).copyWith(height: 1.25),
                ),
                if (hasBonus) ...[
                  SizedBox(height: 8.h),
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: 8.w, vertical: 3.h),
                    decoration: BoxDecoration(
                      color: AppColors.darkYellow,
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                    child: Text(
                      "+$bonusPercent% BONUS  •  $currency${savings.toStringAsFixed(0)} extra",
                      style: AppTextStyles.poppinsBold(
                        fontSize: 10.sp,
                        color: AppColors.black2,
                      ).copyWith(letterSpacing: 0.3),
                    ),
                  ),
                ],
                SizedBox(height: 14.h),
                Divider(color: AppColors.black2.withOpacity(0.1), height: 1),
                SizedBox(height: 12.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "You pay",
                      style: AppTextStyles.poppinsRegular(
                        fontSize: 13.sp,
                        color: AppColors.black2.withOpacity(0.65),
                      ),
                    ),
                    Text(
                      Utils.formatPrice(voucher.price),
                      style: AppTextStyles.poppinsBold(
                        fontSize: 18.sp,
                        color: AppColors.black2,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 20.h),
          SizedBox(
            width: double.infinity,
            child: MainButton(
              isForPopup: true,
              onTap: () async {
                final credits = voucher.value ?? 0;
                final price = voucher.price ?? 0;
                final savings = credits - price;
                final hasBonus = savings > 0;
                final name = (voucher.voucherName ?? '').isNotEmpty
                    ? voucher.voucherName!
                    : null;

                final msg = StringBuffer();
                msg.write("Hi, I'd like to purchase a credit voucher.");
                if (name != null) msg.write("\n*Voucher:* $name");
                if (hasBonus) {
                  msg.write(
                      "\n*Offer:* Buy $currency${price.toStringAsFixed(0)}, Get $currency${credits.toStringAsFixed(0)} Credit");
                  msg.write(
                      "\n*Bonus:* $currency${savings.toStringAsFixed(0)} extra");
                } else {
                  msg.write(
                      "\n*Amount:* $currency${credits.toStringAsFixed(0)} Credit");
                }
                msg.write("\n*You Pay:* $currency${price.toStringAsFixed(0)}");
                msg.write("\n\nPlease assist me with the payment. 🙏");

                await Utils.openWhatsappSupport(
                  context: context,
                  message: msg.toString(),
                );
              },
              label: "PAY_VOUCHER".trU(context),
            ),
          ),
        ],
      ),
    );
  }
}
