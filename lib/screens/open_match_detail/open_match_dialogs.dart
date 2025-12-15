part of 'open_match_detail.dart';

class OpenMatchChooseSpotDialog extends StatelessWidget {
  const OpenMatchChooseSpotDialog({super.key, required this.players});

  final List<BookingPlayerBase> players;

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
        // contentPadding: EdgeInsets.symmetric(horizontal: 23.w, vertical: 30.h),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.w,),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "CHOOSE_YOUR_SPOT".trU(context),
                style: AppTextStyles.popupHeaderTextStyle,
              ),
              SizedBox(height: 20.h),
              OpenMatchParticipantRowWithBG(
                textForAvailableSlot: "RESERVE".trU(context),
                players: players,
                backgroundColor: AppColors.gray,
                textColor: AppColors.black2,
                slotBackgroundColor: AppColors.darkYellow80,
                imageBgColor: AppColors.white,
                imageLogoColor: AppColors.black2,
                onTap: (index, playerID) {
                  Navigator.pop(context, (index, playerID));
                },
              ),
            ],
          ),
        ));
  }
}

class _WaitingForApprovalDialog extends ConsumerStatefulWidget {
  const _WaitingForApprovalDialog({required this.serviceID});

  final int serviceID;

  @override
  ConsumerState<_WaitingForApprovalDialog> createState() =>
      _WaitingForApprovalDialogState();
}

class _WaitingForApprovalDialogState
    extends ConsumerState<_WaitingForApprovalDialog> {
  @override
  Widget build(BuildContext context) {
    final provider = ref.watch(fetchServiceWaitingPlayersProvider(
        widget.serviceID, RequestServiceType.booking));
    return CustomDialog(
      contentPadding: EdgeInsets.fromLTRB(20.w, 15.h, 20.w, 45.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "YOU_ARE_NOW_WAITING_FOR_APPROVAL".trU(context),
            style: AppTextStyles.popupHeaderTextStyle,
            textAlign: TextAlign.center,
          ),
          provider.when(
            data: (data) {
              final currentPlayerID = ref.read(userProvider)?.user?.id;
              data.removeWhere(
                  (element) => element.customer?.id == currentPlayerID);
              if (data.isEmpty) {
                return Container();
              }
              return Column(
                children: [
                  SizedBox(height: 5.h),
                  Text(
                    "HERE_ARE_OTHER_PLAYERS_WAITING_FOR_APPROVAL".tr(context),
                    textAlign: TextAlign.center,
                    style: AppTextStyles.popupBodyTextStyle.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                  Row(
                    children: [
                      for (int i = 0; i < min(data.length, 4); i++) ...[
                        Column(
                          children: [
                            NetworkCircleImage(
                                path: data[i].customer?.profileUrl,
                                width: 40.w,
                                height: 40.w),
                            Text(
                              data[i].getCustomerName,
                              style: AppTextStyles.poppinsBold(),
                            ),
                            Text(
                              "${data[i].customer?.level(getSportsName(ref))}",
                              // •  Right",
                              style: AppTextStyles.poppinsBold(
                                height: 0.9,
                              ),
                            ),
                          ],
                        )
                      ]
                    ],
                  ),
                  SizedBox(height: 20.h),
                ],
              );
            },
            error: (error, stackTrace) => Container(),
            loading: () => Container(),
          ),
        ],
      ),
    );
  }
}

enum ConfirmationDialogType {
  join,
  reserve,
  leave,
  cancel,
  approvalNeeded,
  approveConfirm,
  releaseReserve,
  withdraw,
}

class ConfirmationDialog extends StatelessWidget {
  const ConfirmationDialog(
      {super.key, required this.type, this.boldPosition, this.policy});

  final ConfirmationDialogType type;
  final int? boldPosition;
  final CancellationPolicy? policy;

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 5.h,
          ),
          Text(
            _headingText(context),
            style: AppTextStyles.popupHeaderTextStyle,
            textAlign: TextAlign.center,
          ),
          if (type != ConfirmationDialogType.withdraw) ...[
            SizedBox(height: 20.h),
            Text(_descText(context),
                textAlign: TextAlign.center,
                style: AppTextStyles.popupBodyTextStyle,),
          ],
          if (type == ConfirmationDialogType.join ||
              type == ConfirmationDialogType.leave ||
              type == ConfirmationDialogType.cancel) ...[
            RefundDescriptionComponent(
                policy: policy,
                text: type == ConfirmationDialogType.join
                    ? "CANCELLATION_POLICY".tr(context)
                    : null,
                style: AppTextStyles.popupBodyTextStyle,)
          ],
          SizedBox(height: 20.h),
          MainButton(
            isForPopup: true,
            // color: AppColors.rosewood,
            label: _buttonText(context).toString().toUpperCase(),
            // child: Text(
            //   _buttonText(context).toString().toUpperCase(),
            //   style: AppTextStyles.gothicRegular(fontSize: 19.sp, color: AppColors.white, letterSpacing: 1.2),
            // ),
            // labelStyle: AppTextStyles.qanelasRegular(
            //     fontSize: 19.sp,
            //     color: AppColors.white,
            //     letterSpacing: 19.sp * 0.12),
            onTap: () {
              Navigator.pop(context, true);
            },
          )
        ],
      ),
    );
  }

  _headingText(BuildContext context) {
    switch (type) {
      case ConfirmationDialogType.cancel:
        return "ARE_YOU_SURE_YOU_WANT_TO_CANCEL_THIS_MATCH".trU(context);
      case ConfirmationDialogType.join:
        return "ARE_YOU_SURE_YOU_WANT_TO_JOIN_THE_MATCH".trU(context);
      case ConfirmationDialogType.reserve:
        return "ARE_YOU_SURE_YOU_WANT_TO_RESERVE_THIS_SPOT".trU(context);
      case ConfirmationDialogType.leave:
        return "ARE_YOU_SURE_YOU_WANT_TO_LEAVE_THIS_OPEN_MATCH".trU(context);
      case ConfirmationDialogType.approvalNeeded:
        return "NEEDS_ORGANIZER_APPROVAL".trU(context);
      case ConfirmationDialogType.approveConfirm:
        return "ARE_YOU_SURE_YOU_WANT_TO_APPROVE_THIS_PLAYER".trU(context);
      case ConfirmationDialogType.releaseReserve:
        return "ARE_YOU_SURE_YOU_WANT_TO_RELEASE_THIS_RESERVE".trU(context);
      case ConfirmationDialogType.withdraw:
        return "ARE_YOU_SURE_YOU_WANT_TO_WITHDRAW_FROM_THE_MATCH".trU(context);
    }
  }

  _buttonText(BuildContext context) {
    switch (type) {
      case ConfirmationDialogType.cancel:
        return "CANCEL_MATCH".tr(context);
      case ConfirmationDialogType.join:
        return "JOIN_PAY_MY_SHARE".tr(context);
      case ConfirmationDialogType.reserve:
        return "RESERVE_PAY_SLOT".tr(context);
      case ConfirmationDialogType.leave:
        return "LEAVE_OPEN_MATCH".tr(context);
      case ConfirmationDialogType.approvalNeeded:
        return "APPLY_TO_OPEN_MATCH".tr(context);
      case ConfirmationDialogType.approveConfirm:
        return "APPROVE_PLAYER".tr(context);
      case ConfirmationDialogType.releaseReserve:
        return "YES_RELEASE_THIS_SPOT".tr(context);
      case ConfirmationDialogType.withdraw:
        return "YES_WITHDRAW".tr(context);
    }
  }

  _descText(BuildContext context) {
    switch (type) {
      case ConfirmationDialogType.join:
        return "IF_YOU_JOIN_DESC".tr(context);
      case ConfirmationDialogType.leave:
        return "IF_YOU_LEAVE_DESC".tr(context);
      case ConfirmationDialogType.cancel:
        return "IF_YOU_CANCEL_DESC".tr(context);
      case ConfirmationDialogType.approvalNeeded:
        return "NEEDS_ORGANIZER_APPROVAL_DESC".tr(context);
      case ConfirmationDialogType.approveConfirm:
      case ConfirmationDialogType.releaseReserve:
        return "RELEASE_THIS_SPOT_BEFORE_24_HOUR".tr(context);
      case ConfirmationDialogType.reserve:
        return "YOU_WONT_BE_ABLE_TO_EDIT_THIS_LATER".tr(context);
      case ConfirmationDialogType.withdraw:
        return "";
    }
  }
}

class _AddPlayerToWaitingListDialog extends ConsumerStatefulWidget {
  const _AddPlayerToWaitingListDialog({
    required this.serviceId,
    required this.players,
  });

  final int serviceId;
  final List<BookingPlayerBase> players;

  @override
  ConsumerState<_AddPlayerToWaitingListDialog> createState() =>
      _AddPlayerToWaitingListDialogState();
}

class _AddPlayerToWaitingListDialogState
    extends ConsumerState<_AddPlayerToWaitingListDialog> {
  final TextEditingController searchController = TextEditingController();
  final ScrollController scrollController = ScrollController();
  final Debouncer _debouncer = Debouncer(duration: const Duration(milliseconds: 500));

  String searchQuery = '';
  List<User> usersList = [];
  bool isLoading = true;
  bool isLoadingMore = false;
  int currentPage = 1;
  bool hasMore = false;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(_onScroll);
    _loadInitialUsers();
  }

  Future<void> _loadInitialUsers() async {
    setState(() {
      isLoading = true;
    });

    try {
      final response = await ref.read(searchUsersProvider(
        page: 1,
        pageSize: kUserSearchPageSize,
        search: '',
      ).future);

      if (mounted) {
        setState(() {
          usersList = response.data?.customers ?? [];
          currentPage = response.data?.currentPage ?? 1;
          hasMore = (response.data?.currentPage ?? 0) < (response.data?.totalPages ?? 0);
          isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          usersList = [];
          isLoading = false;
        });
      }
    }
  }

  @override
  void dispose() {
    searchController.dispose();
    scrollController.dispose();
    _debouncer.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (scrollController.position.pixels >= scrollController.position.maxScrollExtent - 200) {
      _loadMoreResults();
    }
  }

  Future<void> _performSearch(String query) async {
    if (query.isEmpty) {
      setState(() {
        searchQuery = '';
      });
      _loadInitialUsers();
      return;
    }

    setState(() {
      searchQuery = query;
      currentPage = 1;
      isLoading = true;
    });

    try {
      final response = await ref.read(searchUsersProvider(
        page: 1,
        pageSize: kUserSearchPageSize,
        search: query,
      ).future);

      if (mounted) {
        setState(() {
          usersList = response.data?.customers ?? [];
          currentPage = response.data?.currentPage ?? 1;
          hasMore = (response.data?.currentPage ?? 0) < (response.data?.totalPages ?? 0);
          isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          usersList = [];
          isLoading = false;
        });
      }
    }
  }

  Future<void> _loadMoreResults() async {
    if (!hasMore || isLoadingMore) return;

    setState(() {
      isLoadingMore = true;
    });

    try {
      final response = await ref.read(searchUsersProvider(
        page: currentPage + 1,
        pageSize: kUserSearchPageSize,
        search: searchQuery,
      ).future);

      if (mounted) {
        setState(() {
          usersList = [...usersList, ...(response.data?.customers ?? [])];
          currentPage = response.data?.currentPage ?? currentPage;
          hasMore = (response.data?.currentPage ?? 0) < (response.data?.totalPages ?? 0);
          isLoadingMore = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          isLoadingMore = false;
        });
      }
    }
  }

  Future<void> _handleAddPlayer(User user) async {
    // Show confirmation dialog
    final bool? confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => CustomDialog(
        color: AppColors.white,
        closeIconColor: AppColors.black2,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "ARE_YOU_SURE".trU(context),
              style: AppTextStyles.poppinsMedium(
                fontSize: 19.sp,
                color: AppColors.black2,
              ),
            ),
            SizedBox(height: 15.h),
            Text(
              "DO_YOU_WANT_TO_ADD_PLAYER_TO_WAITING_LIST".tr(context, params: {
                "PLAYER_NAME": user.fullName
              }),
              textAlign: TextAlign.center,
              style: AppTextStyles.poppinsRegular(
                fontSize: 15.sp,
                color: AppColors.black2,
              ),
            ),
            SizedBox(height: 20.h),
            MainButton(
              label: "YES".trU(context),
              isForPopup: true,
              onTap: () {
                Navigator.pop(context, true);
              },
            ),
          ],
        ),
      ),
    );

    if (confirmed != true || !mounted) {
      return;
    }

    // Show position selection dialog
    final result = await showDialog<(int, int?)>(
      context: context,
      builder: (context) {
        return CustomDialog(
          color: AppColors.white,
          closeIconColor: AppColors.black2,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "CHOOSE_YOUR_SPOT".trU(context),
                  style: AppTextStyles.poppinsMedium(
                    fontSize: 19.sp,
                    color: AppColors.black2,
                  ),
                ),
                SizedBox(height: 20.h),
                OpenMatchParticipantRowWithBG(
                  textForAvailableSlot: "SELECT".trU(context),
                  players: widget.players,
                  allowTap: false,
                  backgroundColor: AppColors.black25,
                  textColor: AppColors.black2,
                  slotBackgroundColor: AppColors.black2,
                  imageBgColor: AppColors.white,
                  imageLogoColor: AppColors.black2,
                  slotIconColor: AppColors.white,
                  onTap: (index, playerID) {
                    Navigator.pop(context, (index, playerID));
                  },
                ),
              ],
            ),
          ),
        );
      },
    );

    if (result == null || !mounted) {
      return;
    }

    final (int selectedIndex, int? otherPlayerID) = result;
    final position = selectedIndex + 1;

    // Call API to add player to waiting list
    final customerPlayers = [
      {
        "customer_id": user.id,
        "position": position,
      }
    ];

    final provider = addPlayersToWaitingListProvider(
      serviceId: widget.serviceId,
      customerPlayers: customerPlayers,
    );

    final bool? success =
        await Utils.showLoadingDialog(context, provider, ref);

    if (success == true && mounted) {
      // Refresh the waiting list
      ref.invalidate(fetchServiceWaitingPlayersProvider(
          widget.serviceId, RequestServiceType.booking));

      // Close the dialog
      Navigator.pop(context);

      // Show success message
      Utils.showMessageDialog(
        context,
        "PLAYER_ADDED_TO_WAITING_LIST_SUCCESSFULLY".tr(context),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final followingList = ref.watch(getFollowingListProvider);
    final followingIds = followingList.valueOrNull?.following
        ?.map((f) => f.following?.id)
        .whereType<int>()
        .toSet() ?? <int>{};

    return CustomDialog(
      color: AppColors.white,
      closeIconColor: AppColors.black2,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "ADD_PLAYERS".trU(context),
            style: AppTextStyles.poppinsMedium(
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
            child: SecondaryTextField(
              prefixIconConstraints:
                  BoxConstraints.tightFor(width: 25.h, height: 12.h),
              prefixIcon: Icon(Icons.search, color: AppColors.black50),
              controller: searchController,
              hintText: "SEARCH".tr(context),
              style: AppTextStyles.poppinsRegular(
                color: AppColors.black2,
                fontSize: 13.sp,
              ),
              hintTextStyle: AppTextStyles.poppinsRegular(
                color: AppColors.black2,
                fontSize: 13.sp,
              ),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
              borderColor: AppColors.transparentColor,
              onChanged: (value) {
                _debouncer.run(() {
                  _performSearch(value);
                });
              },
            ),
          ),
          SizedBox(height: 15.h),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              searchQuery.isEmpty ? "ALL_USERS".tr(context) : "SEARCH_RESULTS".tr(context),
              style: AppTextStyles.poppinsMedium(
                fontSize: 16.sp,
                color: AppColors.black2,
              ),
            ),
          ),
          SizedBox(height: 10.h),

          _buildUsersList(followingIds),
        ],
      ),
    );
  }

  Widget _buildUsersList(Set<int> followingIds) {
    if (isLoading && usersList.isEmpty) {
      return SizedBox(
        height: 100.h,
        child: const Center(
          child: CupertinoActivityIndicator(
            radius: 12,
            color: AppColors.black2,
          ),
        ),
      );
    }

    if (usersList.isEmpty) {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 20.h),
        child: Text(
          "NO_RESULTS_FOUND".tr(context),
          style: AppTextStyles.poppinsRegular(
            fontSize: 14.sp,
            color: AppColors.black2,
          ),
        ),
      );
    }

    return Container(
      constraints: BoxConstraints(maxHeight: 300.h),
      child: ScrollbarTheme(
        data: ScrollbarThemeData(
          thumbColor: WidgetStateProperty.all(AppColors.darkGray50),
          trackColor: WidgetStateProperty.all(AppColors.white),
          trackBorderColor: WidgetStateProperty.all(Colors.transparent),
          thickness: WidgetStateProperty.all(8),
          radius: Radius.circular(4.r),
        ),
        child: Scrollbar(
          controller: scrollController,
          interactive: true,
          trackVisibility: true,
          thumbVisibility: true,
          child: ListView.separated(
            shrinkWrap: true,
            controller: scrollController,
            padding: EdgeInsets.only(right: 15.w),
            itemCount: usersList.length + (hasMore ? 1 : 0),
            separatorBuilder: (context, index) => SizedBox(height: 12.h),
            itemBuilder: (context, index) {
              if (index == usersList.length) {
                return SizedBox(
                  height: 40.h,
                  child: const Center(
                    child: CupertinoActivityIndicator(
                      radius: 12,
                      color: AppColors.black2,
                    ),
                  ),
                );
              }
              final user = usersList[index];
              final isFollowing = followingIds.contains(user.id);
              return _UserItemForWaitingList(
                user: user,
                serviceId: widget.serviceId,
                isFollowing: isFollowing,
                onTap: () => _handleAddPlayer(user),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _UserItemForWaitingList extends ConsumerWidget {
  final User user;
  final VoidCallback? onTap;
  final int serviceId;
  final bool isFollowing;

  const _UserItemForWaitingList({
    required this.user,
    required this.onTap,
    required this.serviceId,
    this.isFollowing = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final waitingListData = ref.watch(fetchServiceWaitingPlayersProvider(
        serviceId, RequestServiceType.booking));

    // Check if the player is already in the waiting list
    bool isPlayerInWaitingList = false;

    if (waitingListData.hasValue && waitingListData.value is List<ServiceWaitingPlayers>) {
      final data = waitingListData.value as List<ServiceWaitingPlayers>;
      isPlayerInWaitingList = data.any(
        (player) => player.customer?.id == user.id,
      );
    }

    return InkWell(
      onTap: isPlayerInWaitingList ? null : onTap,
      child: Row(
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  user.fullName.toUpperCase(),
                  style: AppTextStyles.poppinsMedium(
                    fontSize: 12.sp,
                    color: AppColors.black2,
                  ),
                ),
                if (isFollowing) ...[
                  SizedBox(height: 2.h),
                  Text(
                    "FOLLOWING".tr(context),
                    style: AppTextStyles.poppinsRegular(
                      fontSize: 10.sp,
                      color: AppColors.black50,
                    ),
                  ),
                ],
              ],
            ),
          ),
          Container(
            height: 24.h,
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            decoration: BoxDecoration(
              color: isPlayerInWaitingList
                  ? AppColors.black25
                  : AppColors.darkYellow,
              borderRadius: BorderRadius.circular(12.r),
              boxShadow: [kBoxShadow],
            ),
            alignment: Alignment.center,
            child: Text(
              isPlayerInWaitingList
                  ? "ADDED".trU(context)
                  : "ADD".trU(context),
              style: AppTextStyles.poppinsRegular(
                fontSize: 13.sp,
                color: AppColors.black2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
