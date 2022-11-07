import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter/cupertino.dart';

import 'package:playground221107/_extensions.dart';
import 'package:playground221107/_models.dart';
import 'package:playground221107/_widgets.dart';
import 'package:playground221107/_constants.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: ChangeNotifierProvider(
          create: (context) => MyModel(),
          child: ContextView(),
        ),
      ),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class ContextView extends StatelessWidget {
  ContextView({super.key});

  @override
  Widget build(BuildContext context) {
    String debugInfo = """
[DEBUG]
${MyExtensions.screenWidth(context)}x${MyExtensions.screenHeight(context)}
""";

    String usageInfo = """
[使用说明]
将手机朝东家横向放置
长按解锁按键进行操作
""";

    TextStyle cornerSmallTextStyle = TextStyle(
        fontSize: MyExtensions.screenLengthShorter(context) *
            cornerSmallTextSizePercentage);

    final currentJuChangText = Consumer<MyModel>(
      builder: (context, model, child) {
        return Text(
          "${model.currentJu.description()} ꘖx${model.currentChang}",
          style: cornerSmallTextStyle,
        );
      },
    );

    return Stack(
      children: [
        // 中间的解锁按钮和东南西北
        CenterView(),
        // 四周的局数和本场数
        MyCornerWidget(
            corner: MyCornerEnum.bottomLeft,
            rotationQuarterTurns: 0,
            child: currentJuChangText),
        MyCornerWidget(
            corner: MyCornerEnum.bottomRight,
            rotationQuarterTurns: 3,
            child: currentJuChangText),
        MyCornerWidget(
            corner: MyCornerEnum.topRight,
            rotationQuarterTurns: 2,
            child: currentJuChangText),
        MyCornerWidget(
            corner: MyCornerEnum.topLeft,
            rotationQuarterTurns: 1,
            child: currentJuChangText),
        // 调试信息
        MyCornerWidget(
            padding: MyExtensions.screenLengthShorter(context) *
                2.0 *
                cornerSmallTextSizePercentage,
            corner: MyCornerEnum.topLeft,
            child: Text(debugInfo,
                style: TextStyle(
                    fontSize: MyExtensions.screenLengthShorter(context) *
                        debugTextSizePercentage))),
        MyCornerWidget(
            padding: MyExtensions.screenLengthShorter(context) *
                2.0 *
                cornerSmallTextSizePercentage,
            corner: MyCornerEnum.bottomLeft,
            child: Text(usageInfo,
                style: TextStyle(
                    fontSize: MyExtensions.screenLengthShorter(context) *
                        debugTextSizePercentage))),
        // 下方重新开始按钮
        Consumer<MyModel>(
          builder: (context, model, child) {
            if (model.isOperating) {
              return MyRoundCenterWidget(
                  position: MyRoundEnum.bottomCenter,
                  child: ElevatedButton(
                      onPressed: () {
                        model.restartGame();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: appAccentColor,
                        foregroundColor: Colors.white,
                      ),
                      child: Text("重新开始",
                          style: TextStyle(
                              fontSize:
                                  MyExtensions.screenLengthShorter(context) *
                                      operationButtonTextSizePercentage))));
            } else {
              return SizedBox.shrink();
            }
          },
        ),
      ],
    );
  }
}

class CenterView extends StatelessWidget {
  CenterView({super.key});

  @override
  Widget build(BuildContext context) {
    TextStyle centerLargeTextStyle = TextStyle(
        fontSize: MyExtensions.screenLengthShorter(context) *
            centerLargeTextSizePercentage,
        fontWeight: FontWeight.bold);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Consumer<MyModel>(
          builder: (context, model, child) {
            if (!model.isOperating) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RotatedBox(
                      quarterTurns: 2,
                      child: Text(
                        "西",
                        style: centerLargeTextStyle,
                      ))
                ],
              );
            } else {
              return SizedBox.shrink();
            }
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<MyModel>(
              builder: (context, model, child) {
                if (!model.isOperating) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RotatedBox(
                          quarterTurns: 1,
                          child: Text(
                            "北",
                            style: centerLargeTextStyle,
                          ))
                    ],
                  );
                } else {
                  return SizedBox.shrink();
                }
              },
            ),
            Consumer<MyModel>(
              builder: (context, model, child) {
                return ElevatedButton(
                  onPressed: () {
                    if (!model.isOperating) {
                      debugPrint("pressed lock button");
                      model.startOperating();
                    } else {
                      debugPrint("pressed play button");
                      model.endOperating();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(
                        MyExtensions.screenLengthShorter(context) *
                            centerButtonPaddingSizePercentage),
                    backgroundColor: appAccentColor,
                    foregroundColor: Colors.white,
                  ),
                  child: Icon(
                    model.isOperating
                        ? CupertinoIcons.play
                        : CupertinoIcons.lock,
                    size: MyExtensions.screenLengthShorter(context) *
                        centerButtonIconSizePercentage,
                  ),
                );
              },
            ),
            Consumer<MyModel>(
              builder: (context, model, child) {
                if (!model.isOperating) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RotatedBox(
                          quarterTurns: 3,
                          child: Text(
                            "南",
                            style: centerLargeTextStyle,
                          ))
                    ],
                  );
                } else {
                  return SizedBox.shrink();
                }
              },
            ),
          ],
        ),
        Consumer<MyModel>(
          builder: (context, model, child) {
            if (!model.isOperating) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RotatedBox(
                      quarterTurns: 0,
                      child: Text(
                        "东",
                        style: centerLargeTextStyle,
                      ))
                ],
              );
            } else {
              return SizedBox.shrink();
            }
          },
        ),
      ],
    );
  }
}
