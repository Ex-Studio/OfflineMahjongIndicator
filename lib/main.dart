import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter/cupertino.dart';

import 'package:playground221107/extension.dart';
import 'package:playground221107/model.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: ChangeNotifierProvider(
          create: (context) => YxjGameModel(),
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
${YxjExtensions.screenWidth(context)}x${YxjExtensions.screenHeight(context)}
""";

    String usageInfo = """
[使用说明]
将手机朝东家横向放置
长按解锁按键进行操作
""";

    return Stack(
      children: [
        YxjCornerWidget(
            padding: 40.0, corner: YxjCorner.topLeft, child: Text(debugInfo)),
        YxjCornerWidget(
            padding: 40.0,
            corner: YxjCorner.bottomLeft,
            child: Text(usageInfo)),
        YxjCenterView(),
        YxjCornerWidget(
            corner: YxjCorner.bottomLeft,
            rotationQuarterTurns: 0,
            child: Text("東1局" + " " + "ꘖ" * 2)),
        YxjCornerWidget(
            corner: YxjCorner.bottomRight,
            rotationQuarterTurns: 3,
            child: Text("東1局" + " " + "ꘖ" * 2)),
        YxjCornerWidget(
            corner: YxjCorner.topRight,
            rotationQuarterTurns: 2,
            child: Text("東1局" + " " + "ꘖ" * 2)),
        YxjCornerWidget(
            corner: YxjCorner.topLeft,
            rotationQuarterTurns: 1,
            child: Text("東1局" + " " + "ꘖ" * 2)),
      ],
    );
  }
}

class YxjCenterView extends StatelessWidget {
  YxjCenterView({super.key});

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
                Consumer<YxjGameModel>(
                  builder: (context, model, child) {
                    return ElevatedButton(
                      onPressed: () {
                        debugPrint("pressed lock button");
                        if (!model.isOperating) {
                          model.startOperating();
                        } else {
                          model.endOperating();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        // shape: CircleBorder(),
                        padding: EdgeInsets.all(
                            YxjExtensions.screenLengthShorter(context) * 0.04),
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                      ),
                      child: Icon(
                        model.isOperating
                            ? CupertinoIcons.play
                            : CupertinoIcons.lock,
                        size: YxjExtensions.screenLengthShorter(context) * 0.10,
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
