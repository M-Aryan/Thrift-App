import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:readsms/readsms.dart';

import '../../../local_storage/sqflite_local/database_controller.dart';
import 'sms_details_extraction.dart';

class SmsDetectionController extends GetxController {
  final _detectSms = Readsms();

  @override
  void onInit() {
    getPermission().then(
      (value) {
        if (value) {
          _detectSms.read();
          _detectSms.smsStream.listen(
            (sms) {

              // Validate Header
              if (SmsDetailsExtraction.headerValidate(sms.sender)) {

                // Methods evoked to extract information from SMS Body
                double tamount = SmsDetailsExtraction().getTransactionAmount(sms.body);
                String ttype = SmsDetailsExtraction().getTransactionType(sms.body);

                // dd information to data
                TransactionController.instance.addTransaction(sms.sender, ttype, tamount);
              }
            },
          );
        }
      },
    );
    super.onInit();
  }

  // Request Permission to access SMS
  Future<bool> getPermission() async {
    if (await Permission.sms.status == PermissionStatus.granted) {
      return true;
    } else {
      if (await Permission.sms.request() == PermissionStatus.granted) {
        return true;
      } else {
        return false;
      }
    }
  }

  @override
  void onClose() {
    super.onClose();
    _detectSms.dispose();
  }
}
