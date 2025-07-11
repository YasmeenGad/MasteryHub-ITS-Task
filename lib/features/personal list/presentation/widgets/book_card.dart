import 'package:flutter/material.dart';
import 'package:mastery_hub_its_task/core/styles/colors/my_colors.dart';
import 'package:mastery_hub_its_task/core/styles/fonts/my_fonts.dart';

class BookCard extends StatelessWidget {
  final Map<String, dynamic> book;

  const BookCard({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    final volumeInfo = book['volumeInfo'];
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: MyColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
              color: Colors.black12, blurRadius: 5, offset: const Offset(0, 3)),
        ],
      ),
      child: Row(
        children: [
          Image.network(
            volumeInfo['imageLinks']?['thumbnail'] ?? '',
            width: 60,
            height: 90,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => const Icon(Icons.broken_image),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(volumeInfo['title'] ?? 'Unknown',
                    style: MyFonts.styleBold700_14,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis),
                const SizedBox(height: 6),
                Text(
                  (volumeInfo['authors'] as List?)?.join(", ") ??
                      'Unknown Author',
                  style:
                      MyFonts.styleRegular400_13.copyWith(color: Colors.grey),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
