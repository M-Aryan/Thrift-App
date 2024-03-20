import 'package:flutter/material.dart';

class TNavNavBarTheme {
  TNavNavBarTheme._();

  // LIGHT THEME
  static NavigationBarThemeData lightTNavBarTheme = NavigationBarThemeData(
    height: 80,
    elevation: 0,
    backgroundColor: Colors.blue.shade50,
    indicatorColor: Colors.deepPurple.shade200,
    iconTheme: const MaterialStatePropertyAll(IconThemeData(color: Colors.black)),
  );

  // DARK THEME
  static NavigationBarThemeData darkTNavBarTheme = const NavigationBarThemeData(
    height: 80,
    elevation: 0,
    backgroundColor: Colors.black,
    indicatorColor: Colors.deepPurple,
    iconTheme: MaterialStatePropertyAll(IconThemeData(color: Colors.white)),
  );
}
