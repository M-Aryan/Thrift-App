import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'utils/popups/popup_controller.dart';
import 'app.dart';
import 'data/repositories/authentication_repository.dart';
import 'firebase_options.dart';
import 'local_storage/sqflite_local/database_controller.dart';

void main() async {
  // Add Widget Binding
  final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  // Init Local Storage
  await GetStorage.init();

  // Await Native Splash
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // Initialize Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then(
    (value) => Get.put(AuthenticationRepository()),
  );

  // Initialize Controllers
  Get.put(TransactionController());
  Get.put(TPopupController());

  // runapp
  runApp(const MainApp());
}
