import 'package:flutter/material.dart';

ThemeData mainTheme = ThemeData(
  brightness: Brightness.dark,
  bottomNavigationBarTheme:
      const BottomNavigationBarThemeData(selectedItemColor: Colors.white),
);

ThemeData secondTheme = ThemeData(

  brightness: Brightness.light,
  bottomNavigationBarTheme:
      const BottomNavigationBarThemeData(selectedItemColor: Colors.black),

);
