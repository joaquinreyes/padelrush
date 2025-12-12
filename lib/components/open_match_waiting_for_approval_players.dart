import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hop/app_styles/app_colors.dart';
import 'package:hop/app_styles/app_text_styles.dart';
import 'package:hop/components/c_divider.dart';
import 'package:hop/components/main_button.dart';
import 'package:hop/components/network_circle_image.dart';
import 'package:hop/globals/constants.dart';
import 'package:hop/models/service_waiting_players.dart';
import 'package:hop/utils/custom_extensions.dart';

class OpenMatchWaitingForApprovalPlayers extends ConsumerStatefulWidget {
  const OpenMatchWaitingForApprovalPlayers({
    super.key,
    required this.data,
    required this.onApprove,
    this.isForSocketPopup = false,
  });

  final List<ServiceWaitingPlayers> data;
  final Function(int) onApprove;
  final bool isForSocketPopup;

  @override
  ConsumerState<OpenMatchWaitingForApprovalPlayers> createState() =>
      _OpenMatchWaitingForApprovalPlayersState();
}

class _OpenMatchWaitingForApprovalPlayersState
    extends ConsumerState<OpenMatchWaitingForApprovalPlayers> {
  @override
  Widget build(BuildContext context) {
    final Color textColor =
        widget.isForSocketPopup ? AppColors.black : AppColors.black;
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "PLAYERS_WAITING_FOR_YOUR_APPROVAL"
                  .tr(context)
                  .capitalWord(context, !widget.isForSocketPopup),
              style: AppTextStyles.qanelasMedium(
                  fontSize: 17.sp, color: textColor),
            ),
            SizedBox(height: 10.h),
            Container(
              decoration: BoxDecoration(
                color: widget.isForSocketPopup
                    ? AppColors.black25
                    : AppColors.tileBgColor,
                border: border,
                borderRadius: BorderRadius.circular(12.r),
              ),
              padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 15.h),
              child: Column(
                children: [
                  for (int i = 0; i < widget.data.length; i++) ...[
                    Builder(builder: (context) {
                      final player = widget.data[i];
                      return Row(
                        children: [
                          NetworkCircleImage(
                            borderRadius: BorderRadius.circular(4.r),
                            path: player.customer?.profileUrl,
                            width: 37.h,
                            height: 37.h,
                            boxBorder: Border.all(
                              color: AppColors.white25,
                            ),
                            bgColor: AppColors.white,
                          ),
                          SizedBox(width: 15.w),
                          Column(
                            children: [
                              Text(
                                player.getCustomerName.toUpperCase(),
                                style: AppTextStyles.qanelasMedium(
                                    color: textColor, fontSize: 12.sp),
                              ),
                              Text(
                                  "${player.customer?.level(getSportsName(ref))}",
                                  style: AppTextStyles.qanelasRegular(
                                    color: textColor,
                                    fontSize: 12.sp,
                                  )
                                  ),
                              if (player.isOpenMatchWaitingApproval)
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 6,vertical: 3),
                                  decoration: BoxDecoration(
                                      color: AppColors.darkYellow50,
                                      borderRadius:
                                          BorderRadius.circular(12.r)),
                                  child: Text("UNPAID".trU(context),
                                      style: AppTextStyles.qanelasMedium(
                                        color: textColor,
                                        fontSize: 10.sp,
                                      )),
                                )
                            ],
                          ),
                          const Spacer(),
                          player.isApproved || player.isAccepted
                              ? SizedBox(
                                  width: 100.w,
                                  child: Text(
                                    "WAITING_FOR_PLAYER_TO_JOIN".tr(context),
                                    style: AppTextStyles.qanelasLight(
                                        fontSize: 14.sp, color: textColor),
                                    textAlign: TextAlign.center,
                                  ),
                                )
                              : player.isOpenMatchWaitingApproval
                                  ? SizedBox(
                                      width: 100.w,
                                      child: Text(
                                        "WAITING_FOR_PLAYER_TO_PAY".tr(context),
                                        style: AppTextStyles.qanelasLight(
                                            fontSize: 14.sp, color: textColor),
                                        textAlign: TextAlign.center,
                                      ),
                                    )
                                  : MainButton(
                                      label: "APPROVE".tr(context),
                                      color:
                                          // widget.isForSocketPopup ?
                                          AppColors.darkYellow,
                                      // : AppColors.black2,
                                      padding: EdgeInsets.only(
                                          left: 15.w,
                                          right: 15.w,
                                          top: 6.h,
                                          bottom: 6.h),
                                      labelStyle: AppTextStyles.qanelasMedium(
                                        fontSize: 13.sp,
                                      ),
                                      borderRadius: 100.r,
                                      applySize: false,
                                      applyShadow: true,
                                      isForPopup: widget.isForSocketPopup,
                                      onTap: () {
                                        widget.onApprove(player.id!);
                                      },
                                    )
                        ],
                      );
                    }),
                    if (i < widget.data.length - 1) ...[
                      SizedBox(height: 5.h),
                      CDivider(),
                      SizedBox(height: 5.h),
                    ]
                  ]
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
