import 'package:flutter/material.dart';

enum MyCornerEnum { bottomLeft, bottomRight, topLeft, topRight }

// use it in a `Stack`
class MyCornerWidget extends StatelessWidget {
  final MyCornerEnum corner;
  final double padding;
  final int rotationQuarterTurns;
  final Widget child;

  MyCornerWidget({
    super.key,
    this.corner = MyCornerEnum.topLeft,
    this.padding = 10.0,
    this.rotationQuarterTurns = 0,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    switch (corner) {
      case MyCornerEnum.bottomLeft:
        return Positioned(
            bottom: padding,
            left: padding,
            child:
                RotatedBox(quarterTurns: rotationQuarterTurns, child: child));
      case MyCornerEnum.bottomRight:
        return Positioned(
            bottom: padding,
            right: padding,
            child:
                RotatedBox(quarterTurns: rotationQuarterTurns, child: child));
      case MyCornerEnum.topLeft:
        return Positioned(
            top: padding,
            left: padding,
            child:
                RotatedBox(quarterTurns: rotationQuarterTurns, child: child));
      case MyCornerEnum.topRight:
        return Positioned(
            top: padding,
            right: padding,
            child:
                RotatedBox(quarterTurns: rotationQuarterTurns, child: child));
    }
  }
}
