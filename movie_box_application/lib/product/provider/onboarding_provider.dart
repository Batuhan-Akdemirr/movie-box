import 'package:flutter/material.dart';

class OnBoardingProvider extends ChangeNotifier {
  bool isChecked = false;
  Color? activeColor;

  void checking(bool? value) {
    isChecked = value ?? false;
    isActiveColor();
    notifyListeners();
  }

  void isActiveColor() {
    if (isChecked) {
      activeColor = Colors.green;
    }
  }
}
