import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/styles/fonts/my_fonts.dart';

class RatingWidget extends StatelessWidget {
  final double userRating;
  final ValueChanged<double> onRatingUpdate;

  const RatingWidget(
      {super.key, required this.userRating, required this.onRatingUpdate});

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      duration: const Duration(milliseconds: 500),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Your Rating", style: MyFonts.styleMedium500_16),
          const SizedBox(height: 8),
          RatingBar.builder(
            initialRating: userRating,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemSize: 26.sp,
            itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) =>
                const Icon(Icons.star, color: Colors.amber),
            onRatingUpdate: onRatingUpdate,
          ),
        ],
      ),
    );
  }
}
