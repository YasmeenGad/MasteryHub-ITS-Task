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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            width: context.width * 0.4,
            height: context.height * 0.2,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: MyColors.green.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: imageUrl != null
                ? CachedNetworkImage(
                    imageUrl: imageUrl,
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>
                        Center(child: LoadingIndicator()),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  )
                : LoadingIndicator()),
        const SizedBox(height: 6),
        Text(
          volume?.title ?? 'No Title',
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          style: MyFonts.styleRegular400_12.copyWith(color: MyColors.black),
        ),
      ],
    );
  }
}
