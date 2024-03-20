import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'bindings/general_bindings.dart';
import 'utils/constants/colors.dart';
import 'utils/theme/theme.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        theme: TAppTheme.lightTheme,
        darkTheme: TAppTheme.darkTheme,
        initialBinding: GeneralBindings(),

        // Show Loader or Circular Progress Indicator meanwhile Authenitcation Repository decides to show relevant screen
        home: const Scaffold(
          backgroundColor: TColors.primary,
          body: Center(child: CircularProgressIndicator(color: Colors.white)),
        ));
  }
}
