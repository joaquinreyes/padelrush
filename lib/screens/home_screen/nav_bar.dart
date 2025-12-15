import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:padelrush/app_styles/app_colors.dart';
import 'package:padelrush/app_styles/app_text_styles.dart';
import 'package:padelrush/components/network_circle_image.dart';
import 'package:padelrush/globals/constants.dart';
import 'package:padelrush/managers/user_manager.dart';
import 'package:padelrush/screens/app_provider.dart';
import 'package:padelrush/utils/custom_extensions.dart';
import 'package:padelrush/box_shadow/flutter_inset_box_shadow.dart' as inset;

class NavBar extends ConsumerStatefulWidget {
  const NavBar({Key? key}) : super(key: key);
  static const id = "NavBar";

  @override
  ConsumerState<NavBar> createState() => NavBarState();
}

class NavBarState extends ConsumerState<NavBar> {
  reload() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final pageIndex = ref.watch(pageIndexProvider);
    return Container(
      height: 80.h,
      alignment: Alignment.topCenter,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(5.r),
          topRight: Radius.circular(5.r),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.25),
            blurRadius: 24,
            offset: const Offset(0, 4),
            spreadRadius: 0,
          ),
        ],
      ),
      child: _insetContainer(
        child: Row(
          children: [
            _item(
              text: 'Play &\n   Match'.tr(context),
              index: 0,
              textHeight: 0.99,
              isSelected: pageIndex == 0,
              onTap: () async {
                if (pageIndex != 0) {
                  ref.read(pageIndexProvider.notifier).index = 0;
                }
              },
            ),
            _item(
              text: '${'BOOK_AND_COURT'.tr(context)}',
              index: 1,
              textHeight: 0.90,
              isSelected: pageIndex == 1,
              onTap: () async {
                if (pageIndex != 1) {
                  ref.read(pageIndexProvider.notifier).index = 1;
                }
              },
            ),
            // _item(
            //   text: '${'FITNESS'.trU(context)}',
            //   index: 2,
            //   textHeight: 0.90,
            //   isSelected: pageIndex == 2,
            //   onTap: () async {
            //     if (pageIndex != 2) {
            //       ref.read(pageIndexProvider.notifier).index = 2;
            //     }
            //   },
            // ),
            _item(
              text: 'PROFILE'.tr(context),
              index: 2,
              textHeight: 0.90,
              isSelected: pageIndex == 2,
              onTap: () async {
                if (pageIndex != 2) {
                  ref.read(pageIndexProvider.notifier).index = 2;
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  _item(
      {required String text,
      required int index,
      required bool isSelected,
      required Function() onTap,
      double textHeight = 1}) {
    return Expanded(
      child: InkWell(
        onTap: () async {
          onTap();
        },
        child: Container(
          // padding: EdgeInsets.symmetric(horizontal: 4.w),
          // height: 40.h,
          // width: 82.w,
          margin: EdgeInsets.symmetric(horizontal: 4.w, vertical: 5.h),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            boxShadow: isSelected ? [kBoxShadow] : null,
            color: isSelected ? AppColors.darkYellow : AppColors.transparentColor,
            borderRadius: BorderRadius.circular(100.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (index == 2) ...[
                const _Profile(),
                SizedBox(height: 2.h),
              ],
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: isSelected ? 4.w : 10.w),
                child: Text(
                  text,
                  style: isSelected
                      ? AppTextStyles.poppinsBold(
                          color: AppColors.black,
                          fontSize: 15.sp,).copyWith(height: 1)
                      : AppTextStyles.poppinsRegular(
                          color: AppColors.black70,
                          fontSize: 14.sp,
                        ).copyWith(height: 1),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Profile extends ConsumerWidget {
  const _Profile();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    return NetworkCircleImage(
      path: user?.user?.profileUrl,
      showBG: true,
      borderRadius: BorderRadius.circular(8.r),
      width: 25.w,
      height: 25.h,
      bgColor: AppColors.darkRosewood,
    );
  }
}

Widget _insetContainer({required Widget child}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 15.w),
    margin: EdgeInsets.only(left: 14.5.w,right: 14.5.w,top: 10.h,bottom: 18.h),
    decoration: inset.BoxDecoration(
      color: AppColors.gray,
      borderRadius: BorderRadius.circular(100.r),
      boxShadow: kInsetShadow,
    ),
    // padding: EdgeInsets.all(4.h),
    child: child,
  );
}
