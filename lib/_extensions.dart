import 'package:flutter/material.dart';

import 'dart:math';

class MyExtensions {
  static double screenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double screenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double screenLengthShorter(BuildContext context,
      {double percentage = 1.0}) {
    return percentage *
        min(MyExtensions.screenWidth(context),
            MyExtensions.screenHeight(context));
  }
}
