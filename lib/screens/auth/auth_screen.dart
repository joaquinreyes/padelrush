import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:padelrush/app_styles/app_colors.dart';
import 'package:padelrush/app_styles/app_text_styles.dart';
import 'package:padelrush/components/main_button.dart';
import 'package:padelrush/globals/constants.dart';
import 'package:padelrush/globals/current_platform.dart';
import 'package:padelrush/globals/images.dart';
import 'package:padelrush/routes/app_pages.dart';
import 'package:padelrush/routes/app_routes.dart';
import 'package:padelrush/screens/auth/auth_responseive.dart';
import 'package:padelrush/utils/custom_extensions.dart';

import '../../managers/shared_pref_manager.dart';
import '../../repository/club_repo.dart';
import '../app_provider.dart';

class AuthScreen extends ConsumerStatefulWidget {
  const AuthScreen({super.key});

  @override
  ConsumerState<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends ConsumerState<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return AuthResponsive(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.authBackground.path),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: PlatformC().isCurrentDesignPlatformDesktop ? 30 : 0,
              ),
              child: ConstrainedBox(
                constraints: kComponentWidthConstraint,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 70.h),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: GestureDetector(
                          onTap: () async {
                            await ref.read(sharedPrefManagerProvider).setSkip(true);
                            ref.watch(getCourtBookingProvider);
                            ref.read(pageIndexProvider.notifier).index = 1;
                            ref.invalidate(pageControllerProvider);
                            ref.read(goRouterProvider).go(RouteNames.home);
                          },
                          child: Container(
                            height: 24.h,
                            width: 120.w,
                            decoration: BoxDecoration(
                              color: AppColors.darkYellow
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              "SKIP".tr(context),
                              style: AppTextStyles.qanelasMedium(
                                fontSize: 13.sp,
                                color: AppColors.black2,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),

                    ),
                    const Spacer(),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 50.w),
                      child: Image.asset(
                        AppImages.splashLogo.path,
                        width: double.infinity,
                        alignment: Alignment.center,
                        // height: 92.h,
                      ),
                    ),
                    const Spacer(),
                    MainButton(
                      label: "SIGN_IN".trU(context),
                      borderRadius: 0.r,
                      showArrow: true,
                      // arrowImages: AppImages.rightArrowGreen.path,
                      // height: 40.h,
                      labelStyle: AppTextStyles.qanelasMedium(
                          color: AppColors.black,
                          fontSize: 18.sp,),
                      color: AppColors.darkYellow,
                      onTap: () {
                        ref.read(goRouterProvider).push(RouteNames.sign_in);
                      },
                    ),
                    SizedBox(height: 20.h),
                    MainButton(
                      color: AppColors.darkYellow30,
                      borderRadius: 0.r,
                      label: "REGISTER".tr(context),
                      labelStyle: AppTextStyles.qanelasRegular(
                        color: AppColors.darkYellow,
                        fontSize: 18.sp,
                      ),
                      showArrow: true,
                      // height: 40.h,
                      onTap: () {
                        ref.read(goRouterProvider).push(RouteNames.sign_up);
                      },
                    ),
                    SizedBox(height: 88.h),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
