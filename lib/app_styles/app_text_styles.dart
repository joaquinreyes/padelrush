import 'package:padelrush/app_styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyles {
  const AppTextStyles();

  static TextStyle popupHeaderTextStyle = AppTextStyles.poppinsBold(
    // color: AppColors.white,
    fontSize: 19.sp,
  );

  static TextStyle get popupBodyTextStyle => AppTextStyles.poppinsMedium(
        fontSize: 14.sp,
        // color: AppColors.white,
      );

  /// New App Text Style

  static TextStyle poppinsBold(
          {double? fontSize,
          Color? color,
          double? letterSpacing,
          double? height}) =>
      TextStyle(
        fontSize: fontSize ?? 19.sp,
        decoration: TextDecoration.none,
        color: color ?? AppColors.black,
        fontFamily: 'Poppins',
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
  //       fontFamily: 'Poppins',
  //       letterSpacing: letterSpacing,
  //       height: height,
  //       fontWeight: FontWeight.w700,
  //     );

  static TextStyle poppinsLight(
          {double? fontSize,
          Color? color,
          double? height,
          double? letterSpacing}) =>
      TextStyle(
        fontSize: fontSize ?? 14.sp,
        decoration: TextDecoration.none,
        color: color ?? AppColors.black,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w300,
        height: height,
        letterSpacing: letterSpacing,
      );

  static TextStyle poppinsRegularItalic(
          {double? fontSize, Color? color, TextDecoration? textDecoration}) =>
      TextStyle(
        fontSize: fontSize ?? 14.sp,
        decoration: textDecoration ?? TextDecoration.none,
        color: color ?? AppColors.black,
        fontFamily: 'Poppins',
        fontStyle: FontStyle.italic,
        fontWeight: FontWeight.w400,
      );

  static TextStyle poppinsRegular(
          {double? fontSize,
          Color? color,
          double? height,
          double? letterSpacing}) =>
      TextStyle(
        fontSize: fontSize ?? 14.sp,
        decoration: TextDecoration.none,
        color: color ?? AppColors.black,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w400,
        height: height,
        letterSpacing: letterSpacing,
      );


  static TextStyle poppinsSemiBold(
          {double? fontSize, Color? color, double? letterSpacing}) =>
      TextStyle(
        fontSize: fontSize ?? 14.sp,
        decoration: TextDecoration.none,
        color: color ?? AppColors.black,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w600,
        letterSpacing: letterSpacing,
      );

// TODO: not used them remove

static TextStyle poppinsMedium({double? fontSize, Color? color, double? letterSpacing}) => TextStyle(
      fontSize: fontSize ?? 14.sp,
      decoration: TextDecoration.none,
      color: color ?? AppColors.black,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w500,
      letterSpacing: letterSpacing,
    );

  static TextStyle pragmaticaExtendedBold({double? fontSize, Color? color}) => TextStyle(
    fontSize: fontSize ?? 14.sp,
    decoration: TextDecoration.none,
    color: color ?? AppColors.black,
    fontFamily: 'Pragmatica',
    fontWeight: FontWeight.w700,
  );

  static TextStyle pragmaticaObliqueExtendedBold({double? fontSize, Color? color,
    double? height,
  }) => TextStyle(
    fontSize: fontSize ?? 14.sp,
    decoration: TextDecoration.none,
    color: color ?? AppColors.black,
    fontFamily: 'PragmaticaOblique',
    fontWeight: FontWeight.w700,
    height: height,
  );

  static TextStyle mohaveBold({double? fontSize, Color? color}) => TextStyle(
    fontSize: fontSize ?? 14.sp,
    decoration: TextDecoration.none,
    color: color ?? AppColors.black,
    fontFamily: 'Mohave',
    fontWeight: FontWeight.w700,
  );
}
