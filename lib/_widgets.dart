import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

enum MyCornerEnum { bottomLeft, bottomRight, topLeft, topRight }

// use it in a `Stack`
class MyCornerWidget extends StatelessWidget {
  final MyCornerEnum corner;
  final double padding;
  final int rotationQuarterTurns;
  final Widget child;

  const MyCornerWidget({
    super.key,
    required this.corner,
    required this.padding,
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
class MyEdgeCenterWidget extends StatelessWidget {
  final MyRoundEnum position;
  final double padding;
  final Widget child;

  const MyEdgeCenterWidget({
    super.key,
    required this.position,
    required this.padding,
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

class MyVerticleAddMinusWidget extends StatelessWidget {
  final double iconSize;
  final Color buttonColor;
  final VoidCallback addCallback;
  final VoidCallback minusCallback;
  final Widget child;

  const MyVerticleAddMinusWidget({
    super.key,
    required this.iconSize,
    required this.buttonColor,
    required this.addCallback,
    required this.minusCallback,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      ElevatedButton(
        onPressed: () {
          debugPrint("pressed add");
          addCallback();
        },
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          backgroundColor: buttonColor,
          foregroundColor: Colors.white,
        ),
        child: Icon(CupertinoIcons.add, size: iconSize),
      ),
      child,
      ElevatedButton(
        onPressed: () {
          debugPrint("pressed minus");
          minusCallback();
        },
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          backgroundColor: buttonColor,
          foregroundColor: Colors.white,
        ),
        child: Icon(CupertinoIcons.minus, size: iconSize),
      ),
    ]);
  }
}

class MyInfoButtonWidget extends StatelessWidget {
  final Widget infoTitle;
  final Widget infoContent;
  final Widget buttonContent;

  const MyInfoButtonWidget({
    super.key,
    required this.infoTitle,
    required this.infoContent,
    required this.buttonContent,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: () {
        showCupertinoDialog<void>(
          context: context,
          builder: (BuildContext context) => CupertinoAlertDialog(
            title: infoTitle,
            content: Center(child: infoContent),
            actions: <CupertinoDialogAction>[
              CupertinoDialogAction(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("确认"),
              ),
            ],
          ),
        );
      },
      padding: EdgeInsets.zero, // remove padding
      minSize: 0.0,
      child: buttonContent, // remove padding
    );
  }
}

class MyDestructiveButtonWidget extends StatelessWidget {
  final Widget infoTitle;
  final Widget infoContent;
  final Widget buttonContent;
  final VoidCallback destructiveCallback;

  const MyDestructiveButtonWidget({
    super.key,
    required this.infoTitle,
    required this.infoContent,
    required this.buttonContent,
    required this.destructiveCallback,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: () {
        showCupertinoDialog<void>(
          context: context,
          builder: (BuildContext context) => CupertinoAlertDialog(
            title: infoTitle,
            content: Center(child: infoContent),
            actions: <CupertinoDialogAction>[
              CupertinoDialogAction(
                onPressed: () {
                  Navigator.pop(context);
                },
                isDefaultAction: false,
                isDestructiveAction: false,
                child: const Text("取消"),
              ),
              CupertinoDialogAction(
                onPressed: () {
                  Navigator.pop(context);
                  destructiveCallback();
                },
                isDefaultAction: true,
                isDestructiveAction: true,
                child: const Text("确认"),
              ),
            ],
          ),
        );
      },
      padding: EdgeInsets.zero, // remove padding
      minSize: 0.0,
      child: buttonContent, // remove padding
    );
  }
}
