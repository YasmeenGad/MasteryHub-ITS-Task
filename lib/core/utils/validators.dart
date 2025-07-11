import 'package:flutter/material.dart';

class Validators {
  static String? validateNotEmpty({
    required String? title,
    required String? value,
    required BuildContext context,
  }) {
    if (_isEmpty(value)) {
      return '$title can\'t be empty';
    }
    return null;
  }

  static String? validateEmail(String? value, BuildContext context) {
    if (_isEmpty(value)) {
      return 'Email can\'t be empty';
    }

    final regex = RegExp(
      r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
    );

    if (!regex.hasMatch(value!.trim())) {
      return 'Enter a valid email address';
    }

    return null;
  }

  static String? validatePassword(String? value, BuildContext context) {
    if (_isEmpty(value)) {
      return 'Password can\'t be empty';
    }

    if (value!.length < 6) {
      return 'Password must be at least 6 characters';
    }

    return null;
  }

  static bool _isEmpty(String? value) {
    return value == null || value.trim().isEmpty;
  }
}
