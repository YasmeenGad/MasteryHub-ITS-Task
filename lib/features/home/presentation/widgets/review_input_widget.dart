import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../../../core/styles/colors/my_colors.dart';
import '../../../../core/styles/fonts/my_fonts.dart';

class ReviewInputWidget extends StatelessWidget {
  final TextEditingController controller;

  const ReviewInputWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return FadeInRight(
      duration: const Duration(milliseconds: 500),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Leave a Review", style: MyFonts.styleMedium500_16),
          const SizedBox(height: 8),
          TextField(
            controller: controller,
            maxLines: 5,
            decoration: InputDecoration(
              hintText: "Write your thoughts...",
              filled: true,
              fillColor: MyColors.white60,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
