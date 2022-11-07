import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter/cupertino.dart';

import 'package:playground221107/_extensions.dart';
import 'package:playground221107/_models.dart';
import 'package:playground221107/_widgets.dart';

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

    final currentJuChangText = Consumer<MyModel>(
      builder: (context, model, child) {
        return Text("${model.currentJu.description()} ꘖx${model.currentChang}");
      },
    );

    return Stack(
      children: [
        MyCornerWidget(
            padding: 40.0,
            corner: MyCornerEnum.topLeft,
            child: Text(debugInfo)),
        MyCornerWidget(
            padding: 40.0,
            corner: MyCornerEnum.bottomLeft,
            child: Text(usageInfo)),
        CenterView(),
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
      ],
    );
  }
}

class CenterView extends StatelessWidget {
  CenterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [RotatedBox(quarterTurns: 2, child: Text("西"))],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RotatedBox(quarterTurns: 1, child: Text("北")),
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
                        // shape: CircleBorder(),
                        padding: EdgeInsets.all(
                            MyExtensions.screenLengthShorter(context) * 0.04),
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                      ),
                      child: Icon(
                        model.isOperating
                            ? CupertinoIcons.play
                            : CupertinoIcons.lock,
                        size: MyExtensions.screenLengthShorter(context) * 0.10,
                      ),
                    );
                  },
                ),
                RotatedBox(quarterTurns: 3, child: Text("南")),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [RotatedBox(quarterTurns: 0, child: Text("東"))],
            ),
          ],
        ),
      ],
    );
  }
}
