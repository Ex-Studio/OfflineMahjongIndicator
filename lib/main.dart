// [Widgets]
import 'package:flutter/material.dart';
// [Views]
import 'App/context.dart';
// [Data]
import 'package:provider/provider.dart';
import 'package:offlinemahjongindicator/Models/my.dart';
// [Auxiliary]
import 'package:flutter/services.dart';
import 'package:fullscreen/fullscreen.dart';
import 'package:flutter/foundation.dart' show kDebugMode, kIsWeb;
import 'dart:io' show Platform;
// ----------------

void main() {
  // running on the web
  if (kDebugMode || kIsWeb) {
    runApp(MaterialApp(
      theme: ThemeData(primaryColor: Colors.white),
      home: Material(
        child: ChangeNotifierProvider(
          create: (context) => MyModel(),
          child: const ContextView(),
        ),
      ),
      debugShowCheckedModeBanner: false,
      // showSemanticsDebugger: true,
    ));
  } else if (Platform.isAndroid || Platform.isIOS) {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]).then((_) {
      FullScreen.enterFullScreen(FullScreenMode.EMERSIVE_STICKY);
      runApp(MaterialApp(
        theme: ThemeData(primaryColor: Colors.white),
        home: Material(
          child: ChangeNotifierProvider(
            create: (context) => MyModel(),
            child: const ContextView(),
          ),
        ),
      ));
    });
  } else {
    runApp(const MaterialApp(
      home: Material(
        child: Center(child: Text("尚未支持的平台")),
      ),
    ));
  }
}
