import 'package:padelrush/app_styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyles {
  const AppTextStyles();

  static TextStyle popupHeaderTextStyle = AppTextStyles.qanelasMedium(
    // color: AppColors.white,
    fontSize: 19.sp,
  );

  static TextStyle get popupBodyTextStyle => AppTextStyles.qanelasLight(
        fontSize: 15.sp,
        // color: AppColors.white,
      );

  /// New App Text Style

  static TextStyle qanelasBold(
          {double? fontSize,
          Color? color,
          double? letterSpacing,
          double? height}) =>
      TextStyle(
        fontSize: fontSize ?? 19.sp,
        decoration: TextDecoration.none,
        color: color ?? AppColors.black2,
        fontFamily: 'Qanelas',
        letterSpacing: letterSpacing,
        height: height,
        fontWeight: FontWeight.w700,
      );

  // static TextStyle qanelasBold(
  //         {double? fontSize,
  //         Color? color,
  //         double? letterSpacing,
  //         double? height}) =>
  //     TextStyle(
  //       fontSize: fontSize ?? 14.sp,
  //       decoration: TextDecoration.none,
  //       color: color ?? AppColors.black,
  //       fontFamily: 'Qanelas',
  //       letterSpacing: letterSpacing,
  //       height: height,
  //       fontWeight: FontWeight.w700,
  //     );

  static TextStyle qanelasLight(
          {double? fontSize,
          Color? color,
          double? height,
          double? letterSpacing}) =>
      TextStyle(
        fontSize: fontSize ?? 14.sp,
        decoration: TextDecoration.none,
        color: color ?? AppColors.black2,
        fontFamily: 'Qanelas',
        fontWeight: FontWeight.w300,
        height: height,
        letterSpacing: letterSpacing,
      );

  static TextStyle qanelasRegularItalic(
          {double? fontSize, Color? color, TextDecoration? textDecoration}) =>
      TextStyle(
        fontSize: fontSize ?? 14.sp,
        decoration: textDecoration ?? TextDecoration.none,
        color: color ?? AppColors.black2,
        fontFamily: 'Qanelas',
        fontStyle: FontStyle.italic,
        fontWeight: FontWeight.w400,
      );

  static TextStyle qanelasRegular(
          {double? fontSize,
          Color? color,
          double? height,
          double? letterSpacing}) =>
      TextStyle(
        fontSize: fontSize ?? 14.sp,
        decoration: TextDecoration.none,
        color: color ?? AppColors.black2,
        fontFamily: 'Qanelas',
        fontWeight: FontWeight.w400,
        height: height,
        letterSpacing: letterSpacing,
      );

  // static TextStyle gothicRegular({double? fontSize, Color? color}) => TextStyle(
  //       fontSize: fontSize ?? 14.sp,
  //       decoration: TextDecoration.none,
  //       color: color ?? AppColors.black,
  //       fontFamily: 'Qanelas',
  //       fontWeight: FontWeight.w500,
  //     );

  static TextStyle qanelasSemiBold(
          {double? fontSize, Color? color, double? letterSpacing}) =>
      TextStyle(
        fontSize: fontSize ?? 14.sp,
        decoration: TextDecoration.none,
        color: color ?? AppColors.black2,
        fontFamily: 'Qanelas',
        fontWeight: FontWeight.w600,
        letterSpacing: letterSpacing,
      );

// TODO: not used them remove

static TextStyle qanelasMedium({double? fontSize, Color? color, double? letterSpacing}) => TextStyle(
      fontSize: fontSize ?? 14.sp,
      decoration: TextDecoration.none,
      color: color ?? AppColors.black2,
      fontFamily: 'Qanelas',
      fontWeight: FontWeight.w500,
      letterSpacing: letterSpacing,
    );
}
