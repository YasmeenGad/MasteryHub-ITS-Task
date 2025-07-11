import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../../../core/styles/fonts/my_fonts.dart';

class BookInfoWidget extends StatelessWidget {
  final String? title;
  final List<String?>? authors;

  const BookInfoWidget({super.key, this.title, this.authors});

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      duration: const Duration(milliseconds: 500),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title ?? "Unknown Title", style: MyFonts.styleMedium500_20),
          const SizedBox(height: 8),
          Text(authors?.join(", ") ?? "Unknown Author",
              style: MyFonts.styleRegular400_14.copyWith(color: Colors.grey)),
        ],
      ),
    );
  }
}
