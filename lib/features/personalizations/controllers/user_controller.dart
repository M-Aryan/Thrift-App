import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/widgets/loaders/loaders.dart';
import '../../../data/repositories/authentication_repository.dart';
import '../../../data/repositories/authentication/user_repository.dart';
import '../../../utils/constants/sizes.dart';
import '../../authentication/models/user_model.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();
  Rx<UserModel> user = UserModel.empty().obs;
  final profileLoading = false.obs;
  final userRepository = Get.put(UserRepository());

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  // Fetch user Record
  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  /// Save User Record from any Registration provider.
  Future<void> saveUserRecord(UserCredential? userCredential) async {
    try {
      if (userCredential != null) {
        // convert Name to Name and Surname (FirstName and LastName)
        final nameParts = UserModel.nameParts(userCredential.user!.displayName ?? '');
        final username = UserModel.generateUsername(userCredential.user!.displayName ?? '');

        // Map Data
        final user = UserModel(
          id: userCredential.user!.uid,
          name: nameParts[0],
          surname: nameParts.length > 1 ? nameParts.sublist(1).join('') : '',
          username: username,
          email: userCredential.user!.email ?? '',
          phoneNumber: userCredential.user!.phoneNumber ?? '',
        );

        await userRepository.saveUserRecord(user);
      }
    } catch (e) {
      TLoaders.warningSnackBar(
        title: 'Data not saved',
        message: 'Something went wrong while saving your information. You can re-save your data in your profile',
      );
    }
  }

  void signOutWarningPopup() {
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(TSizes.lg),
      title: '\nConfirm Sign Out',
      middleText: 'Are you sure you want to sign out of your account?',
      confirm: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          side: const BorderSide(color: Colors.red),
        ),
        child: const Padding(padding: EdgeInsets.symmetric(horizontal: TSizes.lg), child: Text('Sign Out')),
        onPressed: () {
          AuthenticationRepository.instance.logout();
          TLoaders.successSnackBar(
            title: 'Sign Out Successful!',
            message: 'You have been successfully signed out of your account.',
          );
        },
      ),
      cancel: OutlinedButton(
        onPressed: () => Navigator.of(Get.overlayContext!).pop(),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: TSizes.lg),
          child: Text(
            'Cancel',
          ),
        ),
      ),
    );
  }
}
