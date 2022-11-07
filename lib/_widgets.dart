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

enum MyRoundEnum { bottomCenter, topCenter, leftCenter, rightCenter }

// use it in a `Stack`
class MyRoundCenterWidget extends StatelessWidget {
  final MyRoundEnum position;
  final double padding;
  final Widget child;
  MyRoundCenterWidget({
    super.key,
    required this.position,
    this.padding = 10.0,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    switch (position) {
      case MyRoundEnum.bottomCenter:
        return Positioned.fill(
          bottom: padding,
          child: Align(alignment: Alignment.bottomCenter, child: child),
        );
      case MyRoundEnum.topCenter:
        return Positioned.fill(
          top: padding,
          child: Align(alignment: Alignment.topCenter, child: child),
        );
      case MyRoundEnum.leftCenter:
        return Positioned.fill(
          left: padding,
          child: Align(alignment: Alignment.centerLeft, child: child),
        );
      case MyRoundEnum.rightCenter:
        return Positioned.fill(
          right: padding,
          child: Align(alignment: Alignment.centerRight, child: child),
        );
    }
  }
}