import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/widgets/loaders/loaders.dart';
import '../constants/sizes.dart';
import '../../local_storage/sqflite_local/database_controller.dart';
import '../../local_storage/sqflite_local/database_helper.dart';

class TPopupController extends GetxController {
  static TPopupController get instance => Get.find();

  void deleteDataWarningPopUp() {
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(TSizes.lg),
      title: '\nConfirm Deletion',
      middleText: 'Are you sure? Deleting your data is irreversible.',
      confirm: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          side: const BorderSide(color: Colors.red),
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: TSizes.lg),
          child: Text('Delete'),
        ),
        onPressed: () {
          Navigator.of(Get.overlayContext!).pop();
          TransactionDatabase.instance.clearTransactionsTable();
          Get.put(TransactionController());
          TLoaders.successSnackBar(
            title: 'Delete Successful',
            message: 'Your data has been successfully deleted.',
          );
        },
      ),
      cancel: OutlinedButton(
        onPressed: () => Navigator.of(Get.overlayContext!).pop(),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: TSizes.lg),
          child: Text('Cancel'),
        ),
      ),
    );
  }
}
