// [Widgets]
import 'package:flutter/cupertino.dart';
// [Views]
// [Data]
import 'package:offlinemahjongindicator/Constants/my.dart';
import 'package:offlinemahjongindicator/version.dart';
// [Auxiliary]
import 'package:offlinemahjongindicator/Extensions/my.dart';
import 'package:url_launcher/url_launcher.dart';
// ----------------

class InfoButtonView extends StatelessWidget {
  const InfoButtonView({
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
              title: const Text("线下日麻指示器"),
              content: const Text("v$version"),
              actions: <CupertinoDialogAction>[
                CupertinoDialogAction(
                  onPressed: () {
                    launchUrl(Uri.parse(
                        "https://github.com/Ex-Studio/OfflineMahjongIndicator/releases"));
                    Navigator.pop(context);
                  },
                  child: const Text("获取最新安卓应用"),
                ),
                CupertinoDialogAction(
                  onPressed: () {
                    launchUrl(Uri.parse(
                        "https://github.com/Ex-Studio/OfflineMahjongIndicator"));
                    Navigator.pop(context);
                  },
                  child: const Text("查看开源仓库"),
                ),
                CupertinoDialogAction(
                  onPressed: () {
                    launchUrl(Uri.parse(
                        "https://github.com/Ex-Studio/OfflineMahjongIndicator/issues/new"));
                    Navigator.pop(context);
                  },
                  child: const Text("问题反馈"),
                ),
                CupertinoDialogAction(
                  onPressed: () {
                    launchUrl(Uri.parse("https://github.com/Yang-Xijie"));
                    Navigator.pop(context);
                  },
                  child: const Text("查看开发者信息"),
                ),
                CupertinoDialogAction(
                  onPressed: () {
                    launchUrl(Uri.parse(
                        "https://yang-xijie.github.io/ABOUT/support"));
                    Navigator.pop(context);
                  },
                  child: const Text("支持开发者"),
                ),
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
        CupertinoIcons.info_circle,
        size: MyExtensions.screenLengthShorter(context,
            percentage: defaultIconSizePercentage),
      ), // remove padding
    );
  }
}
