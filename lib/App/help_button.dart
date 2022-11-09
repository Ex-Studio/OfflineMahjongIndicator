// [Widgets]
import 'package:flutter/cupertino.dart';
// [Views]
// [Data]
import 'package:offlinemahjongindicator/Constants/my.dart';
// [Auxiliary]
import 'package:offlinemahjongindicator/Extensions/my.dart';
// ----------------

class HelpButtonView extends StatelessWidget {
  const HelpButtonView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: () {
        showCupertinoDialog<void>(
          context: context,
          builder: (BuildContext context) {
            Widget alertDialog = CupertinoAlertDialog(
              title: const Text("使用帮助"),
              content: const Center(child: Text("""将「東」朝向亲家放置
长按解锁按键进行操作""")),
              actions: <CupertinoDialogAction>[
                CupertinoDialogAction(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  isDefaultAction: true,
                  child: const Text("关闭"),
                ),
              ],
            );
            return alertDialog;
          },
        );
      },
      padding: EdgeInsets.zero, // remove padding
      minSize: 0.0,
      child: Icon(
        CupertinoIcons.question_circle,
        size: MyExtensions.screenLengthShorter(context,
            percentage: defaultIconSizePercentage),
      ), // remove padding
    );
  }
}
