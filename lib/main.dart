import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:playground221107/extension.dart';
import 'extension.dart';

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
    return Center(
      child: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        YxjCornerView(
            padding: 40.0, corner: YxjCorner.topLeft, child: Text("""[DEBUG]
${YxjExtensions.screenWidth(context)}x${YxjExtensions.screenHeight(context)}
\u00a9""")),
        YxjCenterView(),
        YxjCornerView(
            corner: YxjCorner.bottomLeft,
            rotationQuarterTurns: 0,
            child: Text("东1局" + " " + "𝛩" * 2)),
        YxjCornerView(
            corner: YxjCorner.bottomRight,
            rotationQuarterTurns: 1,
            child: Text("东1局" + " " + "𝛩" * 2)),
        YxjCornerView(
            corner: YxjCorner.topRight,
            rotationQuarterTurns: 2,
            child: Text("东1局" + " " + "𝛩" * 2)),
        YxjCornerView(
            corner: YxjCorner.topLeft,
            rotationQuarterTurns: 3,
            child: Text("东1局" + " " + "𝛩" * 2)),
      ],
    );
  }
}

class YxjCenterView extends StatefulWidget {
  const YxjCenterView({super.key});

  @override
  State<YxjCenterView> createState() => _MyViewState();
}

class _MyViewState extends State<YxjCenterView> {
  int counterJu = 0;
  int counterChang = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text("东$counterJu局"),
          SizedBox(width: 50),
          Text("$counterChang本场"),
        ]),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
                onPressed: () {
                  debugPrint("pressed");
                  setState(() {
                    counterJu += 1;
                  });
                },
                child: Text("下一场")),
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
            ElevatedButton(
                onPressed: () {
                  debugPrint("pressed");
                  setState(() {
                    counterChang += 1;
                  });
                },
                child: Text("加本场")),
            ElevatedButton(
                onPressed: () {
                  debugPrint("pressed");
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(16),
                  backgroundColor: Colors.blue, // <-- Button color
                  foregroundColor: Colors.red, // <-- Splash color
                ),
                child: Text("重置")),
          ],
        ),
      ],
    );
  }
}
