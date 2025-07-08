import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.obscureText = false,
    this.validator,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: const Color(0xFFF5FCF9),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
      ),
      obscureText: obscureText,
      validator: validator,
    );
  }
}
