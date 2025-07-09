import 'package:firebase_auth/firebase_auth.dart';
import 'error_model.dart';

class FirebaseErrorHandler {
  static ErrorModel handle(Exception error) {
    if (error is FirebaseAuthException) {
      switch (error.code) {
        case 'invalid-email':
          return const ErrorModel(
              error: "The email address is badly formatted.");
        case 'user-disabled':
          return const ErrorModel(error: "This user has been disabled.");
        case 'user-not-found':
          return const ErrorModel(error: "No user found with this email.");
        case 'wrong-password':
          return const ErrorModel(
              error: "Incorrect password. Please try again.");
        case 'email-already-in-use':
          return const ErrorModel(error: "This email is already registered.");
        case 'weak-password':
          return const ErrorModel(error: "Password is too weak.");
        case 'operation-not-allowed':
          return const ErrorModel(
              error: "Operation not allowed. Please contact support.");
        default:
          return ErrorModel(
              error: error.message ?? "Something went wrong. Try again.");
      }
    } else {
      return const ErrorModel(error: "An unknown error occurred. Please try again.");
    }
  }
}
