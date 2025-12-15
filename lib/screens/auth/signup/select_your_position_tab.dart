part of 'signup_screen.dart';

class _SelectYourPosition extends StatefulWidget {
  const _SelectYourPosition(
      {required this.registerModel, required this.onProceed});
  final RegisterModel registerModel;
  final Function() onProceed;
  @override
  State<_SelectYourPosition> createState() => _SelectYourPositionState();
}

class _SelectYourPositionState extends State<_SelectYourPosition> {
  bool get canProceed => playingSide != null;
  PlayingSide? playingSide;
  @override
  void initState() {
    final playingSide = widget.registerModel.playingSide;
    if (playingSide != null) {
      this.playingSide = PlayingSide.fromString(playingSide);
    }
    // playingSide = PlayingSide.fromString(");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 39.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 29.h),
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'SELECT_YOUR_POSITION'.tr(context),
                  style: AppTextStyles.poppinsMedium(
                      fontSize: 20.sp,),
                )
                // MultiStyleTextFirstBold(
                //   text: 'SELECT_YOUR_POSITION'.trU(context),
                //   textAlign: TextAlign.center,
                //   fontSize: 20.sp,
                //   color: AppColors.black,
                // ),
                ),
            SizedBox(height: 28.h),
            _optionTile(
              PlayingSide.right,
              "RIGHT_SIDE_EXPLANATION".tr(context),
            ),
            _optionTile(
              PlayingSide.left,
              "LEFT_SIDE_EXPLANATION".tr(context),
            ),
            _optionTile(
              PlayingSide.both,
              "BOTH_SIDES_EXPLANATION".tr(context),
            ),
            SizedBox(height: 229.h),
            Align(
              alignment: Alignment.centerRight,
              child: SizedBox(
                width: 154.50.w,
                child: MainButton(
                  enabled: canProceed,
                  // color: canProceed ? AppColors.rosewood : AppColors.rosewood25,
                  showArrow: true,
                  label: 'NEXT'.capitalWord(context, canProceed),
                  onTap: () async {
                    if (canProceed) {
                      widget.registerModel.playingSide =
                          playingSide?.getApiString;
                      widget.onProceed();
                    }
                  },
                  // padding: EdgeInsets.symmetric(
                  //   horizontal: 15.w,
                  // ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _optionTile(PlayingSide side, String explanation) {
    final selected = playingSide == side;
    return InkWell(
      onTap: () {
        playingSide = side;
        widget.registerModel.playingSide = side.getApiString;
        setState(() {});
      },
      child: Container(
        // width: 311.w,
        padding: EdgeInsets.all(10.h),
        margin: EdgeInsets.symmetric(
          vertical: 5.h,
        ),
        decoration: BoxDecoration(
          color: selected ? AppColors.darkYellow35 : AppColors.tileBgColor,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          children: [
            SelectedTag(isSelected: selected, shape: BoxShape.circle,unSelectedBorderColor: AppColors.black70,selectedBorderColor: AppColors.black70,),
            SizedBox(width: 20.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    side.userFacingString,
                    style: selected
                        ? AppTextStyles.poppinsMedium(
                            fontSize: 16.sp,
                            color: AppColors.black,
                          )
                        : AppTextStyles.poppinsMedium(
                            fontSize: 16.sp,
                            color: AppColors.black70,
                          ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    explanation,
                    style: AppTextStyles.poppinsRegular(
                      fontSize: 14.sp,
                      color: selected ? AppColors.black : AppColors.black70,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
