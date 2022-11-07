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

    return Stack(
      children: [
        YxjCornerWidget(
            padding: 40.0, corner: YxjCorner.topLeft, child: Text(debugInfo)),
        YxjCenterView(),
        YxjCornerWidget(
            corner: YxjCorner.bottomLeft,
            rotationQuarterTurns: 0,
            child: Text("东1局" + " " + "𝛩" * 2)),
        YxjCornerWidget(
            corner: YxjCorner.bottomRight,
            rotationQuarterTurns: 1,
            child: Text("东1局" + " " + "𝛩" * 2)),
        YxjCornerWidget(
            corner: YxjCorner.topRight,
            rotationQuarterTurns: 2,
            child: Text("东1局" + " " + "𝛩" * 2)),
        YxjCornerWidget(
            corner: YxjCorner.topLeft,
            rotationQuarterTurns: 3,
            child: Text("东1局" + " " + "𝛩" * 2)),
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
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
          ],
        ),
      ],
    );
  }
}
