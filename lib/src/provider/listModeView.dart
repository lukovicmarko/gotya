import 'package:flutter/material.dart';

class ListModeView with ChangeNotifier {
  bool isActive = false;

  int countValue = 2;

  int aspectWidth = 2;

  int aspectHeight = 1;

  void changeListMode() async {
    if (countValue == 2) {
      countValue = 1;
      aspectWidth = 3;
      aspectHeight = 1;
    } else {
      countValue = 2;
      aspectWidth = 2;
      aspectHeight = 2;
    }
    notifyListeners();
  }

  void changeGridMode() {
    countValue = 2;
    aspectWidth = 2;
    aspectHeight = 2;
    notifyListeners();
  }

  void changeIsActiveTrue() {
    isActive = true;
    notifyListeners();
  }

  void changeIsActiveFalse() {
    isActive = false;
    notifyListeners();
  }

  ListModeView() {
    changeListMode();
  }
}
