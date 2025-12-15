import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:padelrush/app_styles/app_colors.dart';
import 'package:padelrush/globals/images.dart';

class NetworkCircleImage extends StatelessWidget {
  const NetworkCircleImage(
      {super.key,
      required this.path,
      required this.width,
      required this.height,
      this.showBG = true,
      this.bgColor,
      this.borderRadius,
      this.logoColor,
      this.boxBorder,
      this.applyShadow = true});

  final String? path;
  final double width;
  final double height;
  final bool showBG;
  final Color? bgColor;
  final Color? logoColor;

  final bool applyShadow;
  final BorderRadius? borderRadius;

  final BoxBorder? boxBorder;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,

      // padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        border: boxBorder,
        borderRadius: borderRadius ?? BorderRadius.circular(0.r),
        // shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
        // color:
        //     (showBG && (path?.isEmpty ?? true)) ? (bgColor ??  AppColors.darkYellow50) : Colors.transparent,
        // boxShadow: applyShadow
        //     ? [
        //         BoxShadow(
        //           color: Colors.black.withOpacity(0.1),
        //           blurRadius: 10,
        //           spreadRadius: 1,
        //         )
        //       ]
        //     : null,
      ),
      child: path?.isEmpty ?? true
          ? Transform.scale(
              scale: 1,
              child: Image.asset(
                AppImages.buttonIcon.path,
                // color: logoColor,
                fit: BoxFit.cover,
                height: 36.w,
                width: 64.w,
              ),
            )
          : Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                border: boxBorder,
                // shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
                borderRadius: borderRadius ?? BorderRadius.circular(12.r),
                image: DecorationImage(
                  image: NetworkImage(path!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
    );
  }
}
