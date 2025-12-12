import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hop/components/network_circle_image.dart';
import 'package:hop/components/secondary_text.dart';
import 'package:hop/globals/images.dart';
import 'package:hop/globals/utils.dart';
import 'package:hop/models/app_user.dart';
import 'package:hop/models/follow_list.dart';
import 'package:hop/routes/app_pages.dart';
import 'package:hop/routes/app_routes.dart';
import 'package:hop/utils/custom_extensions.dart';

import '../app_styles/app_colors.dart';
import '../app_styles/app_text_styles.dart';
import '../globals/constants.dart';
import '../repository/user_repo.dart';
import 'custom_dialog.dart';

class FollowingFollowerComponent extends ConsumerWidget {
  const FollowingFollowerComponent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final followingList = ref.watch(getFollowingListProvider);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        followingList.when(
          data: (data) {
            final count = data.count ?? 0;
            return GestureDetector(
              onTap: () {
                _showFollowingListDialog(context, ref, data);
              },
              child: Container(
                height: 24.h,
                width: 105.w,
                decoration: BoxDecoration(
                    color: AppColors.darkYellow30,
                    borderRadius: BorderRadius.circular(12.r),
                    border:
                        Border.all(color: AppColors.black2.withOpacity(0.05)),
                    boxShadow: [kBoxShadow]),
                alignment: Alignment.center,
                child: Text(
                  "FOLLOWING".tr(context) + " $count",
                  style: AppTextStyles.qanelasRegular(
                    fontSize: 13.sp,
                    color: AppColors.black2,
                  ),
                ),
              ),
            );
          },
          loading: () => Container(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 8.h),
            decoration: BoxDecoration(
              color: AppColors.darkYellow,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: SizedBox(
              width: 60.w,
              height: 16.h,
              child: const Center(
                child: CupertinoActivityIndicator(
                  radius: 8,
                ),
              ),
            ),
          ),
          error: (error, stack) {
            myPrint("Error loading following list: $error");
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 8.h),
              decoration: BoxDecoration(
                color: AppColors.darkYellow,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Text(
                "FOLLOWING".trU(context) + " 0",
                style: AppTextStyles.qanelasMedium(
                  fontSize: 13.sp,
                  color: AppColors.black2,
                ),
              ),
            );
          },
        ),
        SizedBox(width: 8.w),
        const FollowPlayersButton(),
      ],
    );
  }

  void _showFollowingListDialog(
      BuildContext context, WidgetRef ref, FollowList data) {
    showDialog(
      context: context,
      builder: (context) {
        return CustomDialog(
            color: AppColors.white,
            closeIconColor: AppColors.black2,
            child: FollowingList());
      },
    );
  }
}

class FollowPlayersButton extends StatelessWidget {
  const FollowPlayersButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          showDialog(
            context: context,
            builder: (context) {
              return CustomDialog(
                color: AppColors.white,
                closeIconColor: AppColors.black2,
                maxHeight: 600.h,
                child: const FollowPlayersDialog(),
              );
            },
          );
        },
        child: Image.asset(
          AppImages.addUser.path,
          height: 21.h,
          width: 21.h,
        ));
  }
}

class FollowingList extends ConsumerStatefulWidget {
  const FollowingList({super.key});

  @override
  ConsumerState<FollowingList> createState() => _FollowingListState();
}

class _FollowingListState extends ConsumerState<FollowingList> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final followingList = ref.watch(getFollowingListProvider);

    return followingList.when(
      data: (data) {
        final count = data.count ?? 0;

        return Column(
          children: [
            Text(
              "FOLLOWING".trU(context) + " $count",
              style: AppTextStyles.qanelasMedium(
                fontSize: 19.sp,
                color: AppColors.black2,
              ),
            ),
            SizedBox(height: 15.h),
            if (data.following == null || data.following!.isEmpty)
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20.h),
                child: Center(
                  child: Text(
                    "NO_FOLLOWING_FOUND".tr(context),
                    style: AppTextStyles.qanelasRegular(
                      fontSize: 14.sp,
                      color: AppColors.black2,
                    ),
                  ),
                ),
              ),
            if (data.following != null && data.following!.isNotEmpty)
              Container(
                constraints: BoxConstraints(
                  maxHeight: 400.h,
                ),
                child: ScrollbarTheme(
                  data: ScrollbarThemeData(
                    thumbColor: WidgetStateProperty.all(AppColors.darkGray50),
                    trackColor: WidgetStateProperty.all(AppColors.white),
                    trackBorderColor:
                        WidgetStateProperty.all(Colors.transparent),
                    thickness: WidgetStateProperty.all(10),
                    radius: Radius.circular(5.r),
                  ),
                  child: Scrollbar(
                    controller: _scrollController,
                    interactive: true,
                    trackVisibility: true,
                    thickness: 8,
                    radius: Radius.circular(4.r),
                    thumbVisibility: true,
                    child: ListView.separated(
                      shrinkWrap: true,
                      padding: EdgeInsets.only(right: 15),
                      controller: _scrollController,
                      itemCount: data.following!.length,
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 12.h),
                      itemBuilder: (context, index) {
                        final user = data.following![index];
                        return _FollowingUserItem(user: user);
                      },
                    ),
                  ),
                ),
              ),
          ],
        );
      },
      loading: () => Container(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: AppColors.darkYellow,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: SizedBox(
          width: 60.w,
          height: 16.h,
          child: const Center(
            child: CupertinoActivityIndicator(
              radius: 8,
              color: AppColors.black2,
            ),
          ),
        ),
      ),
      error: (error, stack) {
        return SecondaryText(text: "NO_FOLLOWING_FOUND".tr(context));
      },
    );
  }
}

class _FollowingUserItem extends ConsumerWidget {
  final Following user;

  const _FollowingUserItem({required this.user});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final userLevel = user.following?.level(kSportName) ?? 0;
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
            ref.read(goRouterProvider).push(
                "${RouteNames.rankingProfile}/${user.following?.id ?? 0}");
          },
          child: Row(
            children: [
              NetworkCircleImage(
                path: user.following?.profileUrl,
                width: 40.h,
                height: 40.h,
                showBG: true,
                bgColor: AppColors.black2,
                logoColor: AppColors.white,
                borderRadius: BorderRadius.circular(8.r),
                applyShadow: false,
              ),
              SizedBox(width: 10.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.following?.fullName.toUpperCase() ?? "",
                    style: AppTextStyles.qanelasMedium(
                      fontSize: 12.sp,
                      color: AppColors.black2,
                    ),
                  ),
                  // Text(
                  //   "${userLevel.toStringAsFixed(2)} ${getRankLabel(userLevel ?? 0)}• ${user.following?.playingSide ?? ""}",
                  //   style: AppTextStyles.qanelasRegular(
                  //     fontSize: 12.sp,
                  //     color: AppColors.black2.withOpacity(0.7),
                  //   ),
                  // ),
                ],
              ),
            ],
          ),
        ),
        const Spacer(),
        GestureDetector(
          onTap: () async {
            await _showUnfollowConfirmation(context, ref, user);
            // Refresh the following list
            ref.invalidate(getFollowingListProvider);
          },
          child: Container(
            height: 24.h,
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            decoration: BoxDecoration(
                color: AppColors.white,
                border: Border.all(color: AppColors.black2.withOpacity(0.05)),
                borderRadius: BorderRadius.circular(12.r),
                boxShadow: [kBoxShadow]),
            alignment: Alignment.center,
            child: Text(
              "UNFOLLOW".tr(context),
              style: AppTextStyles.qanelasRegular(
                fontSize: 13.sp,
                color: AppColors.black2,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _showUnfollowConfirmation(
      BuildContext context, WidgetRef ref, Following user) async {
    await showDialog(
      context: context,
      builder: (dialogContext) {
        return CustomDialog(
          color: AppColors.white,
          closeIconColor: AppColors.black2,
          child: Column(
            children: [
              Text(
                "ARE_YOU_SURE_UNFOLLOW_PLAYER".trU(context),
                textAlign: TextAlign.center,
                style: AppTextStyles.qanelasMedium(
                  fontSize: 19.sp,
                  color: AppColors.black2,
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                "UNFOLLOW_PLAYER_DESCRIPTION".tr(context),
                textAlign: TextAlign.center,
                style: AppTextStyles.qanelasRegular(
                  fontSize: 14.sp,
                  color: AppColors.black2,
                ),
              ),
              SizedBox(height: 20.h),
              GestureDetector(
                onTap: () async {
                  await _performUnfollow(context, ref, user);
                  Navigator.pop(context);
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  decoration: BoxDecoration(
                    color: AppColors.darkYellow,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "YES_UNFOLLOW".trU(context),
                    style: AppTextStyles.qanelasBold(
                      fontSize: 18.sp,
                      color: AppColors.black2,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _performUnfollow(
      BuildContext context, WidgetRef ref, Following user) async {
    try {
      final provider = unfollowFriendProvider(userId: user.following?.id ?? 0);
      await Utils.showLoadingDialog(context, provider, ref);

      if (context.mounted) {
        // Show success dialog
        await showDialog(
          context: context,
          builder: (context) {
            return CustomDialog(
              color: AppColors.white,
              closeIconColor: AppColors.black2,
              child: Column(
                children: [
                  Text(
                    "YOU_JUST_UNFOLLOWED_PLAYER".trU(context),
                    textAlign: TextAlign.center,
                    style: AppTextStyles.qanelasMedium(
                      fontSize: 16.sp,
                      color: AppColors.black2,
                    ),
                  ),
                ],
              ),
            );
          },
        );
      }
    } catch (e) {
      myPrint("Error unfollowing: $e");
    }
  }
}

class FollowPlayersDialog extends ConsumerStatefulWidget {
  const FollowPlayersDialog({super.key});

  @override
  ConsumerState<FollowPlayersDialog> createState() =>
      _FollowPlayersDialogState();
}

class _FollowPlayersDialogState extends ConsumerState<FollowPlayersDialog> {
  final TextEditingController _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  List<User> _usersList = [];
  Set<int> _followingIds = {};
  bool _isLoading = false;
  bool _isLoadingMore = false;
  String? _searchError;
  String _searchQuery = "";
  int _currentPage = 1;
  int _totalPages = 1;
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    _loadFollowingIds();
    _searchUsers();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  Future<void> _loadFollowingIds() async {
    try {
      final followingList = await ref.read(getFollowingListProvider.future);
      if (mounted) {
        setState(() {
          _followingIds = followingList.following
                  ?.map((f) => f.following?.id ?? 0)
                  .where((id) => id != 0)
                  .toSet() ??
              {};
        });
      }
    } catch (e) {
      myPrint("Error loading following ids: $e");
    }
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 100 &&
        !_isLoadingMore &&
        _currentPage < _totalPages) {
      _loadMoreUsers();
    }
  }

  void _onSearchChanged(String value) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      setState(() {
        _searchQuery = value;
        _currentPage = 1;
        _usersList.clear();
      });
      _searchUsers();
    });
  }

  Future<void> _searchUsers() async {
    if (_isLoading) return;

    setState(() {
      _isLoading = true;
      _searchError = null;
    });

    try {
      final response = await ref.read(
        searchUsersProvider(
          page: 1,
          pageSize: 20,
          search: _searchQuery,
        ).future,
      );

      if (mounted) {
        setState(() {
          _usersList = response.data?.customers ?? [];
          _totalPages = response.data?.totalPages ?? 1;
          _currentPage = 1;
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _searchError = e.toString();
          _isLoading = false;
        });
      }
    }
  }

  Future<void> _loadMoreUsers() async {
    if (_isLoadingMore || _currentPage >= _totalPages) return;

    setState(() {
      _isLoadingMore = true;
    });

    try {
      final nextPage = _currentPage + 1;
      final response = await ref.read(
        searchUsersProvider(
          page: nextPage,
          pageSize: 20,
          search: _searchQuery,
        ).future,
      );

      if (mounted) {
        setState(() {
          _usersList.addAll(response.data?.customers ?? []);
          _currentPage = nextPage;
          _isLoadingMore = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isLoadingMore = false;
        });
      }
    }
  }

  Future<void> _handleFollow(User user) async {
    final result = await showDialog<bool>(
      context: context,
      builder: (context) => _FollowConfirmationDialog(user: user),
    );

    if (result == true && mounted) {
      try {
        await Utils.showLoadingDialog(
          context,
          followFriendProvider(userId: user.id ?? 0),
          ref,
        );

        if (mounted) {
          setState(() {
            _followingIds.add(user.id ?? 0);
          });
          ref.invalidate(getFollowingListProvider);

          // Show success dialog
          await showDialog(
            context: context,
            builder: (context) => CustomDialog(
              color: AppColors.white,
              closeIconColor: AppColors.black2,
              child: Column(
                children: [
                  Text(
                    "YOU_ARE_NOW_FOLLOWING_PLAYER".trU(context),
                    textAlign: TextAlign.center,
                    style: AppTextStyles.qanelasMedium(
                      fontSize: 16.sp,
                      color: AppColors.black2,
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      } catch (e) {
        myPrint("Error following user: $e");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "FOLLOW_PLAYERS".trU(context),
          style: AppTextStyles.qanelasMedium(
            fontSize: 19.sp,
            color: AppColors.black2,
          ),
        ),
        SizedBox(height: 15.h),
        // Search field
        Container(
          decoration: BoxDecoration(
            color: AppColors.black2.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: TextField(
            controller: _searchController,
            onChanged: _onSearchChanged,
            style: AppTextStyles.qanelasRegular(
              color: AppColors.black2,
              fontSize: 13.sp,
            ),
            decoration: InputDecoration(
              prefixIcon:
                  Icon(Icons.search, color: AppColors.black50, size: 20.h),
              prefixIconConstraints:
                  BoxConstraints.tightFor(width: 35.h, height: 20.h),
              hintText: "SEARCH".tr(context),
              hintStyle: AppTextStyles.qanelasRegular(
                color: AppColors.black2.withOpacity(0.5),
                fontSize: 13.sp,
              ),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
              border: InputBorder.none,
            ),
          ),
        ),
        SizedBox(height: 15.h),
        // Loading indicator
        if (_isLoading)
          SizedBox(
            height: 100.h,
            child: const Center(
              child: CupertinoActivityIndicator(
                radius: 12,
                color: AppColors.black2,
              ),
            ),
          ),
        // Error message
        if (_searchError != null && !_isLoading)
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h),
            child: Center(
              child: Text(
                _searchError ?? "",
                style: AppTextStyles.qanelasRegular(
                  fontSize: 14.sp,
                  color: AppColors.black2,
                ),
              ),
            ),
          ),
        // Users list
        if (!_isLoading && _searchError == null) _buildUsersList(),
      ],
    );
  }

  Widget _buildUsersList() {
    if (_usersList.isEmpty) {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 20.h),
        child: Center(
          child: Text(
            "NO_USERS_FOUND".tr(context),
            style: AppTextStyles.qanelasRegular(
              fontSize: 14.sp,
              color: AppColors.black2,
            ),
          ),
        ),
      );
    }

    return Container(
      constraints: BoxConstraints(maxHeight: 350.h),
      child: ScrollbarTheme(
        data: ScrollbarThemeData(
          thumbColor: WidgetStateProperty.all(AppColors.darkGray50),
          trackColor: WidgetStateProperty.all(AppColors.white),
          trackBorderColor: WidgetStateProperty.all(Colors.transparent),
          thickness: WidgetStateProperty.all(8),
          radius: Radius.circular(4.r),
        ),
        child: Scrollbar(
          controller: _scrollController,
          interactive: true,
          trackVisibility: true,
          thumbVisibility: true,
          child: ListView.separated(
            shrinkWrap: true,
            controller: _scrollController,
            padding: EdgeInsets.only(right: 15.w),
            itemCount: _usersList.length + (_isLoadingMore ? 1 : 0),
            separatorBuilder: (context, index) => SizedBox(height: 12.h),
            itemBuilder: (context, index) {
              if (index == _usersList.length) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  child: const Center(
                    child: CupertinoActivityIndicator(
                      radius: 10,
                      color: AppColors.black2,
                    ),
                  ),
                );
              }
              final user = _usersList[index];
              final isFollowing = _followingIds.contains(user.id);
              return _FollowPlayerItem(
                user: user,
                isFollowing: isFollowing,
                onFollow: () => _handleFollow(user),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _FollowPlayerItem extends StatelessWidget {
  final User user;
  final bool isFollowing;
  final VoidCallback onFollow;

  const _FollowPlayerItem({
    required this.user,
    required this.isFollowing,
    required this.onFollow,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        NetworkCircleImage(
          path: user.profileUrl,
          width: 40.h,
          height: 40.h,
          showBG: true,
          bgColor: AppColors.black2,
          logoColor: AppColors.white,
          borderRadius: BorderRadius.circular(8.r),
          applyShadow: false,
        ),
        SizedBox(width: 10.w),
        Expanded(
          child: Text(
            user.fullName.toUpperCase(),
            style: AppTextStyles.qanelasMedium(
              fontSize: 12.sp,
              color: AppColors.black2,
            ),
          ),
        ),
        GestureDetector(
          onTap: isFollowing ? null : onFollow,
          child: Container(
            height: 24.h,
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            decoration: BoxDecoration(
              color: isFollowing
                  ? AppColors.black2.withOpacity(0.1)
                  : AppColors.white,
              border: Border.all(color: AppColors.black2.withOpacity(0.05)),
              borderRadius: BorderRadius.circular(12.r),
              boxShadow: isFollowing ? null : [kBoxShadow],
            ),
            alignment: Alignment.center,
            child: Text(
              isFollowing ? "FOLLOWING".tr(context) : "FOLLOW".tr(context),
              style: AppTextStyles.qanelasRegular(
                fontSize: 13.sp,
                color: isFollowing
                    ? AppColors.black2.withOpacity(0.5)
                    : AppColors.black2,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _FollowConfirmationDialog extends StatelessWidget {
  final User user;

  const _FollowConfirmationDialog({required this.user});

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      color: AppColors.white,
      closeIconColor: AppColors.black2,
      child: Column(
        children: [
          Text(
            "ARE_YOU_SURE_FOLLOW_PLAYER".trU(context),
            textAlign: TextAlign.center,
            style: AppTextStyles.qanelasMedium(
              fontSize: 19.sp,
              color: AppColors.black2,
            ),
          ),
          SizedBox(height: 10.h),
          Text(
            "FOLLOW_PLAYER_DESCRIPTION".tr(context),
            textAlign: TextAlign.center,
            style: AppTextStyles.qanelasRegular(
              fontSize: 14.sp,
              color: AppColors.black2,
            ),
          ),
          SizedBox(height: 20.h),
          GestureDetector(
            onTap: () {
              Navigator.pop(context, true);
            },
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 12.h),
              decoration: BoxDecoration(
                color: AppColors.darkYellow,
                borderRadius: BorderRadius.circular(12.r),
              ),
              alignment: Alignment.center,
              child: Text(
                "YES_FOLLOW".trU(context),
                style: AppTextStyles.qanelasBold(
                  fontSize: 18.sp,
                  color: AppColors.black2,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
