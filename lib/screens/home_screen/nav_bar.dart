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
        color: AppColors.backgroundColor,
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
              text: 'PLAY\n& MATCH'.trU(context),
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
              text: '${'RESERVE'.trU(context)}',
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
              text: 'PROFILE'.trU(context),
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
          margin: EdgeInsets.symmetric(horizontal: 4.w, vertical: 15.h),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            boxShadow: [kBoxShadow],
            color: isSelected ? AppColors.black2 : AppColors.white,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // if (index == 3) ...[
              //   const _Profile(),
              //   SizedBox(height: 2.h),
              // ],
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: isSelected ? 8.w : 10.w),
                child: Text(
                  text,
                  style: isSelected
                      ? AppTextStyles.qanelasMedium(
                          color: AppColors.white,
                          fontSize: 15.sp,)
                      : AppTextStyles.qanelasMedium(
                          color: AppColors.black70,
                          fontSize: 13.sp,
                        ),
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
      width: 23.w,
      height: 23.h,
      bgColor: AppColors.darkRosewood,
    );
  }
}

Widget _insetContainer({required Widget child}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 15.w),
    decoration: inset.BoxDecoration(
      color: AppColors.black5,
      borderRadius: BorderRadius.circular(5.r),
      boxShadow: kInsetShadow,
    ),
    // padding: EdgeInsets.all(4.h),
    child: child,
  );
}
