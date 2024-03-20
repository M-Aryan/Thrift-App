import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../utils/formatters/formatters.dart';

class UserModel {
  final String id;
  String name;
  String surname;
  final String username;
  final String email;
  String phoneNumber;

  UserModel({
    required this.id,
    required this.name,
    required this.surname,
    required this.username,
    required this.email,
    required this.phoneNumber,
  });

  String get fullName => '$name $surname';

  String get formattedPhoneNumber => TFormatter.formatPhoneNumber(phoneNumber);

  static List<String> nameParts(fullName) => fullName.split(" ");

  static String generateUsername(fullName) {
    List<String> nameParts = fullName.split(" ");
    String name = nameParts[0].toLowerCase();
    String surname = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";

    String camelCaseUsername = "$name$surname";
    String usernamewithprefix = "cwt_$camelCaseUsername";
    return usernamewithprefix;
  }

  static UserModel empty() => UserModel(
        id: '',
        name: '',
        surname: '',
        username: '',
        email: '',
        phoneNumber: '',
      );

  Map<String, dynamic> toJson() {
    return {
      'Name': name,
      'Surname': surname,
      'Username': username,
      'Email': email,
      'PhoneNumber': phoneNumber,
    };
  }

  /// Factory method to create a UserModel from a Firebase document snapshot.
  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return UserModel(
        id: document.id,
        name: data['Name'] ?? '',
        surname: data['Surname'] ?? '',
        username: data['Username'] ?? '',
        email: data['Email'] ?? '',
        phoneNumber: data['PhoneNumber'] ?? '',
      );
    } else {
      return UserModel.empty();
    }
  }
}
