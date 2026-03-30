import 'dart:io';

import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:padelrush/box_shadow/flutter_inset_box_shadow.dart' as inset;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:padelrush/models/user_membership.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:padelrush/app_styles/app_colors.dart';
import 'package:padelrush/app_styles/app_text_styles.dart';
import 'package:padelrush/components/custom_dialog.dart';
import 'package:padelrush/components/following_follower_component.dart';
import 'package:padelrush/components/image_src_sheet.dart';
import 'package:padelrush/components/main_button.dart';
import 'package:padelrush/components/multi_style_text.dart';
import 'package:padelrush/components/network_circle_image.dart';
import 'package:padelrush/components/secondary_button.dart';
import 'package:padelrush/globals/constants.dart';
import 'package:padelrush/globals/images.dart';
import 'package:padelrush/globals/utils.dart';
import 'package:padelrush/managers/user_manager.dart';
import 'package:padelrush/repository/booking_repo.dart';
import 'package:padelrush/repository/user_repo.dart';
import 'package:padelrush/routes/app_pages.dart';
import 'package:padelrush/routes/app_routes.dart';
import 'package:padelrush/screens/home_screen/tabs/play_match_tab/tabs/tab_parent.dart';
import 'package:padelrush/screens/home_screen/tabs/profile_tab/tabs/booking_profile_tab/booking_profile_tab.dart';
import 'package:padelrush/screens/home_screen/tabs/profile_tab/tabs/booking_profile_tab/user_bookings_list.dart';
import 'package:padelrush/screens/home_screen/tabs/profile_tab/tabs/membership_tab/membership_tab.dart';
import 'package:padelrush/screens/home_screen/tabs/profile_tab/tabs/settings.dart';
import 'package:padelrush/utils/custom_extensions.dart';

import '../../../../globals/current_platform.dart';
import '../../../../repository/payment_repo.dart';
import '../../../payment_information/payment_information.dart';
import '../../../ranking_profile/ranking_profile.dart';

part 'profile_tab_components.dart';

part 'profile_tab_provider.dart';

class ProfileTab extends ConsumerStatefulWidget {
  const ProfileTab({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileTabState();
}

class _ProfileTabState extends ConsumerState<ProfileTab> {
  late List<Widget> _pages = [];

  @override
  void initState() {
    setPages(context);
    super.initState();
  }

  void setPages(BuildContext context) {
    Future(() {
      ref.read(_selectedTabIndex.notifier).state = 0;
      ref.invalidate(fetchUserProvider);
      ref.invalidate(fetchAllCustomFieldsProvider);
    });
    _pages = [
      const BookingProfileTab(),
      RankingProfile(customerID: ref.read(userProvider)?.user?.id ?? -1, isPage: false),
      const Settings(),
      MembershipTab(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final pageController = ref.watch(_profilePageController);
    ref.listen(
      _selectedTabIndex,
      (previous, next) {
        if (next == previous) return;
        ref.read(_profilePageController.notifier).state.animateToPage(next,
            duration: const Duration(milliseconds: 300), curve: Curves.linear);
      },
    );
    return PlayTabsParentWidget(
      onRefresh: () {
        int index = ref.read(_selectedTabIndex);
        if (index == 0) {
          return ref.refresh(fetchUserAllBookingsProvider.future);
        } else if (index == 3) {
          return ref.refresh(fetchActiveAndAllMembershipsProvider.future);
        }
        return ref.refresh(fetchUserProvider.future);
      },
      child: Column(
        children: [
          SizedBox(height: 10.h),
          const _HeaderInfo(),
          Container(
            width: double.infinity,
            height: 48.h,
            margin: EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.w),
            decoration: BoxDecoration(
              color: AppColors.lightGray,
              borderRadius: BorderRadius.circular(14.r),
            ),
            padding: EdgeInsets.all(4.h),
            child: Row(
              children: [
                _pageSelectorItem(text: 'BOOKINGS'.tr(context), index: 0),
                _pageSelectorItem(text: 'RANKING_PROFILE'.tr(context), index: 1),
                _pageSelectorItem(text: 'SETTINGS'.tr(context), index: 2),
                _pageSelectorItem(text: 'PACKAGES'.tr(context), index: 3),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: ExpandablePageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: pageController,
              children: _pages,
            ),
          ),
        ],
      ),
    );
  }

  Widget _pageSelectorItem({
    required String text,
    required int index,
  }) {
    final selectedTab = ref.watch(_selectedTabIndex);
    bool isSelected = selectedTab == index;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          if (selectedTab != index) {
            ref.read(_selectedTabIndex.notifier).state = index;
          }
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isSelected ? AppColors.black2 : Colors.transparent,
            borderRadius: BorderRadius.circular(11.r),
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
            text,
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
  }
}
