import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mastery_hub_its_task/core/utils/extension/media_query_values.dart';
import 'package:mastery_hub_its_task/features/home/domain/entities/response/get_books_response_entity.dart';

import '../../../../core/styles/colors/my_colors.dart';
import '../../../../core/styles/fonts/my_fonts.dart';
import '../../../../core/utils/widgets/loading_indicator.dart';

class CustomBookCard extends StatelessWidget {
  final GetBooksResponseEntityItems book;

  const CustomBookCard({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    final volume = book.volumeInfo;
    final imageUrl = volume?.imageLinks?.thumbnail;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: SizedBox(
              height: context.height * 0.18,
              width: double.infinity,
              child: imageUrl != null
                  ? CachedNetworkImage(
                      imageUrl: imageUrl,
                      fit: BoxFit.cover,
                      placeholder: (context, url) =>
                          Center(child: LoadingIndicator()),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    )
                  : const Center(child: Icon(Icons.book, size: 40)),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            volume?.title ?? 'No Title',
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: MyFonts.styleMedium500_14.copyWith(
              color: MyColors.primaryColor,
              height: 1.3,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            volume?.authors?.join(", ") ?? "Unknown Author",
            style: MyFonts.styleRegular400_12.copyWith(
              color: Colors.grey[600],
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
