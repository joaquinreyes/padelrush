import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:padelrush/components/custom_dialog.dart';
import 'package:padelrush/globals/utils.dart';
import 'package:padelrush/models/active_memberships.dart';
import 'package:padelrush/utils/custom_extensions.dart';
import 'package:padelrush/box_shadow/flutter_inset_box_shadow.dart' as inset;
import '../../../../../../app_styles/app_colors.dart';
import '../../../../../../app_styles/app_text_styles.dart';
import '../../../../../../components/c_divider.dart';
import '../../../../../../components/main_button.dart';
import '../../../../../../components/secondary_text.dart';
import '../../../../../../globals/constants.dart';
import '../../../../../../globals/images.dart';
import '../../../../../../models/membership_list_category_model.dart';
import '../../../../../../models/membership_model.dart';
import '../../../../../../models/user_membership.dart';
import '../../../../../../repository/booking_repo.dart';
import '../../../../../../repository/payment_repo.dart';
import '../../../../../payment_information/payment_information.dart';

part 'membership_tab_component.dart';

part 'membership_tab_provider.dart';

class MembershipTab extends ConsumerWidget {
  const MembershipTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final membership = ref.watch(fetchActiveAndAllMembershipsProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 3.w,
              height: 18.h,
              decoration: BoxDecoration(
                color: AppColors.darkYellow,
                borderRadius: BorderRadius.circular(2.r),
              ),
            ),
            SizedBox(width: 8.w),
            Text(
              'MEMBERSHIP_INFORMATION'.trU(context),
              style: AppTextStyles.poppinsBold(fontSize: 17.sp),
            ),
          ],
        ),
        SizedBox(height: 14.h),
        membership.when(
            data: (data) {
              if (data.membershipModel.isEmpty) {
                return Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Center(
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(20.h),
                          decoration: BoxDecoration(
                            color: AppColors.lightGray,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(Icons.card_membership_outlined,
                              size: 40.sp, color: AppColors.black25),
                        ),
                        SizedBox(height: 16.h),
                        SecondaryText(
                            text: "NO_MEMBERSHIP_FOUND".tr(context)),
                      ],
                    ),
                  ),
                );
              }
              final selectedMembershipCategory =
                  ref.watch(selectedMembershipCatIndex);

              if (data.showMembershipCategories.isNotEmpty &&
                  selectedMembershipCategory.isEmpty) {
                final defaultCategory = data.showMembershipCategories
                    .firstWhere(
                        (element) =>
                            (element.categoryName ?? "")
                                .toString()
                                .trim()
                                .toLowerCase() ==
                            kSportName,
                        orElse: () => data.showMembershipCategories.first);

                WidgetsBinding.instance.addPostFrameCallback((_) {
                  ref.read(selectedMembershipCatIndex.notifier).state =
                      defaultCategory.id;
                });
              }

              return Column(
                children: [
                  if (allowShowPadelMembershipInProfile)
                    Padding(
                      padding: EdgeInsets.only(bottom: 14.h),
                      child: _MembershipCategorySelection(
                          showMembershipCategories:
                              data.showMembershipCategories),
                    ),
                  MembershipListComponent(
                      data: data, showAllMembership: false),
                ],
              );
            },
            error: (e, _) =>
                SecondaryText(text: "NO_MEMBERSHIP_FOUND".tr(context)),
            loading: () => const Center(child: CupertinoActivityIndicator()))
      ],
    );
  }
}
