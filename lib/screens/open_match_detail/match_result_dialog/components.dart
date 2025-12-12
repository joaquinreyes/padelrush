part of 'enter_match_result.dart';

class _MatchResultForms extends ConsumerStatefulWidget {
  const _MatchResultForms({required this.service});

  final ServiceDetail service;

  @override
  ConsumerState<_MatchResultForms> createState() => _MatchResultFormsState();
}

class _MatchResultFormsState extends ConsumerState<_MatchResultForms> {
  @override
  Widget build(BuildContext context) {
    final players = ref.watch(_sortedPlayersProvider);
    if (players.isEmpty) {
      return const SizedBox();
    }
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 15.h),
      decoration: BoxDecoration(
        color: AppColors.black25,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: const [
          BoxShadow(
            color: Color(0x11000000),
            blurRadius: 4,
            offset: Offset(0, 4),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        children: [
          // SizedBox(height: 5.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.service.formattedDateStartTime,
                style: AppTextStyles.qanelasBold(

                  fontSize: 16.sp,
                ),
              ),
              Text(
                widget.service.openMatchLevelRange ?? '',
                style: AppTextStyles.qanelasRegular(
                    fontSize: 15.sp ),
              ),
            ],
          ),
          // SizedBox(height: 5.h),
          CDivider(color: AppColors.black.withOpacity(0.10)),
          SizedBox(height: 5.h),
          _drawButton(),
          // SizedBox(height: 10.h),
          if (players.length > 1)
            _SingleResultForm(
              players: [players.first, players[1]],
              isTeamA: true,
            ),
          SizedBox(height: 7.h),
          const _SwapRow(),
          SizedBox(height: 7.h),
          if (players.length > 3)
            _SingleResultForm(
              players: [players[2], players[3]],
              isTeamA: false,
            ),
        ],
      ),
    );
  }

  Widget _drawButton() {
    return SizedBox();
    final isDraw = ref.watch(_isDrawProvider);
    return Align(
      alignment: Alignment.centerRight,
      child: SecondaryButton(
        // borderRadius: 100.r,
        color: isDraw ? AppColors.darkYellow50 : AppColors.white,
        applyShadow: true,
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 2.h),
        onTap: () {
          ref.invalidate(_teamAScoreProvider);
          ref.invalidate(_teamBScoreProvider);
          ref.read(_isDrawProvider.notifier).state = !isDraw;
        },
        child: Text(
          "DRAW".tr(context),
          style: isDraw
              ? AppTextStyles.qanelasSemiBold(
                  fontSize: 14.sp,
                )
              : AppTextStyles.qanelasRegular(
                  fontSize: 13.sp,
                ),
        ),
      ),
    );
  }
}

class _SingleResultForm extends ConsumerWidget {
  const _SingleResultForm({required this.players, required this.isTeamA});

  final List<ServiceDetail_Players> players;
  final bool isTeamA;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDraw = ref.watch(_isDrawProvider.notifier).state;
    final isAWinner = ref.watch(isTeamAWinner);
    final isBWinner = ref.watch(isTeamBWinner);

    return Row(
      children: [
        Expanded(
          child: Row(
            children: [
              ParticipantSlot(
                textColor: AppColors.black2,
                player: players[0],
                showLevel: false,
                logoColor: AppColors.black2,
                imageBgColor: AppColors.white,
              ),
              ParticipantSlot(
                textColor: AppColors.black2,
                player: players[1],
                imageBgColor: AppColors.white,
                logoColor: AppColors.black2,
                showLevel: false,
              ),
            ],
          ),
        ),
        Expanded(
          child: _ScoreInput(
            scores: isTeamA
                ? ref.read(_teamAScoreProvider)
                : ref.read(_teamBScoreProvider),
            index: isTeamA ? 0 : 1,
            isDraw: isDraw,
            onChanged: (value) {
              int? a = int.tryParse(value[0]);
              int? b = int.tryParse(value[1]);
              int? c = int.tryParse(value[2]);
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (isTeamA) {
                  ref.read(_teamAScoreProvider.notifier).state = [a, b, c];
                } else {
                  ref.read(_teamBScoreProvider.notifier).state = [a, b, c];
                }
                _setIfDraw(ref);
              });
            },
            isWinner: isTeamA ? isAWinner : isBWinner,
          ),
        ),
      ],
    );
  }

  _drawWidget(BuildContext context) {
    return SizedBox();
    return Container(
      decoration: BoxDecoration(color: Colors.transparent),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Center(
        child: Text(
          "DRAW".trU(context),
          style: AppTextStyles.qanelasMedium(
            color: AppColors.white,
            fontSize: 16.sp,
          ),
        ),
      ),
    );
  }
}

class _RankOtherPlayers extends ConsumerWidget {
  const _RankOtherPlayers();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final players = ref.watch(_otherNonReservedPlayersProvider);
    final assessmentModel = ref.watch(_assesmentReqModelProvider);
    if (players.isEmpty) {
      return const SizedBox();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20.h),
        Text(
          "RANK_THE_OTHER_PLAYERS".tr(context),
          style: AppTextStyles.qanelasLight(
              fontSize: 16.sp),
        ),
        SizedBox(height: 10.h),
        for (var i = 0; i < players.length; i++) ...[
          Row(
            children: [
              ParticipantSlot(
                player: players[i],
                textColor: AppColors.black,
                imageBgColor: AppColors.white,
                logoColor: AppColors.black2,
              ),
              SizedBox(width: 20.w),
              _RankingLevelSelector(
                player: players[i],
                selectedLevel:
                    assessmentModel.assessments[players[i].id.toString()] ?? 0,
                onChanged: (value) {
                  final model = ref.read(_assesmentReqModelProvider);
                  model.assessments[players[i].id.toString()] = value;
                  ref.invalidate(_assesmentReqModelProvider);
                  ref.read(_assesmentReqModelProvider.notifier).state = model;
                },
              ),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ],
    );
  }
}

class _RankingLevelSelector extends StatefulWidget {
  const _RankingLevelSelector({
    required this.player,
    required this.selectedLevel,
    required this.onChanged,
  });

  final ServiceDetail_Players player;
  final double selectedLevel;
  final Function(double) onChanged;

  @override
  State<_RankingLevelSelector> createState() => _RankingLevelSelectorState();
}

class _RankingLevelSelectorState extends State<_RankingLevelSelector> {
  // bool _isOpen = false;
  List<double> levelList = [];

  @override
  void initState() {
    final playerLevel = widget.player.customer?.levelD("padel") ?? 0;

    if (playerLevel - 0.5 >= 0) {
      levelList.add(playerLevel - 0.5);
    }
    levelList.add(playerLevel);
    if (playerLevel + 0.5 <= 7.0) {
      levelList.add(playerLevel + 0.5);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "SELECT_PLAYER_LEVEL".tr(context),
          style: AppTextStyles.qanelasLight(
              fontSize: 15.sp ),
        ),
        SizedBox(height: 5.h),
        Container(
          decoration: BoxDecoration(
            color: AppColors.black25,
            borderRadius: BorderRadius.circular(12.r),
            boxShadow: const [
              BoxShadow(
                color: Color(0x11000000),
                blurRadius: 4,
                offset: Offset(0, 4),
                spreadRadius: 0,
              ),
            ],
          ),
          child: Row(
            children: levelList.map((e) {
              bool isSelected = widget.selectedLevel == e;
              return Expanded(
                child: InkWell(
                  onTap: () {
                    widget.onChanged(e);
                  },
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.5.w, vertical: 6.h),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? AppColors.darkYellow50
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(12.r),
                      boxShadow: isSelected
                          ? const [
                              BoxShadow(
                                color: Color(0x11000000),
                                blurRadius: 4,
                                offset: Offset(0, 4),
                                spreadRadius: 0,
                              ),
                            ]
                          : null,
                    ),
                    child: Center(
                      child: Text(
                        e.toStringAsFixed(2),
                        style: isSelected
                            ? AppTextStyles.qanelasSemiBold(
                                fontSize: 14.sp,
                              )
                            : AppTextStyles.qanelasRegular(
                                fontSize: 13.sp,
                                color: AppColors.white,
                              ),
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        )
      ],
    ));
  }
}

class _ScoreInput extends StatelessWidget {
  const _ScoreInput({
    required this.isWinner,
    required this.onChanged,
    required this.index,
    required this.isDraw,
    this.scores,
  });

  final bool isWinner;
  final bool isDraw;
  final Function(List<String>) onChanged;
  final int index;
  final List<int?>? scores;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      margin: const EdgeInsets.only(bottom: 10, top: 4),
      decoration: BoxDecoration(
        color: isDraw
            ? AppColors.darkYellow50
            : isWinner
                ? AppColors.darkYellow
                : Colors.transparent,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        children: [
          if (isWinner || isDraw)
            Text(
              (isDraw ? "DRAW" : "WINNERS").tr(context),
              style: AppTextStyles.qanelasMedium(
                fontSize: 14.sp,
              ),
            ),
          CustomNumberInput(
            onChanged: onChanged,
            color:isDraw || isWinner ? AppColors.black2 : AppColors.black,
            index: index,
            initialScore: scores,
          ),
        ],
      ),
    );
  }
}

class _SwapRow extends StatelessWidget {
  const _SwapRow();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(flex: 3),
        InkWell(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => const _SwapDialog(),
            );
          },
          child: Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Center(
              child: Image.asset(
                AppImages.refresh.path,
                width: 13.w,
                height: 13.w,
              ),
            ),
          ),
        ),
        const Spacer(flex: 7),
        Text(
          "V/S",
          style: AppTextStyles.qanelasMedium(
              fontSize: 12.sp, ),
        ),
        const Spacer(flex: 3),
      ],
    );
  }
}

class _SwapDialog extends ConsumerStatefulWidget {
  const _SwapDialog();

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => __SwapDialogState();
}

class __SwapDialogState extends ConsumerState<_SwapDialog> {
  @override
  Widget build(BuildContext context) {
    final players = ref.watch(_otherPlayersProvider);
    return CustomDialog(
        child: Column(
      children: [
        Text(
          "WHO_DID_YOU_PLAY_WITH".trU(context),
          style: AppTextStyles.popupHeaderTextStyle,
        ),
        SizedBox(height: 5.h),
        Text(
          "CLICK_ON_THE_PLAYER_THAT_WAS_ON_YOUR_TEAM".tr(context),
          style: AppTextStyles.popupBodyTextStyle,
        ),
        SizedBox(height: 20.h),
        Row(
          children: [
            for (var i = 0; i < players.length; i++)
              Expanded(
                child: InkWell(
                  onTap: () {
                    onTap(players[i].id!);
                  },
                  child: ParticipantSlot(
                    logoColor: AppColors.black2,
                    imageBgColor: AppColors.white,
                    player: players[i],
                    showLevel: false,
                    allowTap: false,
                    textColor: AppColors.white,
                  ),
                ),
              ),
          ],
        )
      ],
    ));
  }

  onTap(int playerId) {
    final players = ref.read(_sortedPlayersProvider);
    final assesmentModel = ref.read(_assesmentReqModelProvider);
    final myPlayerID = ref.read(currentPlayerID);
    final positions = assesmentModel.positions;
    final oldPOS = positions[playerId.toString()]!;
    final myPOS = positions[myPlayerID.toString()]!;
    int newPOS;
    if (myPOS.isEven) {
      newPOS = myPOS - 1;
    } else {
      newPOS = myPOS + 1;
    }
    final personAtNewPos =
        positions.entries.firstWhere((element) => element.value == newPOS).key;

    positions[playerId.toString()] = newPOS;
    positions[personAtNewPos.toString()] = oldPOS;
    assesmentModel.positions = positions;
    ref.invalidate(_assesmentReqModelProvider);
    ref.read(_assesmentReqModelProvider.notifier).state = assesmentModel;
    // sort the players according to the new positions
    final sortedPlayers = players.toList()
      ..sort((a, b) =>
          positions[a.id.toString()]!.compareTo(positions[b.id.toString()]!));
    ref.invalidate(_sortedPlayersProvider);
    ref.read(_sortedPlayersProvider.notifier).state = sortedPlayers;

    Navigator.of(context).pop();
  }
}
