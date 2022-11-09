import 'package:provider/provider.dart';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:offlinemahjongindicator/_extensions.dart';
import 'package:offlinemahjongindicator/_models.dart';
import 'package:offlinemahjongindicator/_widgets.dart';
import 'package:offlinemahjongindicator/_constants.dart';

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
    final currentJuChangText = Consumer<MyModel>(
      builder: (context, model, child) {
        return Text(
          "${model.currentJu.description()} ꘖx${model.currentChang}",
          style: TextStyle(
              fontSize: MyExtensions.screenLengthShorter(context,
                  percentage: defaultTextSizePercentage)),
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
            padding: MyExtensions.screenLengthShorter(context,
                percentage: defaultPaddingSizePercentage),
            rotationQuarterTurns: 0,
            child: currentJuChangText),
        MyCornerWidget(
            corner: MyCornerEnum.bottomRight,
            padding: MyExtensions.screenLengthShorter(context,
                percentage: defaultPaddingSizePercentage),
            rotationQuarterTurns: 3,
            child: currentJuChangText),
        MyCornerWidget(
            corner: MyCornerEnum.topRight,
            padding: MyExtensions.screenLengthShorter(context,
                percentage: defaultPaddingSizePercentage),
            rotationQuarterTurns: 2,
            child: currentJuChangText),
        MyCornerWidget(
            corner: MyCornerEnum.topLeft,
            padding: MyExtensions.screenLengthShorter(context,
                percentage: defaultPaddingSizePercentage),
            rotationQuarterTurns: 1,
            child: currentJuChangText),
        // 上方的重置按钮
        Consumer<MyModel>(
          builder: (context, model, child) {
            if (model.isOperating) {
              return MyEdgeCenterWidget(
                  position: MyRoundEnum.topCenter,
                  padding: MyExtensions.screenLengthShorter(context,
                      percentage: defaultPaddingSizePercentage),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            model.resetJu();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: defaultColor,
                            foregroundColor: Colors.white,
                          ),
                          child: Text("重置局",
                              style: TextStyle(
                                  fontSize: MyExtensions.screenLengthShorter(
                                      context,
                                      percentage:
                                          operationTextSizePercentage)))),
                      SizedBox(
                          width: MyExtensions.screenLengthShorter(context,
                              percentage: defaultPaddingSizePercentage)),
                      ElevatedButton(
                          onPressed: () {
                            model.resetChang();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: defaultColor,
                            foregroundColor: Colors.white,
                          ),
                          child: Text("重置场",
                              style: TextStyle(
                                  fontSize: MyExtensions.screenLengthShorter(
                                      context,
                                      percentage:
                                          operationTextSizePercentage))))
                    ],
                  ));
            } else {
              return SizedBox.shrink();
            }
          },
        ),
        // 下方重新开始按钮
        Consumer<MyModel>(
          builder: (context, model, child) {
            if (model.isOperating) {
              return MyEdgeCenterWidget(
                  position: MyRoundEnum.bottomCenter,
                  padding: MyExtensions.screenLengthShorter(context,
                      percentage: defaultPaddingSizePercentage),
                  child: ElevatedButton(
                      onPressed: () {
                        model.restartGame();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: defaultColor,
                        foregroundColor: Colors.white,
                      ),
                      child: Text("重新开始",
                          style: TextStyle(
                              fontSize: MyExtensions.screenLengthShorter(
                                  context,
                                  percentage: operationTextSizePercentage)))));
            } else {
              return SizedBox.shrink();
            }
          },
        ),

        MyEdgeCenterWidget(
            position: MyRoundEnum.bottomCenter,
            padding: MyExtensions.screenLengthShorter(context,
                percentage: defaultPaddingSizePercentage),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // 信息按钮
                MyInfoButtonWidget(
                  infoTitle: Text("线下日麻指示器"),
                  infoContent: Text(appInfo),
                  buttonContent: Icon(
                    CupertinoIcons.info_circle,
                    size: MyExtensions.screenLengthShorter(context,
                        percentage: defaultIconSizePercentage),
                  ),
                ),
                SizedBox(
                    width: MyExtensions.screenWidth(context,
                        percentage: defaultPaddingSizePercentage)),
                // 帮助按钮
                MyInfoButtonWidget(
                  infoTitle: Text("使用帮助"),
                  infoContent: Text(usageInfo),
                  buttonContent: Icon(
                    CupertinoIcons.question_circle,
                    size: MyExtensions.screenLengthShorter(context,
                        percentage: defaultIconSizePercentage),
                  ),
                ),
                SizedBox(
                    width: MyExtensions.screenWidth(context,
                        percentage: defaultTextSizePercentage +
                            defaultPaddingSizePercentage)),
              ],
            )),
      ],
    );
  }
}

class CenterView extends StatelessWidget {
  CenterView({super.key});

  @override
  Widget build(BuildContext context) {
    TextStyle centerLargeTextStyle = TextStyle(
        fontSize: MyExtensions.screenLengthShorter(context,
            percentage: centerLargeTextSizePercentage),
        fontWeight: FontWeight.bold);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // 按钮上方的行
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
        // 按钮所在的中间行
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
                  return MyVerticleAddMinusWidget(
                    iconSize: MyExtensions.screenLengthShorter(context,
                        percentage: operationIconSizePercentage),
                    buttonColor: defaultColor,
                    child: Text("局",
                        style: TextStyle(
                            fontSize: MyExtensions.screenLengthShorter(context,
                                percentage: operationTextSizePercentage))),
                    addCallback: () {
                      model.goNextJu();
                    },
                    minusCallback: () {
                      model.goPreviousJu();
                    },
                  );
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
                    padding: EdgeInsets.all(MyExtensions.screenLengthShorter(
                        context,
                        percentage: centerButtonPaddingSizePercentage)),
                    backgroundColor: defaultColor,
                    foregroundColor: Colors.white,
                  ),
                  child: Icon(
                    model.isOperating
                        ? CupertinoIcons.play
                        : CupertinoIcons.lock,
                    size: MyExtensions.screenLengthShorter(context,
                        percentage: centerButtonIconSizePercentage),
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
                  return MyVerticleAddMinusWidget(
                    iconSize: MyExtensions.screenLengthShorter(context,
                        percentage: operationIconSizePercentage),
                    buttonColor: defaultColor,
                    child: Text("场",
                        style: TextStyle(
                            fontSize: MyExtensions.screenLengthShorter(context,
                                percentage: operationTextSizePercentage))),
                    addCallback: () {
                      model.goNextChang();
                    },
                    minusCallback: () {
                      model.goPreviousChang();
                    },
                  );
                }
              },
            ),
          ],
        ),
        // 按钮下方的行
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
