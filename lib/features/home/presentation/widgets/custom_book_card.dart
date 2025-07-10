import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mastery_hub_its_task/core/utils/extension/media_query_values.dart';

import '../../../../core/styles/colors/my_colors.dart';
import '../../../../core/styles/fonts/my_fonts.dart';
import '../../../../core/utils/widgets/loading_indicator.dart';

class CustomBookCard extends StatelessWidget {
  final dynamic book;
  final String flag; // 'search' or 'default'

  const CustomBookCard({
    super.key,
    required this.book,
    required this.flag,
  });

  @override
  Widget build(BuildContext context) {
    final volume = book.volumeInfo;
    final imageUrl = volume?.imageLinks?.thumbnail;

    return Container(
      decoration: BoxDecoration(
        color: MyColors.white60,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Container(
              height: context.height * 0.18,
              width: double.infinity,
              decoration: BoxDecoration(
                color: MyColors.white60,
              ),
              child: imageUrl != null
                  ? CachedNetworkImage(
                      imageUrl: imageUrl,
                      fit: BoxFit.cover,
                      placeholder: (context, url) =>
                          const Center(child: LoadingIndicator()),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.broken_image_outlined, size: 40),
                    )
                  : const Center(
                      child: Icon(Icons.menu_book_rounded, size: 40)),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            volume?.title ?? 'No Title',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: MyFonts.styleMedium500_14.copyWith(
              color: MyColors.primaryColor,
              height: 1.3,
            ),
          ),
          const SizedBox(height: 6),
          if (flag == 'default')
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.person_outline_rounded,
                    size: 16, color: Colors.grey),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    volume?.authors?.join(", ") ?? "Unknown Author",
                    style: MyFonts.styleRegular400_12.copyWith(
                      color: Colors.grey.shade600,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
