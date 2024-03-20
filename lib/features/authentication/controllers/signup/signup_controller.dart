import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/loaders/full_screen_loader.dart';
import '../../../../common/widgets/loaders/loaders.dart';
import '../../../../data/repositories/authentication_repository.dart';
import '../../../../data/repositories/authentication/user_repository.dart';
import '../../../../utils/device/network_manager.dart';
import '../../models/user_model.dart';
import '../../screens/signup/verify_email.dart';


class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  // Variables
  final hidePassword = true.obs; // Observable for hiding/showing password
  final privacyPolicy = true.obs; // Observable for privacy policy acceptance.
  final email = TextEditingController();
  final surname = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final name = TextEditingController();
  final phoneNumber = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  // Sign Up
  Future<void> signup() async {
    try {
      // Start Loading
      TFullScreenLoader.openLoadingDialog('We are processing your information');

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!signupFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Privacy Policy Check
      if (!privacyPolicy.value) {
        TFullScreenLoader.stopLoading();
        TLoaders.warningSnackBar(
          title: 'Accept Privacy Policy',
          message: 'In Order to create account, you must accept the Privacy Policy and Use Terms.',
        );
        return;
      }

      // Register user in firebase authentication and & save user data in firebase
      final userCredential = await AuthenticationRepository.instance.registerWithEmailAndPassword(email.text.trim(), password.text.trim());

      // save authenticated user data in the firebase firestore
      final newUser = UserModel(
        id: userCredential.user!.uid,
        name: name.text.trim(),
        surname: surname.text.trim(),
        username: username.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      // show success message
      TLoaders.successSnackBar(
        title: 'Congratulations!',
        message: 'Your Account has been created! Verify Email to continue.',
      );

      // move to verify email screen
      Get.to(() => EmailVerficiationScreen(
            email: email.text.trim(),
          ));

      //
    } catch (e) {
      // Generic Error
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
