// [Widgets]
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:offlinemahjongindicator/App/help_button.dart';
import 'package:offlinemahjongindicator/App/info_button.dart';
import 'package:offlinemahjongindicator/Widgets/my.dart';
// [Views]
// [Data]
import 'package:provider/provider.dart';
import 'package:offlinemahjongindicator/Models/my.dart';
import 'package:offlinemahjongindicator/Constants/my.dart';
// [Auxiliary]
import 'package:offlinemahjongindicator/Extensions/my.dart';
// ----------------

class ContextView extends StatelessWidget {
  const ContextView({super.key});

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

    Widget contextView = Stack(
      children: [
        // 中间的解锁按钮和东南西北
        const CenterView(),
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

        // 右上角小按钮
        MyEdgeCenterWidget(
            position: MyRoundEnum.rightCenter,
            padding: MyExtensions.screenLengthShorter(context,
                percentage: defaultPaddingSizePercentage),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                    height: MyExtensions.screenLengthShorter(context,
                        percentage: 0.2)),

                // 信息按钮
                const InfoButtonView(),

                SizedBox(
                    height: MyExtensions.screenLengthShorter(context,
                        percentage: defaultPaddingSizePercentage)),

                // 帮助按钮
                const HelpButtonView(),
              ],
            )),
      ],
    );
    return contextView;
  }
}

class CenterView extends StatelessWidget {
  const CenterView({super.key});

  @override
  Widget build(BuildContext context) {
    TextStyle centerLargeTextStyle = TextStyle(
        fontSize: MyExtensions.screenLengthShorter(context,
            percentage: centerLargeTextSizePercentage),
        fontWeight: FontWeight.bold);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // 中央按钮上方
        Consumer<MyModel>(
          builder: (context, model, child) {
            if (!model.isOperating) {
              return RotatedBox(
                  quarterTurns: 2,
                  child: Text(
                    juCharacters[2],
                    style: centerLargeTextStyle,
                  ));
            } else {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyDestructiveButtonWidget(
                    infoTitle: const Text("重置局数"),
                    infoContent: const Text("重置局数会将当前局数置为東1局"),
                    buttonContent: Text("重置局数",
                        style: TextStyle(
                            fontSize: MyExtensions.screenLengthShorter(context,
                                percentage: operationTextSizePercentage))),
                    destructiveCallback: () {
                      model.resetJu();
                    },
                  ),
                  SizedBox(
                      width: MyExtensions.screenLengthShorter(context,
                          percentage: defaultPaddingSizePercentage)),
                  MyDestructiveButtonWidget(
                    infoTitle: const Text("重置场数"),
                    infoContent: const Text("重置场数会将当前本场数置为0"),
                    buttonContent: Text("重置场数",
                        style: TextStyle(
                            fontSize: MyExtensions.screenLengthShorter(context,
                                percentage: operationTextSizePercentage))),
                    destructiveCallback: () {
                      model.resetChang();
                    },
                  ),
                ],
              );
            }
          },
        ),

        SizedBox(
            height: MyExtensions.screenLengthShorter(context,
                percentage: defaultPaddingSizePercentage)),

        // 中央按钮所在的中间行
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 中央按钮左侧
            Consumer<MyModel>(
              builder: (context, model, child) {
                if (!model.isOperating) {
                  return RotatedBox(
                      quarterTurns: 1,
                      child: Text(
                        juCharacters[3],
                        style: centerLargeTextStyle,
                      ));
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

            SizedBox(
                width: MyExtensions.screenLengthShorter(context,
                    percentage: defaultPaddingSizePercentage)),

            // 中央按钮
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

            SizedBox(
                width: MyExtensions.screenLengthShorter(context,
                    percentage: defaultPaddingSizePercentage)),

            // 中央按钮右侧
            Consumer<MyModel>(
              builder: (context, model, child) {
                if (!model.isOperating) {
                  return RotatedBox(
                      quarterTurns: 3,
                      child: Text(
                        juCharacters[1],
                        style: centerLargeTextStyle,
                      ));
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

        SizedBox(
            height: MyExtensions.screenLengthShorter(context,
                percentage: defaultPaddingSizePercentage)),

        // 中央按钮下方
        Consumer<MyModel>(
          builder: (context, model, child) {
            if (!model.isOperating) {
              return RotatedBox(
                  quarterTurns: 0,
                  child: Text(
                    juCharacters[0],
                    style: centerLargeTextStyle,
                  ));
            } else {
              return MyDestructiveButtonWidget(
                infoTitle: const Text("重新开始"),
                infoContent: const Text("重新开始会将当前进度置为 東1局0本场"),
                buttonContent: Text("重新开始",
                    style: TextStyle(
                        fontSize: MyExtensions.screenLengthShorter(context,
                            percentage: operationTextSizePercentage))),
                destructiveCallback: () {
                  model.restartGame();
                },
              );
            }
          },
        ),
      ],
    );
  }
}
