import 'package:flutter/material.dart';
import 'package:mastery_hub_its_task/features/home/presentation/widgets/book_image_widget.dart';
import 'package:mastery_hub_its_task/features/home/presentation/widgets/book_info_widget.dart';
import 'package:mastery_hub_its_task/features/home/presentation/widgets/rating_widget.dart';
import 'package:mastery_hub_its_task/features/home/presentation/widgets/review_input_widget.dart';
import 'package:mastery_hub_its_task/features/home/presentation/widgets/submit_review_button.dart';
import 'package:mastery_hub_its_task/features/home/presentation/widgets/view_all_reviews_button.dart';

import 'description_widget.dart';

class BookDetailsBody extends StatelessWidget {
  final dynamic book;
  final double userRating;
  final TextEditingController reviewController;
  final Function(double) onRatingUpdate;
  final VoidCallback onSubmitReview;
  final VoidCallback onViewAllReviews;
  final Function(String) onChangeStatus;

  const BookDetailsBody({
    super.key,
    required this.book,
    required this.userRating,
    required this.reviewController,
    required this.onRatingUpdate,
    required this.onSubmitReview,
    required this.onViewAllReviews,
    required this.onChangeStatus,
  });

  @override
  Widget build(BuildContext context) {
    final volume = book.volumeInfo;
    final imageUrl = volume?.imageLinks?.thumbnail;

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BookImageWidget(imageUrl: imageUrl),
          const SizedBox(height: 24),
          BookInfoWidget(title: volume?.title, authors: volume?.authors),
          const SizedBox(height: 16),
          DescriptionWidget(description: volume?.description),
          const SizedBox(height: 28),
          RatingWidget(userRating: userRating, onRatingUpdate: onRatingUpdate),
          const SizedBox(height: 24),
          ReviewInputWidget(controller: reviewController),
          const SizedBox(height: 20),
          SubmitReviewButton(onPressed: onSubmitReview),
          const SizedBox(height: 24),
          ViewAllReviewsButton(onPressed: onViewAllReviews),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
