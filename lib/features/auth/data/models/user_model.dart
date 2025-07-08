import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  final String uid;
  final String? email;
  final String? userName;

  const UserModel({
    required this.uid,
    this.email,
    this.userName,
  });

  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
      uid: user.uid,
      email: user.email,
      userName: user.displayName,
    );
  }
}
