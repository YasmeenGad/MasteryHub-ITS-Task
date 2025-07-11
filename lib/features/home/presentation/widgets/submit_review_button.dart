import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../../../core/styles/colors/my_colors.dart';

class SubmitReviewButton extends StatelessWidget {
  final VoidCallback onPressed;

  const SubmitReviewButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      duration: const Duration(milliseconds: 600),
      child: Center(
        child: ElevatedButton.icon(
          onPressed: onPressed,
          icon: const Icon(Icons.send_rounded),
          label: const Text("Submit Review"),
          style: ElevatedButton.styleFrom(
            backgroundColor: MyColors.primaryColor,
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
      ),
    );
  }
}
