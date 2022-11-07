import 'package:flutter/material.dart';

class YxjGameModel extends ChangeNotifier {
  bool isOperating = false;

  void startOperating() {
    isOperating = true;
    notifyListeners();
  }

  void endOperating() {
    isOperating = false;
    notifyListeners();
  }
}
