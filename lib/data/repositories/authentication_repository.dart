import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../features/authentication/screens/login/login.dart';
import '../../features/authentication/screens/onboarding/onboarding.dart';
import '../../features/authentication/screens/signup/verify_email.dart';
import '../../navigation_menu.dart';
import '../models/sms_processing/sms_controller.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  // variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  /// Get Authenticated User Data
  User? get authUser => _auth.currentUser;

  // called from main.dart on app launch
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  screenRedirect() async {
    final user = _auth.currentUser;
    if (user != null) {
      if (user.emailVerified) {
        Get.offAll(() => const BottomNavigationMenu());
        // Initilaize SMS Detection Controller
        Get.put(SmsDetectionController());
      } else {
        Get.offAll(() => EmailVerficiationScreen(email: _auth.currentUser?.email));
      }
    } else {
      // Local Storage
      deviceStorage.writeIfNull('isFirstTime', true);
      deviceStorage.read('isFirstTime') != true ? Get.offAll(() => const LoginScreen()) : Get.offAll(const OnBoardingScreen());
    }
  }

  //---------------------------------------- Email & Password Sign-In ---------------------------------//

  /// [Email Authentication] - Sign In
  Future<UserCredential> loginWithEmailAndPassword(String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }

  /// [Email Authentication] - Register
  Future<UserCredential> registerWithEmailAndPassword(String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }

  /// [ReAuthenti5cation] - Reauthenticate User

  /// [Email Verification] - Mail Verification
  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }

  /// [Email Authentication] - Forget Password

  //----------------------------------- Federated identity & Social Sign-In --------------------------//

  /// [Google Authentication] - Google

  /// [Facebook Authentication] - Facebook

  //----------------------------------- Federated identity & Social Sign-In --------------------------//

  /// [Logout User] - Valid for any authentication
  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => const LoginScreen());
    } catch (e) {
      throw 'Something went wrong. Please try again later.';
    }
  }

  init() {}

  /// [Delete User] - Remove user Auth and Firestore Account.
}
