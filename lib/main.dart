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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text('Row 1'), Text('Row 2'), MyView()],
      ),
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
        Text("东$counterJu局"),
        Text("$counterChang本场"),
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
                  setState(() {
                    counterChang += 1;
                  });
                },
                child: Text("加一本场")),
          ],
        ),
      ],
    );
  }
}
