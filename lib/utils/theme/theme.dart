import 'package:flutter/material.dart';

import 'custom_themes/appbar_theme.dart';
import 'custom_themes/bottom_sheet_theme.dart';
import 'custom_themes/checkbox_theme.dart';
import 'custom_themes/chip_theme.dart';
import 'custom_themes/elevated_button_theme.dart';
import 'custom_themes/navigation_bar_theme.dart';
import 'custom_themes/outlined_button_theme.dart';
import 'custom_themes/text_theme.dart';
import 'custom_themes/textbutton_theme.dart';
import 'custom_themes/textform_fields_theme.dart';

class TAppTheme {
  TAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.deepPurple,
    scaffoldBackgroundColor: const Color.fromARGB(255, 223, 210, 243),
    textTheme: TTextTheme.lightTextTheme,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
    appBarTheme: TAppBarTheme.lightThemeAppBar,
    bottomSheetTheme: TBottomSheetTheme.lightBottomSheetTheme,
    chipTheme: TChipTheme.lightChipTheme,
    inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme,
    navigationBarTheme: TNavNavBarTheme.lightTNavBarTheme,
    checkboxTheme: TCheckBoxTheme.lightCheckBoxTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme,
    textButtonTheme: TTextButtonTheme.lightTextButtonTheme,
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.deepPurple,
    scaffoldBackgroundColor: Colors.grey.shade900,
    textTheme: TTextTheme.darkTextTheme,
    elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
    appBarTheme: TAppBarTheme.darkThemeAppBar,
    bottomSheetTheme: TBottomSheetTheme.darkBottomSheetTheme,
    chipTheme: TChipTheme.darkChipTheme,
    inputDecorationTheme: TTextFormFieldTheme.darkInputDecorationTheme,
    navigationBarTheme: TNavNavBarTheme.darkTNavBarTheme,
    checkboxTheme: TCheckBoxTheme.darkCheckBoxTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTheme,
    textButtonTheme: TTextButtonTheme.darkTextButtonTheme,
  );
}
