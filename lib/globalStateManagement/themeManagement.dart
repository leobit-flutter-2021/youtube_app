import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'themes.dart';

class ThemeManagement with ChangeNotifier {
  ThemeData _currentTheme = mainTheme;

  ThemeData get currentTheme => _currentTheme;

  void toggleTheme() {
    _currentTheme = _currentTheme == mainTheme ? secondTheme : mainTheme;
    notifyListeners();
  }
}
