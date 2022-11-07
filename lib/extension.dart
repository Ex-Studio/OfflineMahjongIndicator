import 'dart:math';

import 'package:flutter/material.dart';

class YxjExtensions {
  static double screenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double screenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double screenLengthShorter(BuildContext context) {
    return min(YxjExtensions.screenWidth(context),
        YxjExtensions.screenHeight(context));
  }
}

enum YxjCorner { bottomLeft, bottomRight, topLeft, topRight }

// use it in a `Stack`
class YxjCornerWidget extends StatelessWidget {
  final YxjCorner corner;
  final double padding;
  final int rotationQuarterTurns;
  final Widget child;

  YxjCornerWidget({
    super.key,
    this.corner = YxjCorner.topLeft,
    this.padding = 10.0,
    this.rotationQuarterTurns = 0,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    switch (corner) {
      case YxjCorner.bottomLeft:
        return Positioned(
            bottom: padding,
            left: padding,
            child:
                RotatedBox(quarterTurns: rotationQuarterTurns, child: child));
      case YxjCorner.bottomRight:
        return Positioned(
            bottom: padding,
            right: padding,
            child:
                RotatedBox(quarterTurns: rotationQuarterTurns, child: child));
      case YxjCorner.topLeft:
        return Positioned(
            top: padding,
            left: padding,
            child:
                RotatedBox(quarterTurns: rotationQuarterTurns, child: child));
      case YxjCorner.topRight:
        return Positioned(
            top: padding,
            right: padding,
            child:
                RotatedBox(quarterTurns: rotationQuarterTurns, child: child));
    }
  }
}
