import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class ViewAllReviewsButton extends StatelessWidget {
  final VoidCallback onPressed;

  const ViewAllReviewsButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      duration: const Duration(milliseconds: 500),
      child: Center(
        child: TextButton.icon(
          onPressed: onPressed,
          icon: const Icon(Icons.visibility),
          label: const Text("View All Reviews"),
        ),
      ),
    );
  }
}
