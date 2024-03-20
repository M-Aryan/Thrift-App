import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class TTextButtonTheme {
  TTextButtonTheme._();

  // Light Mode
  static TextButtonThemeData lightTextButtonTheme = TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: TColors.darkGrey,
      elevation: 0,
      textStyle: const TextStyle(fontWeight: FontWeight.w600),
    ),
  );

  // Dark Mode
  static TextButtonThemeData darkTextButtonTheme = TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: TColors.white,
      elevation: 0,
      textStyle: const TextStyle(fontWeight: FontWeight.w600),
    ),
  );
}
