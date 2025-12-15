import 'package:flutter/material.dart';
import 'package:padelrush/globals/utils.dart';

// https://www.figma.com/community/plugin/1267503782684933309/export-colors-as-dart
class AppColors {
  // static const Color darkYellow50 = Color(0xFFF7DE8F);
  static const Color selectedGreen = Color(0xffB6B4B4);
  static Color standardGreen60 = const Color(0xff115945).withOpacity(0.60);
  static Color standardGreen35 = const Color(0xff115945).withOpacity(0.35);
  static Color standardGreen10 = const Color(0xff115945).withOpacity(0.10);

  static const Color darkYellow = Color(0xFFCFFC85);
  static Color darkYellow25 = const Color(0xFFCFFC85).withOpacity(0.25);
  static Color darkYellow30 = const Color(0xFFCFFC85).withOpacity(0.30);
  static Color darkYellow35 = const Color(0xFFCFFC85).withOpacity(0.35);
  static Color darkYellow50 = const Color(0xFFCFFC85).withOpacity(0.50);
  static Color darkYellow60 = const Color(0xFFCFFC85).withOpacity(0.60);
  static Color darkYellow80 = const Color(0xFFCFFC85).withOpacity(0.80);

  static Color darkGreen = const Color(0xff084030);
  static Color darkGreen50 = const Color(0xff084030).withOpacity(0.50);
  static Color darkGreen25 = const Color(0xff084030).withOpacity(0.25);

  static const Color black2 = Color(0xFF0B0B0B);
  static const Color intenseGreen = Color(0xFF595E49);

  // static const Color baseGreen = Color(0xff6A8177);
  // static const Color calenderBGColor = Color(0xffECE1BD);
  static Color standardGold50 = const Color(0xffDAC37B80).withOpacity(0.50);

  static const Color greenShowdow =
      Color(0xff051A0E); // TODO: IF not used remove it
  static const Color black = Color(0xff171717);
  static Color black90 = const Color(0xff171717).withOpacity(0.90);

  static Color black70 =
      const Color(0xff171717).withOpacity(0.70); // TODO: IF not used remove it
  static Color black25 =
      const Color(0xff171717).withOpacity(0.25); //  TODO: IF not used remove it
  static Color black5 = const Color(0xff171717).withOpacity(0.05);
  static Color black10 = black2.withOpacity(0.10);
  static Color black50 = black2.withOpacity(0.5);
  static Color black80 = black2.withOpacity(0.8);

  static const Color whiteNew = Color(0xffFAFAFA);
  static const Color white = Color(0xffFFFFFF);
  static Color white95 = const Color(0xffFFFFFF).withOpacity(0.95);
  static Color white55 = const Color(0xffFFFFFF).withOpacity(0.55);
  static Color white25 = const Color(0xffFFFFFF).withOpacity(0.25);
  static Color white10 = const Color(0xffFFFFFF).withOpacity(0.10);
  static Color navigationBgColor = Color(0xffE7EEEC).withOpacity(0.50);
  static Color backgroundColor = Color(0xffFFFFFF);
  static Color buttonBackgroundColor = Color(0xFFC2C2C2);
  static Color locationBgColor = Color(0xffE0D7B4);
  static Color tileBgColor = Color(0xFFF3F3F3);
  static Color transparentColor = Colors.transparent;

  // static Color rosewood = Color(0xffC1A39A);
  static Color darkRosewood = Color(0xffAA867B);
  static Color rosewood25 = Color(0xffC1A39A).withOpacity(0.25);

  static const Color gray = Color(0xffDDDDDD);
  static Color gray5 = Color(0xffDDDDDD).withOpacity(0.05);
  static const Color darkGray = Color(0xff69756F);
  static Color darkGray50 = const Color(0xff69756F).withOpacity(0.50);
  static const Color lightGray = Color(0xffF4F4F4);

  static const errorColor = Color(0xFFD32F2F);

  static Color get standardGreen60Popup => Utils.calculateColorOverBackground(
      AppColors.darkYellow50, "99", AppColors.white);

  // static Color get standardGreen10Popup => Utils.calculateColorOverBackground(
  //     AppColors.baseGreen, "19", AppColors.white);
  static Color get standardGold50Popup => Utils.calculateColorOverBackground(
      AppColors.darkYellow50, "80", AppColors.white);

//TODO: IF not used remove all
  static const orange = Color(0xFFF26A2B);
  static const orange50 = Color(0x7FF26A2B);
  static const lightOrange = Color(0xFFFDE4C5);
  static const lightOrange35 = Color(0x59FDE4C5);
  static const blue = Color(0xFF1B2B4C);
  static const blue5 = Color(0x0C1B2B4C);
  static const blue25 = Color(0x3F1B2B4C);
  static const blue50 = Color(0x7F1B2B4C);
  static const blue70 = Color(0xB21B2B4C);
  static const blue90 = Color(0xE51B2B4C);
  static const lightBlue = Color(0xFF0A63AA);

  static const lightGrey = Color(0xFFF5F5F5);

  static const blue2 = Color(0xFF0B63AA);

  static Color get orange50Popup => Utils.calculateColorOverBackground(
      AppColors.orange50, "7F", AppColors.white);

  static Color get lightOrange35Popup => Utils.calculateColorOverBackground(
      AppColors.lightOrange35, "59", AppColors.white);

  static Color get white25Popup => Utils.calculateColorOverBackground(
      AppColors.white, "3F", AppColors.white);
}
