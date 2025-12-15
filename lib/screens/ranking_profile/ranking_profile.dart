import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:padelrush/app_styles/app_colors.dart';
import 'package:padelrush/app_styles/app_text_styles.dart';
import 'package:padelrush/components/c_divider.dart';
import 'package:padelrush/components/custom_dialog.dart';
import 'package:padelrush/components/network_circle_image.dart';
import 'package:padelrush/components/secondary_button.dart';
import 'package:padelrush/components/secondary_text.dart';
import 'package:padelrush/globals/constants.dart';
import 'package:padelrush/globals/images.dart';
import 'package:padelrush/globals/utils.dart';
import 'package:padelrush/models/app_user.dart';
import 'package:padelrush/models/base_classes/booking_player_base.dart';
import 'package:padelrush/models/service_detail_model.dart';
import 'package:padelrush/models/user_assessment.dart';
import 'package:padelrush/models/user_match_levels.dart';
import 'package:padelrush/repository/user_repo.dart';
import 'package:padelrush/routes/app_pages.dart';
import 'package:padelrush/utils/custom_extensions.dart';
import 'package:padelrush/widgets/background_view.dart';
import 'package:padelrush/box_shadow/flutter_inset_box_shadow.dart' as inset;
import '../../components/follow_unfollow_component.dart';
import '../../components/main_button.dart';
import '../../components/user_lessons_events_card.dart';
import '../../managers/user_manager.dart';
import '../../routes/app_routes.dart';
import '../open_match_detail/match_result_dialog/enter_match_result.dart';

part 'components.dart';

class RankingProfile extends ConsumerStatefulWidget {
  const RankingProfile(
      {super.key, required this.customerID, this.isPage = true});

  final int customerID;
  final bool isPage;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RankingProfileState();
}

class _RankingProfileState extends ConsumerState<RankingProfile> {
  @override
  Widget build(BuildContext context) {
    final assessment =
        ref.watch(fetchUserAssessmentProvider(id: widget.customerID));

    if (!widget.isPage) {
      return assessment.when(
        data: (data) {
          return _body(data);
        },
        loading: () => const Center(child: CupertinoActivityIndicator()),
        error: (error, stack) {
          myPrint("stack: $stack");
          return Center(child: Text(error.toString()));
        },
      );
    }

    return BackgroundView(
      child: Scaffold(
        backgroundColor: AppColors.transparentColor,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Column(
              children: [
                SizedBox(height: 20.h),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 3.w),
                    child: GestureDetector(
                      onTap: () => ref.read(goRouterProvider).pop(),
                      child: Image.asset(
                        AppImages.back_arrow_new.path,
                        height: 24.h,
                        width: 24.h,
                      ),
                    ),
                  ),
                ),
                // SizedBox(height: 6.h),
                Expanded(
                  child: assessment.when(
                    data: (data) {
                      return _body(data);
                    },
                    loading: () =>
                        const Center(child: CupertinoActivityIndicator()),
                    error: (error, stack) {
                      myPrint("stack: $stack");
                      return Center(child: Text(error.toString()));
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _body(UserAssessment assessment) {
    final userFromAssessment = fetchCustomer(assessment);
    if (userFromAssessment == null || assessment.customer == null) {
      return Center(
        child: SecondaryText(
          text: "NO_PAST_RANKED_MATCHES".trU(context),
        ),
      );
    }
    final paymentDetails = ref.watch(walletInfoProvider);
    (assessment.assessments ?? [])
        .sort((a, b) => b.bookingDate.compareTo(a.bookingDate));
    String sportsName = kSportName;
    final currentUserID = ref.read(userManagerProvider).user?.user?.id;
    final isMe = widget.customerID == currentUserID;

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          if (widget.isPage && !isMe)
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SecondaryButton(
                  decoration: BoxDecoration(
                      color: AppColors.darkYellow,
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(color: AppColors.black2.withOpacity(0.05))),
                  onTap: () {
                    final userName =
                        "${userFromAssessment.firstName ?? ''} ${userFromAssessment.lastName ?? ''}"
                            .trim();
                    ref.read(goRouterProvider).push(
                      RouteNames.privateChat,
                      extra: {
                        'otherUserId': widget.customerID.toString(),
                        'otherUserName': userName.isNotEmpty
                            ? userName
                            : 'User ${widget.customerID}',
                        'otherUserAvatar': userFromAssessment.profileUrl,
                      },
                    );
                  },
                  child: Text(
                    "MESSAGE".tr(context),
                    style: AppTextStyles.poppinsMedium(
                        fontSize: 13.sp, color: AppColors.black2),
                  ),
                ),
                SizedBox(width: 10.w),
                FollowUnfollowComponent(customerID: widget.customerID),
              ],
            ),
          if (widget.isPage) SizedBox(height: 15.h),

          if (widget.isPage)
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    ref.read(goRouterProvider).push(RouteNames.showImage,
                        extra: [userFromAssessment.profileUrl ?? ""]);
                  },
                  child: Hero(
                    tag: "imageHero${userFromAssessment.profileUrl}",
                    child: NetworkCircleImage(
                      path: userFromAssessment.profileUrl,
                      // isUserProfile: true,
                      width: 100.h,
                      height: 100.h,
                      showBG: true,
                      bgColor: AppColors.black2,
                      logoColor: AppColors.white,
                      borderRadius: BorderRadius.circular(12.r),
                      applyShadow: false,
                    ),
                  ),
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        // "${(userFromAssessment.firstName ?? "").toUpperCase()} ${(userFromAssessment.lastName ?? "").toUpperCase()}",
                        "${(userFromAssessment.firstName ?? "").toUpperCase()}",
                        textAlign: TextAlign.start,
                        style: AppTextStyles.pragmaticaObliqueExtendedBold(
                          fontSize: 24.sp,
                        ),
                      ),
                      if (userFromAssessment.playingSide.isNotEmpty)
                        Text(
                          "${userFromAssessment.level(kSportName)} ${userFromAssessment.playingSide.isNotEmpty ? "\u2022" : ''} ${userFromAssessment.playingSide}",
                          style: AppTextStyles.poppinsRegular(
                            fontSize: 15.sp,
                          ),
                        ),
                      5.verticalSpace,
                      if (isMe)
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "WALLET".tr(context),
                              style: AppTextStyles.poppinsBold(fontSize: 15.sp),
                            ),
                            SizedBox(width: 4.w),
                            paymentDetails.when(
                                data: (data) {
                                  if (data.isNotEmpty) {
                                    return Text(
                                      Utils.formatPrice2(
                                              data.first.balance, currency)
                                          .toUpperCase(),
                                      style: AppTextStyles.poppinsRegular(
                                        fontSize: 15.sp,
                                      ),
                                    );
                                  }

                                  return Text(
                                    Utils.formatPrice2(0, currency)
                                        .toUpperCase(),
                                    style: AppTextStyles.poppinsRegular(
                                      fontSize: 15.sp,
                                    ),
                                  );
                                },
                                error: (error, stackTrace) => Text(
                                      Utils.formatPrice2(0, currency),
                                      style: AppTextStyles.poppinsRegular(
                                        fontSize: 15.sp,
                                      ),
                                    ),
                                loading: () => const Center(
                                      child: CupertinoActivityIndicator(
                                        radius: 10,
                                      ),
                                    ))
                          ],
                        ),
                    ],
                  ),
                ),
              ],
            ),
          if (widget.isPage && !isMe) SizedBox(height: 20.h),
          // if (widget.isPage) SizedBox(height: 25.h),
          _PlayerRanking(
            level: userFromAssessment.levelD(kSportName),
            reliability: userFromAssessment.reliability(sportsName),
            matchPlayed: userFromAssessment.gamesPlayed(sportsName),
          ),
          SizedBox(height: 8.h),
          // Align(
          //   alignment: Alignment.centerRight,
          //   child: SecondaryButton(
          //     color: AppColors.black2,
          //     child: Text("SEE_LEVEL_CONVERSION_SYSTEM".tr(context),
          //         style: AppTextStyles.qanelasMedium(
          //             fontSize: 14.sp,
          //             color: AppColors.white)),
          //     onTap: () {
          //       showDialog(
          //         context: context,
          //         builder: (context) {
          //           return const _LevelConversionDialog();
          //         },
          //       );
          //     },
          //   ),
          // ),
          SizedBox(height: 20.h),
          _PlayerStats(
            customerFromAssessment: userFromAssessment,
            customer: assessment.customer!,
          ),
          SizedBox(height: 20.h),
          // _RankingProgression(
          //   userId: widget.customerID,
          //   sportName: kSportName,
          // ),
          _PastMatches(
            assessments: assessment.assessments ?? [],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  BookingCustomerBase? fetchCustomer(UserAssessment assessment) {
    if ((assessment.assessments ?? []).isEmpty) {
      if (assessment.customer != null) {
        try {
          return BookingCustomerBase.fromJson(assessment.customer!.toJson());
        } catch (e) {
          return null;
        }
      }
      return null;
    }
    int index = assessment.assessments?.first.players?.indexWhere(
          (element) => element.customer?.id == widget.customerID,
        ) ??
        -1;
    if (index == -1) {
      return null;
    }
    return assessment.assessments?.first.players?[index].customer;
  }
}
