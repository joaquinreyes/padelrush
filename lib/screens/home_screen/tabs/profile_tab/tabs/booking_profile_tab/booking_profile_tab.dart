import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:padelrush/screens/home_screen/tabs/profile_tab/tabs/booking_profile_tab/user_bookings_list.dart';
import 'package:padelrush/utils/custom_extensions.dart';
import '../../../../../../app_styles/app_colors.dart';
import '../../../../../../app_styles/app_text_styles.dart';

part 'booking_profile_tab_provider.dart';

class BookingProfileTab extends ConsumerStatefulWidget {
  const BookingProfileTab({super.key});

  @override
  ConsumerState<BookingProfileTab> createState() => _BookingProfileTabState();
}

class _BookingProfileTabState extends ConsumerState<BookingProfileTab> {
  @override
  void initState() {
    super.initState();
    Future(() {
      ref.invalidate(_selectedTabIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    final pageController = ref.watch(_bookingPageController);
    ref.listen(
      _selectedTabIndex,
      (previous, next) {
        if (next == previous) return;
        ref.read(_bookingPageController.notifier).state.animateToPage(next,
            duration: const Duration(milliseconds: 300), curve: Curves.linear);
      },
    );
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Align(
          alignment: AlignmentDirectional.centerStart,
          child: Container(
            width: 200.w,
            height: 42.h,
            decoration: BoxDecoration(
              color: AppColors.lightGray,
              borderRadius: BorderRadius.circular(12.r),
            ),
            padding: EdgeInsets.all(3.h),
            child: Row(
              children: [
                _pageSelectorItem(
                    ref: ref, text: 'UPCOMING'.tr(context), index: 0),
                _pageSelectorItem(
                    ref: ref, text: 'PAST'.tr(context), index: 1),
              ],
            ),
          ),
        ),
        SizedBox(height: 14.h),
        ExpandablePageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: pageController,
          children: _pages,
        ),
      ],
    );
  }

  Widget _pageSelectorItem({
    required WidgetRef ref,
    required String text,
    required int index,
  }) {
    final selectedTab = ref.watch(_selectedTabIndex);
    final isSelected = selectedTab == index;
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
            borderRadius: BorderRadius.circular(10.r),
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
                    fontSize: 13.sp,
                    color: AppColors.white,
                  )
                : AppTextStyles.poppinsMedium(
                    color: AppColors.black70,
                    fontSize: 13.sp,
                  ),
          ),
        ),
      ),
    );
  }
}
