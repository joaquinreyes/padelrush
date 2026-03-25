part of 'membership_tab.dart';

class _MembershipDialog extends StatelessWidget {
  final MembershipModel membership;
  final ActiveMemberships? activeMembership;

  const _MembershipDialog(
      {required this.membership, required this.activeMembership});

  @override
  Widget build(BuildContext context) {
    final membershipName = membership.membershipName?.toUpperCase() ?? "";
    final categoryName = membership.categoryName ?? "";

    final membershipDescription = (membership.description ?? "")
        .replaceAll(RegExp(r'<[^>]*>'), '')
        .trim();
    final membershipPrice = membership.price ?? 0;
    final bool isGold = membershipName.toLowerCase().contains("coach");

    final membershipValidity =
        activeMembership?.finishDateString(context) ?? "";

    return CustomDialog(
      maxHeight: MediaQuery.of(context).size.height * 0.85,
      child: Column(
        children: [
          // Image.asset(
          //   isGold
          //       ? AppImages.membershipGoldCard.path
          //       : AppImages.membershipCard.path,
          //   height: 99.h,
          //   width: 99.h,
          //   fit: BoxFit.contain,
          // ),
          SizedBox(height: 5.h),
          Text(
            "${"MEMBERSHIP".trU(context)} ${"INFORMATION".trU(context)}",
            style: AppTextStyles.popupHeaderTextStyle,
          ),
          5.verticalSpace,
          Text(
            "MEMBERSHIPS_WILL_BE_SHOWN_IN_YOUR_PROFILE".tr(context),
            style: AppTextStyles.popupBodyTextStyle,
          ),
          // Text(
          //   membershipName,
          //   style: AppTextStyles.popupHeaderTextStyle,
          //   textAlign: TextAlign.center,
          // ),
          SizedBox(height: 20.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
            margin: EdgeInsets.symmetric(horizontal: 3.w),
            constraints: kComponentWidthConstraint,
            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(color: AppColors.black2)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "${categoryName.trim().isNotEmpty ? "${categoryName.capitalizeFirst} : " : ""}$membershipName",
                  style: AppTextStyles.poppinsMedium(
                      color: AppColors.black2, fontSize: 16.sp),
                  textAlign: TextAlign.start,
                ),
                CDivider(
                  color: AppColors.black2,
                ),
                SizedBox(height: 4.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          "${"PRICE".tr(context)} ${Utils.formatPrice(membershipPrice)}",
                          style: AppTextStyles.poppinsRegular(
                            fontSize: 15.sp,
                          ),
                        ),
                        // Text(
                        //   Utils.formatPrice(membershipPrice),
                        //   style: AppTextStyles.qanelasSemiBold(fontSize: 15.sp,),
                        // ),
                      ],
                    ),
                    // Text(
                    //   membershipValidity,
                    //   style: AppTextStyles.qanelasRegular(fontSize: 15.sp,),
                    // ),
                  ],
                ),
                // SizedBox(height: 5.h),
                // CDivider(
                //   color: AppColors.black25,
                // ),
                // SizedBox(height: 5.h),
                // Column(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                //     Text(
                //       "DESCRIPTION".tr(context),
                //       style: AppTextStyles.qanelasMedium(
                //           fontSize: 16.sp,),
                //     ),
                //     SizedBox(height: 5.h),
                //     Text(
                //       membershipDescription,
                //       style: AppTextStyles.qanelasRegular(
                //           fontSize: 15.sp,),
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
          if (membershipDescription.isNotEmpty)
            SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 15.h),
                  Text(
                    "${"DESCRIPTION".tr(context)} :",
                    style: AppTextStyles.poppinsMedium(
                        color: AppColors.black2, fontSize: 17.sp),
                  ),
                  SizedBox(height: 5.h),
                  Text(membershipDescription,
                      style: AppTextStyles.popupBodyTextStyle),
                ],
              ),
            ),
          if (activeMembership == null) SizedBox(height: 25.h),
          if (activeMembership == null)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: MainButton(
                isForPopup: true,
                padding: EdgeInsets.only(top: 9.h, bottom: 5.h),
                label: "PAY_MEMBERSHIP".trU(context),
                // labelStyle: AppTextStyles.qanelasRegular(
                //   color: AppColors.white,
                //   fontSize: 17.sp,
                //   letterSpacing: 17.sp * 0.12,
                // ),
                onTap: () {
                  Navigator.pop(context, true);
                },
              ),
            )
        ],
      ),
    );
  }
}

class _MembershipCategorySelection extends ConsumerWidget {
  final List<ShowMembershipCategory> showMembershipCategories;

  const _MembershipCategorySelection({required this.showMembershipCategories});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(selectedMembershipCatIndex);
    return Container(
      height: 42.h,
      decoration: BoxDecoration(
        color: AppColors.lightGray,
        borderRadius: BorderRadius.circular(12.r),
      ),
      padding: EdgeInsets.all(4.h),
      child: Row(
        children: showMembershipCategories.map((e) {
          final id = e.id;
          final isSelected = listEquals(e.id, value);
          final categoryName = e.categoryName ?? "";
          return Expanded(
            child: GestureDetector(
              onTap: () {
                if (!isSelected) {
                  ref.read(selectedMembershipCatIndex.notifier).state = id;
                }
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.black2 : Colors.transparent,
                  borderRadius: BorderRadius.circular(9.r),
                  boxShadow: isSelected
                      ? [
                          BoxShadow(
                            color: AppColors.black2.withOpacity(0.15),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ]
                      : [],
                ),
                child: Text(
                  categoryName.capitalizeFirst,
                  textAlign: TextAlign.center,
                  style: isSelected
                      ? AppTextStyles.poppinsSemiBold(
                          fontSize: 12.sp,
                          color: AppColors.white,
                        )
                      : AppTextStyles.poppinsMedium(
                          fontSize: 12.sp,
                          color: AppColors.black70,
                        ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class MembershipListComponent extends ConsumerWidget {
  final UserActiveMembership data;
  final Axis scrollDirection;
  final bool showAllMembership;

  const MembershipListComponent(
      {super.key,
      required this.data,
      this.scrollDirection = Axis.vertical,
      this.showAllMembership = true});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedMembershipCategory = ref.watch(selectedMembershipCatIndex);

    final Map<String, List<MembershipModel>> membershipDetails = data
        .getMembershipDetails(selectedMembershipCategory, showAllMembership);

    if (membershipDetails.isEmpty) {
      return const SizedBox();
    }

    return Column(
      children: membershipDetails.entries.map((entry) {
        final membershipCategoryName = entry.key;
        final membershipModels = entry.value;

        final isHorizontalScroll = scrollDirection == Axis.horizontal;
        return SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.only(bottom: 15.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (!showAllMembership)
                  Padding(
                    padding: EdgeInsets.only(bottom: 10.h),
                    child: Row(
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
                          membershipCategoryName.toUpperCase(),
                          style: AppTextStyles.poppinsBold(
                            fontSize: 16.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                membershipModels.isEmpty
                    ? Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                        child: Text("NO_PURCHASE_MEMBERSHIP_FOUND".tr(context),
                            style: AppTextStyles.poppinsRegular(
                              fontSize: 13.sp,
                            )),
                      )
                    : isHorizontalScroll
                        ? SizedBox(
                            height: 80.h,
                            width: double.infinity,
                            child: listMembership(
                                ref: ref, membershipModels: membershipModels))
                        : listMembership(
                            ref: ref, membershipModels: membershipModels),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget listMembership(
      {required WidgetRef ref,
      required List<MembershipModel> membershipModels}) {
    final isHorizontalScroll = scrollDirection == Axis.horizontal;
    return ListView.builder(
        shrinkWrap: !isHorizontalScroll,
        scrollDirection: scrollDirection,
        itemCount: membershipModels.length,
        padding: isHorizontalScroll ? EdgeInsets.symmetric(horizontal: 15.w) : EdgeInsets.zero,
        physics: isHorizontalScroll
            ? BouncingScrollPhysics()
            : const NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          final e = membershipModels[index];
          final membershipName = (e.membershipName ?? "");
          final activeMembership = data.activeMemberships(e.id ?? 0);
          return Padding(
            padding: isHorizontalScroll
                ? EdgeInsets.only(right: 15.w)
                : EdgeInsets.only(bottom: 5.h),
            child: isHorizontalScroll
                ? Container(
                    width: 270.w,
                    height: 100.h,
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    decoration: BoxDecoration(
                      color: AppColors.darkYellow25,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            membershipName.toUpperCase(),
                            style: AppTextStyles.poppinsMedium(
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                        SizedBox(height: 5.h),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                '${"PRICE".tr(context)} ${Utils.formatPrice(e.price)}',
                                style: AppTextStyles.poppinsSemiBold(
                                  fontSize: 14.sp,
                                  color: AppColors.black2,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () async {
                                final selectedDate = await showDialog(
                                  context: context,
                                  builder: (context) {
                                    return _MembershipDialog(
                                        activeMembership: activeMembership,
                                        membership: e);
                                  },
                                );
                                if (selectedDate is! bool &&
                                    selectedDate != true) {
                                  return;
                                }
                                final data = await showDialog(
                                  context: context,
                                  builder: (context) {
                                    return PaymentInformation(
                                      type:
                                          PaymentDetailsRequestType.membership,
                                      locationID: e.locationId,
                                      allowCoupon: false,
                                      allowMembership: false,
                                      allowWallet: false,
                                      purchaseMembership: true,
                                      price: e.price ?? 0,
                                      requestType:
                                          PaymentProcessRequestType.membership,
                                      serviceID: e.id ?? 0,
                                      startDate: null,
                                      duration: null,
                                    );
                                  },
                                );
                                var (int? paymentDone, double? amount) =
                                    (null, null);
                                if (data is (int, double?)) {
                                  (paymentDone, amount) = data;
                                }
                                if (paymentDone != null && context.mounted) {
                                  await Utils.showMessageDialog(
                                    context,
                                    "YOU_HAVE_PURCHASED_MEMBERSHIP_SUCCESSFULLY"
                                        .tr(context),
                                  );
                                }
                                ref.invalidate(
                                    fetchActiveAndAllMembershipsProvider);
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20.w, vertical: 4.5.h),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: kInsetShadow,
                                  borderRadius: BorderRadius.circular(8.r),
                                  // border: Border.all(color: AppColors.black25, width: 1),
                                ),
                                child: Text(
                                  'Buy',
                                  style: AppTextStyles.poppinsMedium(
                                    fontSize: 14.sp,
                                    color: AppColors.black2,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                : _MembershipCard(
                    membership: e,
                    activeMembership: activeMembership,
                    data: data,
                    ref: ref,
                  ),
          );
        });
  }
}

class _MembershipCard extends StatelessWidget {
  final MembershipModel membership;
  final ActiveMemberships? activeMembership;
  final UserActiveMembership data;
  final WidgetRef ref;

  const _MembershipCard({
    required this.membership,
    required this.activeMembership,
    required this.data,
    required this.ref,
  });

  @override
  Widget build(BuildContext context) {
    final membershipName = membership.membershipName ?? "";
    final isActive = activeMembership != null;

    return Container(
      margin: EdgeInsets.only(bottom: 8.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.black2.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          // Dark header with membership name
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            decoration: BoxDecoration(
              color: AppColors.black2,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.r),
                topRight: Radius.circular(16.r),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    membershipName,
                    style: AppTextStyles.poppinsSemiBold(
                      fontSize: 15.sp,
                      color: AppColors.white,
                    ),
                  ),
                ),
                if (isActive)
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
                    decoration: BoxDecoration(
                      color: AppColors.darkYellow,
                      borderRadius: BorderRadius.circular(100.r),
                    ),
                    child: Text(
                      "ACTIVE".tr(context),
                      style: AppTextStyles.poppinsSemiBold(
                        fontSize: 11.sp,
                        color: AppColors.black2,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          // Body with price and status
          Padding(
            padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 12.h),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Utils.formatPrice(membership.price),
                        style: AppTextStyles.poppinsBold(fontSize: 16.sp),
                      ),
                      if (isActive) ...[
                        SizedBox(height: 4.h),
                        Text(
                          activeMembership!.finishDateString(context).replaceAll("\n", " "),
                          style: AppTextStyles.poppinsRegular(
                            fontSize: 12.sp,
                            color: AppColors.black70,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                if (isActive)
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                    decoration: BoxDecoration(
                      color: AppColors.black2,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: activeMembership!.usesLeftString(context),
                  )
                else
                  _buildGetButton(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGetButton(BuildContext context) {
    return InkWell(
      onTap: () => _handlePurchase(context),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: AppColors.darkYellow,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Text(
          "GET_MEMBERSHIP".tr(context),
          style: AppTextStyles.poppinsSemiBold(
            fontSize: 12.sp,
            color: AppColors.black2,
          ),
        ),
      ),
    );
  }

  void _handlePurchase(BuildContext context) async {
    final selectedDate = await showDialog(
      context: context,
      builder: (context) {
        return _MembershipDialog(
          activeMembership: activeMembership,
          membership: membership,
        );
      },
    );
    if (selectedDate is! bool && selectedDate != true) {
      return;
    }
    final paymentData = await showDialog(
      context: context,
      builder: (context) {
        return PaymentInformation(
          type: PaymentDetailsRequestType.membership,
          locationID: membership.locationId,
          allowCoupon: false,
          allowMembership: false,
          allowWallet: false,
          purchaseMembership: true,
          price: membership.price ?? 0,
          requestType: PaymentProcessRequestType.membership,
          serviceID: membership.id ?? 0,
          startDate: null,
          duration: null,
        );
      },
    );
    var (int? paymentDone, double? amount) = (null, null);
    if (paymentData is (int, double?)) {
      (paymentDone, amount) = paymentData;
    }
    if (paymentDone != null && context.mounted) {
      await Utils.showMessageDialog(
        context,
        "YOU_HAVE_PURCHASED_MEMBERSHIP_SUCCESSFULLY".tr(context),
      );
    }
    ref.invalidate(fetchActiveAndAllMembershipsProvider);
  }
}
