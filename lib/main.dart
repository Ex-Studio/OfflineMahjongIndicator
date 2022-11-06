import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      child: MyView(),
    );
  }
}

class MyView extends StatefulWidget {
  const MyView({super.key});

  @override
  State<MyView> createState() => _MyViewState();
}

class _MyViewState extends State<MyView> {
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
              },
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                padding: EdgeInsets.all(16),
                backgroundColor: Colors.blue, // <-- Button color
                foregroundColor: Colors.white, // <-- Splash color
              ),
              child: Icon(
                CupertinoIcons.lock,
              ),
            ),
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
