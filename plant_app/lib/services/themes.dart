import 'package:flutter/material.dart';

class ThemesProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;

  bool get isDarkMode => themeMode == ThemeMode.dark;

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class MyThemes {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade900,
    bottomAppBarColor: Colors.black12,
    primaryColor: Colors.black,
    colorScheme: ColorScheme.dark(primary: Colors.green.shade200),
    iconTheme: IconThemeData(color: Colors.green.shade200),
  );
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    bottomAppBarColor: Colors.green,
    primaryColor: Colors.white,
    colorScheme: ColorScheme.light(
      primary: Colors.green.shade600,
    ),
  );
}
