part of 'book_court_dialog.dart';

class _OpenMatch extends ConsumerStatefulWidget {
  final bool allowAddPlayer;

  const _OpenMatch({required this.allowAddPlayer});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => __OpenMatchState();
}

class __OpenMatchState extends ConsumerState<_OpenMatch> {
  final TextEditingController leaveNoteController = TextEditingController();
  final FocusNode leaveNoteNode = FocusNode();

  @override
  void initState() {
    Future(() {
      _setupForOpenMatch();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final isFriedlyMatch = ref.watch(_isFriendlyMatchProvider);
    final isPrivateMatch = ref.watch(_isPrivateMatchProvider);
    // final isDUPRMatch = ref.watch(_isDUPRMatchProvider);
    final appovePlayers = ref.watch(_isApprovePlayersProvider);
    final matchLevel = ref.watch(_matchLevelProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // HIDDEN: Approve players - always enabled by default
        // InkWell(
        //   onTap: () {
        //     ref.read(_isApprovePlayersProvider.notifier).state = !appovePlayers;
        //   },
        //   child: Container(
        //     decoration: BoxDecoration(
        //       color: appovePlayers ? AppColors.darkYellow50 : AppColors.black25,
        //       borderRadius: BorderRadius.circular(12.r),
        //     ),
        //     child: Padding(
        //       padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        //       child: Row(
        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //         children: [
        //           Text(
        //             "APPROVE_PLAYERS_BEFORE_JOIN".tr(context),
        //             style: AppTextStyles.qanelasSemiBold(
        //                 color:
        //                     appovePlayers ? AppColors.black2 : AppColors.black2,
        //                 fontSize: 13.sp),
        //           ),
        //           SelectedTag(
        //             isSelected: appovePlayers,
        //             unSelectedBorderColor: AppColors.white,
        //             unSelectedColor: Colors.transparent,
        //             shape: BoxShape.circle,
        //             selectedColor: AppColors.darkYellow,
        //             selectedBorderColor: AppColors.black25,
        //           )
        //         ],
        //       ),
        //     ),
        //   ),
        // ),

        // HIDDEN: Friendly Match - always ranked (not friendly)
        // InkWell(
        //   onTap: () {
        //     ref.read(_isFriendlyMatchProvider.notifier).state = !isFriedlyMatch;
        //   },
        //   child: Container(
        //     decoration: BoxDecoration(
        //       color:
        //           isFriedlyMatch ? AppColors.darkYellow50 : AppColors.black25,
        //       borderRadius: BorderRadius.circular(12.r),
        //     ),
        //     child: Padding(
        //         padding:
        //             const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        //         child: Row(
        //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //           children: [
        //             Text(
        //               "FRIENDLY_MATCH".tr(context),
        //               style: AppTextStyles.qanelasSemiBold(
        //                   color: isFriedlyMatch
        //                       ? AppColors.black2
        //                       : AppColors.black2,
        //                   fontSize: 13.sp),
        //             ),
        //             SelectedTag(
        //               isSelected: isFriedlyMatch,
        //               unSelectedBorderColor: AppColors.white,
        //               unSelectedColor: Colors.transparent,
        //               shape: BoxShape.circle,
        //               selectedColor: AppColors.darkYellow,
        //               selectedBorderColor: AppColors.black25,
        //             )
        //           ],
        //         )),
        //   ),
        // ),

        // Match level selector - HIDDEN
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     Text(
        //       "SELECT_MATCH_LEVEL".tr(context),
        //       style: AppTextStyles.qanelasMedium(
        //           color: AppColors.black2, fontSize: 16.sp),
        //     ),
        //     Text(
        //       matchLevel.isNotEmpty
        //           ? "${matchLevel.first.toStringAsFixed(2)} - ${matchLevel.last.toStringAsFixed(2)}"
        //           : "0.00 - 7.00",
        //       style: AppTextStyles.qanelasMedium(
        //           color: AppColors.black2, fontSize: 16.sp),
        //     ),
        //   ],
        // ),
        // SizedBox(height: 10.h),
        // // Range Slider for match level
        // SliderTheme(
        //   data: SliderThemeData(
        //     activeTrackColor: AppColors.darkYellow,
        //     inactiveTrackColor: AppColors.black25,
        //     thumbColor: AppColors.darkYellow,
        //     overlayColor: AppColors.darkYellow.withOpacity(0.2),
        //     trackHeight: 4.h,
        //     thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10.h),
        //     overlayShape: RoundSliderOverlayShape(overlayRadius: 20.h),
        //   ),
        //   child: RangeSlider(
        //     values: RangeValues(
        //       matchLevel.isNotEmpty ? matchLevel.first : 0.0,
        //       matchLevel.isNotEmpty ? matchLevel.last : 7.0,
        //     ),
        //     min: 0.0,
        //     max: 7.0,
        //     divisions: 140, // 7.0 * 20 = 140 divisions for 0.05 increments
        //     onChanged: (RangeValues values) {
        //       setState(() {
        //         ref.read(_matchLevelProvider.notifier).state = [
        //           values.start,
        //           values.end,
        //         ];
        //       });
        //     },
        //   ),
        // ),
        // SizedBox(height: 15.h),

        if (widget.allowAddPlayer) ...[
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Text(
                  "ARE_YOU_GOING_WITH_SOMEONE_ELSE".tr(context),
                  style: AppTextStyles.poppinsMedium(
                      color: AppColors.black2, fontSize: 15.sp),
                ),
              ),
              Text(
                " ${"OPTIONAL".tr(context).toLowerCase()}",
                style: AppTextStyles.poppinsRegular(
                    color: AppColors.black2, fontSize: 13.sp),
              ),
            ],
          ),
          SizedBox(height: 5.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: OpenMatchParticipantRowWithBG(
                  allowTap: false,
                  textForAvailableSlot: "ADD".trU(context),
                  players: _buildPlayersList(),
                  backgroundColor: AppColors.gray,
                  imageBgColor: AppColors.black2,
                  onTap: (slotIndex, otherPlayerID) async {
                    await _showPlayerSelectionDialog(context, slotIndex);
                  },
                  showReserveReleaseButton: true,
                  alreadyReserved: true,
                  currentPlayerID: ref.read(userProvider)?.user?.id ?? -1,
                  onRelease: (playerID) {
                    _handleRemovePlayer(playerID);
                  },
                  maxPlayers: 4,
                ),
              ),
            ],
          ),
          SizedBox(height: 15.h),
        ],
      ],
    );
  }

  void _handleRemovePlayer(int playerID) {
    final currentPlayers = ref.read(_selectedPlayersProvider);

    // Remove the player with matching ID
    final updatedPlayers =
        currentPlayers.where((p) => p.id != playerID).toList();

    // Update state
    ref.read(_selectedPlayersProvider.notifier).state = updatedPlayers;

    // Refresh UI
    setState(() {});
  }

  List<BookingPlayerBase> _buildPlayersList() {
    final currentUser = ref.watch(userProvider)?.user;
    final selectedPlayers = ref.watch(_selectedPlayersProvider);

    final List<BookingPlayerBase> playersList = [];

    // Always add current user in first position
    if (currentUser != null) {
      final currentUserPlayer = BookingPlayerBase(
        id: currentUser.id,
        customer: BookingCustomerBase(
          id: currentUser.id,
          firstName: currentUser.firstName,
          lastName: currentUser.lastName,
          profileUrl: currentUser.profileUrl,
        ),
        position: 1,
        isOrganizer: true,
      );
      playersList.add(currentUserPlayer);
    }

    // Add selected players in subsequent positions
    for (var i = 0; i < selectedPlayers.length; i++) {
      final player = selectedPlayers[i];
      playersList.add(player);
    }

    return playersList;
  }

  Future<void> _showPlayerSelectionDialog(
      BuildContext context, int slotIndex) async {
    await showDialog(
      context: context,
      builder: (context) => _AddPlayersDialog(
        currentPlayersList: _buildPlayersList(),
      ),
    );
  }

  void _setupForOpenMatch() {
    final userLevel =
        ref.read(userProvider)?.user?.level(getSportsName(ref)) ?? 0.0;
    List<double> matchLevelToShowIn = [userLevel];
    if (userLevel > 0) {
      matchLevelToShowIn.add(userLevel - 0.5);
    }
    if (userLevel < 7.0) {
      matchLevelToShowIn.add(userLevel + 0.5);
    }
    matchLevelToShowIn.sort();
    ref.read(_matchLevelProvider.notifier).state = matchLevelToShowIn;
  }
}

class _AddPlayersDialog extends ConsumerStatefulWidget {
  const _AddPlayersDialog({required this.currentPlayersList});

  final List<BookingPlayerBase> currentPlayersList;

  @override
  ConsumerState<_AddPlayersDialog> createState() => _AddPlayersDialogState();
}

class _AddPlayersDialogState extends ConsumerState<_AddPlayersDialog> {
  final TextEditingController searchController = TextEditingController();
  final ScrollController scrollController = ScrollController();
  final Debouncer _debouncer = Debouncer(duration: const Duration(milliseconds: 500));

  String searchQuery = '';
  List<User> usersList = [];
  bool isLoading = true;
  bool isLoadingMore = false;
  String? searchError;
  int currentPage = 1;
  int totalPages = 1;
  bool hasMoreResults = false;

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
        pageSize: 30,
        search: '',
      ).future);

      if (mounted) {
        setState(() {
          usersList = response.data?.customers ?? [];
          currentPage = response.data?.currentPage ?? 1;
          totalPages = response.data?.totalPages ?? 1;
          hasMoreResults = currentPage < totalPages;
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
    scrollController.removeListener(_onScroll);
    searchController.dispose();
    scrollController.dispose();
    _debouncer.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (scrollController.position.pixels >=
        scrollController.position.maxScrollExtent - 100) {
      if (hasMoreResults && !isLoadingMore && !isLoading) {
        _loadMoreResults();
      }
    }
  }

  Future<void> _loadMoreResults() async {
    if (currentPage >= totalPages) return;

    setState(() {
      isLoadingMore = true;
    });

    try {
      final nextPage = currentPage + 1;
      final response = await ref.read(searchUsersProvider(
        page: nextPage,
        pageSize: 30,
        search: searchQuery,
      ).future);

      if (mounted && response.data?.customers != null) {
        setState(() {
          usersList.addAll(response.data!.customers!);
          currentPage = nextPage;
          totalPages = response.data?.totalPages ?? 1;
          hasMoreResults = currentPage < totalPages;
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

  void _onSearchChanged(String value) {
    setState(() {
      searchQuery = value.toLowerCase();
    });

    if (value.isEmpty) {
      _loadInitialUsers();
      return;
    }

    setState(() {
      isLoading = true;
      searchError = null;
    });

    _debouncer.run(() {
      _performSearch(value);
    });
  }

  Future<void> _performSearch(String query) async {
    if (query.isEmpty) return;

    try {
      final response = await ref.read(searchUsersProvider(
        page: 1,
        pageSize: 30,
        search: query,
      ).future);

      if (mounted) {
        setState(() {
          usersList = response.data?.customers ?? [];
          currentPage = response.data?.currentPage ?? 1;
          totalPages = response.data?.totalPages ?? 1;
          hasMoreResults = currentPage < totalPages;
          isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          searchError = e.toString();
          isLoading = false;
        });
      }
    }
  }

  void _handleRemovePlayer(int playerID) {
    final currentPlayers = ref.read(_selectedPlayersProvider);

    // Remove the player with matching ID
    final updatedPlayers =
        currentPlayers.where((p) => p.id != playerID).toList();

    // Update state
    ref.read(_selectedPlayersProvider.notifier).state = updatedPlayers;

    // Refresh UI
    setState(() {});
  }

  List<BookingPlayerBase> _buildCurrentPlayersList() {
    final currentUser = ref.watch(userProvider)?.user;
    final selectedPlayers = ref.watch(_selectedPlayersProvider);

    final List<BookingPlayerBase> playersList = [];

    // Always add current user in first position
    if (currentUser != null) {
      final currentUserPlayer = BookingPlayerBase(
        id: currentUser.id,
        customer: BookingCustomerBase(
          id: currentUser.id,
          firstName: currentUser.firstName,
          lastName: currentUser.lastName,
          profileUrl: currentUser.profileUrl,
        ),
        position: 1,
        isOrganizer: true,
      );
      playersList.add(currentUserPlayer);
    }

    // Add selected players - preserve their selected positions
    for (var i = 0; i < selectedPlayers.length; i++) {
      final player = selectedPlayers[i];
      // Don't overwrite position - keep the user's selected position
      playersList.add(player);
    }

    return playersList;
  }

  @override
  Widget build(BuildContext context) {
    final followingList = ref.watch(getFollowingListProvider);
    final followingIds = followingList.valueOrNull?.following
        ?.map((f) => f.following?.id)
        .whereType<int>()
        .toSet() ?? <int>{};
    final currentPlayers = ref.watch(_selectedPlayersProvider);
    final displayPlayersList = _buildCurrentPlayersList();

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

          SizedBox(height: 8.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.w),
            child: OpenMatchParticipantRowWithBG(
              textForAvailableSlot: "AVAILABLE".trU(context),
              players: displayPlayersList,
              backgroundColor: AppColors.gray,
              textColor: AppColors.black2,
              imageBgColor: AppColors.white,
              imageLogoColor: AppColors.black2,
              allowTap: false,
              showReserveReleaseButton: true,
              alreadyReserved: true,
              currentPlayerID: ref.read(userProvider)?.user?.id ?? -1,
              onRelease: (playerID) {
                _handleRemovePlayer(playerID);
              },
            ),
          ),
          SizedBox(height: 10.h),
          // Search field section
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
              onChanged: _onSearchChanged,
            ),
          ),
          SizedBox(height: 15.h),
          // Show loading indicator
          if (isLoading)
            SizedBox(
              height: 100.h,
              child: const Center(
                child: CupertinoActivityIndicator(
                  radius: 12,
                  color: AppColors.black2,
                ),
              ),
            ),
          // Show search error if any
          if (searchError != null && !isLoading)
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h),
              child: Center(
                child: Text(
                  searchError ?? "",
                  style: AppTextStyles.poppinsRegular(
                    fontSize: 14.sp,
                    color: AppColors.black2,
                  ),
                ),
              ),
            ),
          // Show users list
          if (!isLoading && searchError == null)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  searchQuery.isEmpty ? "ALL_USERS".tr(context) : "SEARCH_RESULTS".tr(context),
                  style: AppTextStyles.poppinsMedium(
                    fontSize: 16.sp,
                    color: AppColors.black2,
                  ),
                ),
                SizedBox(height: 10.h),
                _buildUsersList(currentPlayers, followingIds),
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildUsersList(List<BookingPlayerBase> currentPlayers, Set<int> followingIds) {
    if (usersList.isEmpty) {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 20.h),
        child: Center(
          child: Text(
            "NO_USERS_FOUND".tr(context),
            style: AppTextStyles.poppinsRegular(
              fontSize: 14.sp,
              color: AppColors.black2,
            ),
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
            itemCount: usersList.length + (isLoadingMore ? 1 : 0),
            separatorBuilder: (context, index) => SizedBox(height: 12.h),
            itemBuilder: (context, index) {
              if (index == usersList.length) {
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
              final user = usersList[index];
              final isAlreadyAdded = currentPlayers.any(
                (p) => p.customer?.id == user.id,
              );
              final isFollowing = followingIds.contains(user.id);
              return _SearchPlayerItem(
                user: user,
                isAdded: isAlreadyAdded,
                isFollowing: isFollowing,
                onTap: isAlreadyAdded ? null : () => _handleAddSearchUser(user),
              );
            },
          ),
        ),
      ),
    );
  }

  Future<void> _handleAddSearchUser(User user) async {
    final currentPlayers = ref.read(_selectedPlayersProvider);
    final currentUser = ref.read(userProvider)?.user;

    // Check if max players reached (current user + 3 others = 4 total)
    if (currentPlayers.length >= 3) {
      return;
    }

    // Build current players list for position selection
    final List<BookingPlayerBase> playersForDisplay = [];

    // Add current user in position 1
    if (currentUser != null) {
      playersForDisplay.add(BookingPlayerBase(
        id: currentUser.id,
        customer: BookingCustomerBase(
          id: currentUser.id,
          firstName: currentUser.firstName,
          lastName: currentUser.lastName,
          profileUrl: currentUser.profileUrl,
        ),
        position: 1,
        isOrganizer: true,
      ));
    }

    // Add selected players - preserve their positions
    for (var i = 0; i < currentPlayers.length; i++) {
      final player = currentPlayers[i];
      playersForDisplay.add(player);
    }

    // Show position selection dialog
    final result = await showDialog<(int, int?)>(
      context: context,
      builder: (context) {
        return _PositionSelectionDialog(
          players: playersForDisplay,
        );
      },
    );

    if (result != null) {
      final (int selectedIndex, int? otherPlayerID) = result;

      // Convert User to BookingPlayerBase
      final newPlayer = BookingPlayerBase(
        id: user.id,
        customer: BookingCustomerBase(
          id: user.id,
          firstName: user.firstName,
          lastName: user.lastName,
          profileUrl: user.profileUrl,
        ),
        position: selectedIndex + 1,
      );

      // Add to state
      final updatedPlayers = [...currentPlayers, newPlayer];
      ref.read(_selectedPlayersProvider.notifier).state = updatedPlayers;

      // Refresh the UI
      setState(() {});
    }
  }
}

class _PositionSelectionDialog extends StatelessWidget {
  const _PositionSelectionDialog({required this.players});

  final List<BookingPlayerBase> players;

  @override
  Widget build(BuildContext context) {
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
              textForAvailableSlot: "RESERVE".trU(context),
              players: players,
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
  }
}

class _SearchPlayerItem extends StatelessWidget {
  final User user;
  final VoidCallback? onTap;
  final bool isAdded;
  final bool isFollowing;

  const _SearchPlayerItem({
    required this.user,
    required this.onTap,
    this.isAdded = false,
    this.isFollowing = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
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
              color: isAdded ? AppColors.black25 : AppColors.darkYellow,
              borderRadius: BorderRadius.circular(12.r),
              boxShadow: isAdded ? [] : [kBoxShadow],
            ),
            alignment: Alignment.center,
            child: Text(
              isAdded ? "ADDED".trU(context) : "ADD".trU(context),
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

// Payment info dialogs

class _PayMyShareInfoDialog extends StatelessWidget {
  const _PayMyShareInfoDialog({required this.bookingTime});

  final DateTime bookingTime;

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      color: AppColors.white,
      closeIconColor: AppColors.black2,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 26.w,
                height: 26.h,
                child: Image.asset(
                  'assets/images/pay_my_share_icon.png',
                  width: 26.w,
                  height: 26.h,
                  color: AppColors.black2,
                ),
              ),
              SizedBox(width: 15.w),
              Text(
                "Pay My Share",
                style: AppTextStyles.poppinsMedium(
                  fontSize: 19.sp,
                  color: AppColors.black2,
                ),
              ),
            ],
          ),

          SizedBox(height: 15.h),
          // Info box
          Container(
            padding: EdgeInsets.all(10.h),
            decoration: BoxDecoration(
                color: AppColors.darkYellow30,
                borderRadius: BorderRadius.circular(12.r),
                boxShadow: [kBoxShadow],
                border: Border.all(color: AppColors.black2.withOpacity(.05))),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: AppTextStyles.poppinsRegular(
                  fontSize: 15.sp,
                  color: AppColors.black2,
                ),
                children: [
                  const TextSpan(
                      text: "We reserve the right to cancel the court if it's not filled before "),
                  TextSpan(
                    text:
                        "${DateFormat('dd MMMM HH:mm').format(bookingTime)}",
                    style: AppTextStyles.poppinsBold(
                      fontSize: 15.sp,
                      color: AppColors.black2,
                    ),
                  ),
                  const TextSpan(
                      text: "."),
                ],
              ),
            ),
          ),
          SizedBox(height: 20.h),
          MainButton(
            label: "PROCEED_WITH_PAYMENT".trU(context),
            isForPopup: true,
            onTap: () {
              Navigator.pop(context, true);
            },
          ),
        ],
      ),
    );
  }
}

class _AddOtherPlayersInfoDialog extends StatelessWidget {
  const _AddOtherPlayersInfoDialog();

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      color: AppColors.white,
      closeIconColor: AppColors.black2,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 26.w,
                height: 26.h,
                child: Icon(
                  Icons.person_add_outlined,
                  color: AppColors.black2,
                  size: 30.h,
                ),
              ),
              SizedBox(width: 15.w),
              Text(
                "ADD_OTHER_PLAYERS".trU(context),
                style: AppTextStyles.poppinsMedium(
                  fontSize: 19.sp,
                  color: AppColors.black2,
                ),
              ),
            ],
          ),
          SizedBox(height: 15.h),
          // Info box
          Container(
            padding: EdgeInsets.all(10.h),
            decoration: BoxDecoration(
                color: AppColors.darkYellow30,
                borderRadius: BorderRadius.circular(12.r),
                boxShadow: [kBoxShadow],
                border: Border.all(color: AppColors.black2.withOpacity(.05))),
            child: Column(
              children: [
                Text(
                  "You can add other players to the match and each player will pay their own slot.",
                  textAlign: TextAlign.center,
                  style: AppTextStyles.poppinsRegular(
                    fontSize: 15.sp,
                    color: AppColors.black2,
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  "If any spot remains unpaid within two hours after the game, the pending amount will be charged to you.",
                  textAlign: TextAlign.center,
                  style: AppTextStyles.poppinsRegular(
                    fontSize: 15.sp,
                    color: AppColors.black2,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.h),
          MainButton(
            label: "ADD_PLAYERS".trU(context),
            isForPopup: true,
            onTap: () {
              Navigator.pop(context, true);
            },
          ),
        ],
      ),
    );
  }
}

// Widget _selectionRowContainer(
//     {required String text,
//     required bool isSelected,
//     required Function()? onTap,
//     BoxShape? shape}) {
//   return InkWell(
//     onTap: onTap,
//     child: Container(
//       padding: EdgeInsets.symmetric(vertical: 8.h),
//       decoration: BoxDecoration(
//         border: Border(
//           bottom: BorderSide(
//             color: AppColors.white,
//             width: 1.h,
//           ),
//         ),
//       ),
//       child: Row(
//         children: [
//           Text(
//             text,
//             style: AppTextStyles.aeonikBold13.copyWith(
//               color: AppColors.white,
//             ),
//           ),
//           const Spacer(),
//           SelectedTag(
//             isSelected: isSelected,
//             unSelectedBorderColor: AppColors.white,
//             unSelectedColor: AppColors.white25,
//             shape: shape != null ? shape : BoxShape.rectangle,
//           )
//         ],
//       ),
//     ),
//   );
// }
