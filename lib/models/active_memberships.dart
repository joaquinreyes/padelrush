import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:padelrush/utils/custom_extensions.dart';

import '../app_styles/app_colors.dart';
import '../app_styles/app_text_styles.dart';

class ActiveMemberships {
  int? id;
  int? membershipId;
  String? membershipName;
  int? usesLeft;
  int? usageDurationLeft;
  String? finishDate;
  String? duration;
  String? location;

  ActiveMemberships(
      {this.id,
      this.membershipName,
      this.usesLeft,
      this.usageDurationLeft,
      this.membershipId,
      this.finishDate,
      this.duration,
      this.location});

  DateTime? get finishDateTime {
    if (finishDate != null) {
      return DateTime.tryParse(finishDate ?? "");
    }
    return null;
  }

  String finishDateString(BuildContext context) {
    return "${"VALID_UNTIL".tr(context)}:\n${finishDateTime != null ? finishDateTime!.format("dd/MM/yyyy") : "UNLIMITED".tr(context)}";
  }

  Widget usesLeftString(BuildContext context) {
    if (usesLeft == null || usesLeft == -1) {
      if (usesLeft == null && usageDurationLeft != null) {
        return Text(
          "${(usageDurationLeft ?? 0) / 3600} ${"HOUR".tr(context)}",
          style:
              AppTextStyles.poppinsRegular(fontSize: 13.sp, color: AppColors.white),
        );
      }
      return Text(
        "UNLIMITED".tr(context),
        style:
            AppTextStyles.poppinsRegular(fontSize: 13.sp, color: AppColors.white),
      );
    }
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration:
              BoxDecoration(color: AppColors.white, shape: BoxShape.circle),
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
          alignment: Alignment.center,
          child: Text(
            usesLeft.toString(),
            style: AppTextStyles.poppinsLight(
                fontSize: 13.sp, color: AppColors.black2),
          ),
        ),
        SizedBox(
          width: 5.w,
        ),
        Text(
          "REMAINING".tr(context).toLowerCase(),
          style: AppTextStyles.poppinsRegular(
              fontSize: 13.sp, color: AppColors.white),
        )
      ],
    );
  }

  ActiveMemberships.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    membershipName = json['membership_name'];
    membershipId = json['membership_id'];
    usesLeft = json['uses_left'];
    finishDate = json['finish_date'];
    duration = json['duration'];
    usageDurationLeft = json['usage_duration_left'];
    location = json['location'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['membership_name'] = membershipName;
    data['membership_id'] = membershipId;
    data['uses_left'] = usesLeft;
    data['finish_date'] = finishDate;
    data['duration'] = duration;
    data['location'] = location;
    data['usage_duration_left'] = usageDurationLeft;
    return data;
  }
}
