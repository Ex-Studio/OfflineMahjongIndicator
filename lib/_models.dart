import 'package:flutter/material.dart';

class YxjGameModel extends ChangeNotifier {
  // [properties]

  bool isOperating = false;

  void startOperating() {
    isOperating = true;
    notifyListeners();
  }

  void endOperating() {
    isOperating = false;
    notifyListeners();
  }

  MahjongJu currentJu = MahjongJu.dong1;

  void goPreviousJu() {
    currentJu = currentJu.previousOne();
    notifyListeners();
  }

  void goNextJu() {
    currentJu = currentJu.nextOne();
    notifyListeners();
  }

  MahjongChang currentChang = 0;

  void goPreviousChang() {
    if (currentChang > 0) {
      currentChang -= 1;
    }
    notifyListeners();
  }

  void goNextChang() {
    currentChang += 1;
    notifyListeners();
  }

  // [mixed]

  void restartGame() {
    isOperating = false;
    currentJu = MahjongJu.dong1;
    currentChang = 0;
    notifyListeners();
  }
}

enum MahjongJu {
  dong1,
  dong2,
  dong3,
  dong4,
  nan1,
  nan2,
  nan3,
  nan4,
  xi1,
  xi2,
  xi3,
  xi4,
  bei1,
  bei2,
  bei3,
  bei4
}

extension ValueExtension on MahjongJu {
  MahjongJu nextOne() {
    switch (this) {
      case MahjongJu.dong1:
        return MahjongJu.dong2;
      case MahjongJu.dong2:
        return MahjongJu.dong3;
      case MahjongJu.dong3:
        return MahjongJu.dong4;
      case MahjongJu.dong4:
        return MahjongJu.nan1;
      case MahjongJu.nan1:
        return MahjongJu.nan2;
      case MahjongJu.nan2:
        return MahjongJu.nan3;
      case MahjongJu.nan3:
        return MahjongJu.nan4;
      case MahjongJu.nan4:
        return MahjongJu.xi1;
      case MahjongJu.xi1:
        return MahjongJu.xi2;
      case MahjongJu.xi2:
        return MahjongJu.xi3;
      case MahjongJu.xi3:
        return MahjongJu.xi4;
      case MahjongJu.xi4:
        return MahjongJu.bei1;
      case MahjongJu.bei1:
        return MahjongJu.bei2;
      case MahjongJu.bei2:
        return MahjongJu.bei3;
      case MahjongJu.bei3:
        return MahjongJu.bei4;
      case MahjongJu.bei4:
        return MahjongJu.bei4;
    }
  }

  MahjongJu previousOne() {
    switch (this) {
      case MahjongJu.dong1:
        return MahjongJu.dong1;
      case MahjongJu.dong2:
        return MahjongJu.dong1;
      case MahjongJu.dong3:
        return MahjongJu.dong2;
      case MahjongJu.dong4:
        return MahjongJu.dong3;
      case MahjongJu.nan1:
        return MahjongJu.dong4;
      case MahjongJu.nan2:
        return MahjongJu.nan1;
      case MahjongJu.nan3:
        return MahjongJu.nan2;
      case MahjongJu.nan4:
        return MahjongJu.nan3;
      case MahjongJu.xi1:
        return MahjongJu.nan4;
      case MahjongJu.xi2:
        return MahjongJu.xi1;
      case MahjongJu.xi3:
        return MahjongJu.xi2;
      case MahjongJu.xi4:
        return MahjongJu.xi3;
      case MahjongJu.bei1:
        return MahjongJu.xi4;
      case MahjongJu.bei2:
        return MahjongJu.bei1;
      case MahjongJu.bei3:
        return MahjongJu.bei2;
      case MahjongJu.bei4:
        return MahjongJu.bei3;
    }
  }

  String description() {
    switch (this) {
      case MahjongJu.dong1:
        return "東1局";
      case MahjongJu.dong2:
        return "東2局";
      case MahjongJu.dong3:
        return "東3局";
      case MahjongJu.dong4:
        return "東4局";
      case MahjongJu.nan1:
        return "南1局";
      case MahjongJu.nan2:
        return "南2局";
      case MahjongJu.nan3:
        return "南3局";
      case MahjongJu.nan4:
        return "南4局";
      case MahjongJu.xi1:
        return "西1局";
      case MahjongJu.xi2:
        return "西2局";
      case MahjongJu.xi3:
        return "西3局";
      case MahjongJu.xi4:
        return "西4局";
      case MahjongJu.bei1:
        return "北1局";
      case MahjongJu.bei2:
        return "北2局";
      case MahjongJu.bei3:
        return "北3局";
      case MahjongJu.bei4:
        return "北4局";
    }
  }
}

typedef MahjongChang = int;
