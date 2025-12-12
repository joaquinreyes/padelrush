import 'package:flutter/material.dart';
import 'package:padelrush/globals/images.dart';

class BackgroundView extends StatelessWidget {
  final Widget child;

  const BackgroundView({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.backgroundImage.path),
          fit: BoxFit.cover,
          alignment: Alignment.topCenter,
        ),
      ),
      child: child,
    );
  }
}