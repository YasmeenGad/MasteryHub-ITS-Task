import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/styles/colors/my_colors.dart';
import '../../../../core/utils/widgets/loading_indicator.dart';

class BookImageWidget extends StatelessWidget {
  final String? imageUrl;

  const BookImageWidget({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return FadeInDown(
      duration: const Duration(milliseconds: 600),
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            height: 240,
            width: 160,
            color: MyColors.white60,
            child: imageUrl != null
                ? CachedNetworkImage(
                    imageUrl: imageUrl!,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => const LoadingIndicator(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.broken_image),
                  )
                : const Icon(Icons.book, size: 60),
          ),
        ),
      ),
    );
  }
}
