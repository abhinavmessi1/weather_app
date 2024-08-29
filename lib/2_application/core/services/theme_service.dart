import 'package:flutter/material.dart';

class ThemeServcie extends ChangeNotifier {
  bool toggleTheme = false;
  void switchTheme() {
    toggleTheme = !toggleTheme;
    notifyListeners();
  }
}
