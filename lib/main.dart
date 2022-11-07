import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:playground221107/extension.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: ContextView(),
      ),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class ContextView extends StatelessWidget {
  ContextView({super.key});

  @override
  Widget build(BuildContext context) {
    final String debugInfo = """
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
  const YxjCenterView({super.key});

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
                ElevatedButton(
                  onPressed: () {
                    debugPrint("pressed");
                  },
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(16),
                    backgroundColor: Colors.blue, // <-- Button color
                    foregroundColor: Colors.white, // <-- Splash color
                  ),
                  child: Icon(
                    CupertinoIcons.lock,
                    size: YxjExtensions.screenLengthShorter(context) * 0.1,
                  ),
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
