import 'dart:math';

import 'package:flutter/material.dart';

class Extension {
  static double screenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double screenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double screenLengthShorter(BuildContext context) {
    return min(Extension.screenWidth(context), Extension.screenHeight(context));
  }
}
