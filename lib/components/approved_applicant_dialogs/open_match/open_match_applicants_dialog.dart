import 'package:padelrush/components/custom_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:padelrush/app_styles/app_colors.dart';
import 'package:padelrush/app_styles/app_text_styles.dart';

import 'package:padelrush/components/c_divider.dart';
import 'package:padelrush/components/open_match_participant_row.dart';
import 'package:padelrush/components/open_match_waiting_for_approval_players.dart';
import 'package:padelrush/globals/utils.dart';
import 'package:padelrush/models/applicat_socket_response.dart';
import 'package:padelrush/models/base_classes/booking_player_base.dart';
import 'package:padelrush/models/service_detail_model.dart';
import 'package:padelrush/repository/play_repo.dart';
import 'package:padelrush/screens/open_match_detail/open_match_detail.dart';
import 'package:padelrush/utils/custom_extensions.dart';
part 'components.dart';

class OpenMatchApplicantDialog extends ConsumerStatefulWidget {
  const OpenMatchApplicantDialog({
    super.key,
    required this.data,
  });
  final ApplicantSocketResponse data;

  @override
  ConsumerState<OpenMatchApplicantDialog> createState() =>
      _ApplicantDialogState();
}

class _ApplicantDialogState extends ConsumerState<OpenMatchApplicantDialog> {
  @override
  void initState() {
    if (widget.data.waitingList == null || widget.data.waitingList!.isEmpty) {
      return;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "PLAYERS_WAITING_TO_ENTER_YOUR_MATCH".trU(context),
            textAlign: TextAlign.center,
            style: AppTextStyles.popupHeaderTextStyle,
          ),
          SizedBox(height: 20.h),
          ApplicantOpenMatchInfoCard(
            service: widget.data.serviceBooking!,
          ),
          SizedBox(height: 20.h),
          // Neue Power/Medium/Aeonik Regular 16
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "CURRENT_PLAYERS".tr(context),
              style: AppTextStyles.poppinsLight(fontSize: 16.sp),
            ),
          ),
          SizedBox(height: 5.h),
          OpenMatchParticipantRowWithBG(
            textForAvailableSlot: "AVAILABLE".trU(context),
            players: widget.data.serviceBooking?.players ?? [],
            showReserveReleaseButton: false,
            backgroundColor: AppColors.black25,
            imageBgColor: AppColors.white,
            imageLogoColor: AppColors.black2,
            slotBackgroundColor: AppColors.black2,
            textColor: AppColors.black,
          ),
          SizedBox(height: 15.h),
          OpenMatchWaitingForApprovalPlayers(
            data: widget.data.waitingList ?? [],
            onApprove: _approve,
            isForSocketPopup: true,
          )
        ],
      ),
    );
  }

  _approve(int id) async {
    bool? approve = await showDialog(
      context: context,
      builder: (context) {
        return const ConfirmationDialog(
          type: ConfirmationDialogType.approveConfirm,
        );
      },
    );
    if (approve != null && approve && mounted) {
      final provider = approvePlayerProvider(
          serviceID: widget.data.serviceBooking!.id!, playerID: id);
      final bool? success =
          await Utils.showLoadingDialog(context, provider, ref);
      if (!mounted || success == null || !success) {
        return;
      }
      setState(() {
        int index = widget.data.waitingList
                ?.indexWhere((element) => element.id == id) ??
            -1;
        if (index != -1) {
          final waitingPlayer = widget.data.waitingList![index];
          widget.data.serviceBooking!.players!.add(ServiceDetail_Players(
            id: waitingPlayer.id,
            customer:
                BookingCustomerBase.fromJson(waitingPlayer.customer!.toJson()),
          ));

          widget.data.waitingList!.removeAt(index);
        }
      });
      if (widget.data.waitingList!.isEmpty && mounted) {
        Navigator.pop(context);
      }
    }
  }
}
