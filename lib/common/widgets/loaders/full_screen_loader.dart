import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/helpers/helper_function.dart';
import 'animation_loader.dart';

/// A Utility class for managing a full-screen loading dialog.

class TFullScreenLoader {
  /// Open a full-screen loading dialog with a given text and animation.
  /// This method doesn't return anything.
  ///
  /// Parameters:
  ///   - text: The text to be displayed in the loading dialog.
  ///   - animation: The Lottie Animation to be shown.
  static void openLoadingDialog(String text) {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (_) => PopScope(
        canPop: false,
        child: Container(
          color: THelperFunction.isDarkMode(Get.context!) ? TColors.black : const Color.fromARGB(255, 223, 210, 243),
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              const SizedBox(height: 250),
              TAnimationLoaderWidget(text: text),
            ],
          ),
        ),
      ),
    );
  }

  /// Stop the currently open loading.
  /// This method doesn't return anything.
  static stopLoading() {
    Navigator.of(Get.overlayContext!).pop();
  }
}
