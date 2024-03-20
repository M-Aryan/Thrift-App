import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../features/authentication/models/user_model.dart';
import '../authentication_repository.dart';


class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Function to store user data in firestore.
  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection("Users").doc(user.id).set(user.toJson());
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }

  /// Function to Fetch user details based on user ID
  Future<UserModel> fetchUserDetails() async {
    try {
      final documentSnapshot = await _db.collection("Users").doc(AuthenticationRepository.instance.authUser?.uid).get();
      if (documentSnapshot.exists) {
        return UserModel.fromSnapshot(documentSnapshot);
      } else {
        return UserModel.empty();
      }
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }

  /// Function to update user data in Firestore
  Future<void> updateUserDetails(UserModel updatedUser) async {
    try {
      await _db.collection("Users").doc(updatedUser.id).update(updatedUser.toJson());
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }

  /// Update any field in specific User Collection
  Future<void> updateSingleField(Map<String, dynamic> json) async {
    try {
      await _db.collection("Users").doc().update(json);
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }

  /// Function to remove user data from Firestore
}
