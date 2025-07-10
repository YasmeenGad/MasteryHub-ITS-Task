/*import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mastery_hub_its_task/core/styles/colors/my_colors.dart';
import 'package:mastery_hub_its_task/core/styles/fonts/my_fonts.dart';
import 'package:mastery_hub_its_task/core/utils/widgets/base/snack_bar.dart';
import 'package:mastery_hub_its_task/core/utils/widgets/loading_indicator.dart';
import 'package:mastery_hub_its_task/di/di.dart';
import 'package:mastery_hub_its_task/features/review/domain/entities/review_entity.dart';
import 'package:mastery_hub_its_task/features/review/presentation/viewModel/review_view_model_cubit.dart';
import 'package:animate_do/animate_do.dart';

import '../../../review/presentation/viewModel/review_action.dart';

class BookDetailsView extends StatefulWidget {
  final dynamic book;

  const BookDetailsView({super.key, required this.book});

  @override
  State<BookDetailsView> createState() => _BookDetailsViewState();
}

class _BookDetailsViewState extends State<BookDetailsView> {
  double _userRating = 0;
  final _reviewController = TextEditingController();
  late final ReviewViewModelCubit _viewModel;

  @override
  void initState() {
    _viewModel = getIt.get<ReviewViewModelCubit>();
    super.initState();
  }

  @override
  void dispose() {
    _reviewController.dispose();
    super.dispose();
  }

  void _submitReview() {
    final review = ReviewEntity(
      reviewId: DateTime.now().millisecondsSinceEpoch.toString(),
      userId: FirebaseAuth.instance.currentUser?.uid ?? '',
      bookId: widget.book.id ?? '',
      comment: _reviewController.text,
      rating: _userRating,
      createdAt: DateTime.now(),
    );

    _viewModel.doAction(AddReview(review));
  }

  void _showAllReviews() {
    _viewModel.doAction(GetBookReviews(widget.book.id ?? ''));

    showModalBottomSheet(
      context: context,
      backgroundColor: MyColors.white,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return BlocBuilder<ReviewViewModelCubit, ReviewViewModelState>(
          bloc: _viewModel,
          builder: (context, state) {
            if (state is GetBookReviewsLoading) {
              return const Padding(
                padding: EdgeInsets.all(16),
                child: Center(child: LoadingIndicator()),
              );
            }

            if (state is GetBookReviewsError) {
              return Padding(
                padding: const EdgeInsets.all(16),
                child: Center(child: Text(state.message.message ?? "")),
              );
            }

            if (state is GetBookReviewsSuccess) {
              if (state.reviews.isEmpty) {
                return const Padding(
                  padding: EdgeInsets.all(16),
                  child: Center(child: Text("No reviews yet")),
                );
              }

              return ListView.separated(
                padding: const EdgeInsets.all(20),
                shrinkWrap: true,
                itemCount: state.reviews.length,
                separatorBuilder: (_, __) => const Divider(height: 30),
                itemBuilder: (context, index) {
                  final review = state.reviews[index];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: MyColors.primaryColor.withOpacity(0.1),
                      child: Icon(Icons.person, color: MyColors.primaryColor),
                    ),
                    title: Text(review.comment, style: MyFonts.styleRegular400_14),
                    subtitle: Row(
                      children: [
                        const Icon(Icons.star, size: 16, color: Colors.amber),
                        const SizedBox(width: 4),
                        Text(review.rating.toString(), style: MyFonts.styleRegular400_12),
                      ],
                    ),
                    trailing: Text(
                      "${review.createdAt.day}/${review.createdAt.month}/${review.createdAt.year}",
                      style: MyFonts.styleRegular400_12,
                    ),
                  );
                },
              );
            }

            return const SizedBox();
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final volume = widget.book.volumeInfo;
    final imageUrl = volume?.imageLinks?.thumbnail;

    return Scaffold(
      backgroundColor: MyColors.white,
      appBar: AppBar(
        backgroundColor: MyColors.white,
        elevation: 0,
        centerTitle: false,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Book Details",
          style: MyFonts.styleMedium500_16.copyWith(color: Colors.black),
        ),
      ),
      body: BlocListener<ReviewViewModelCubit, ReviewViewModelState>(
        bloc: _viewModel,
        listener: (context, state) {
          if (state is AddReviewSuccess) {
            aweSnackBar(
              title: 'Thank you',
              msg: 'Your review has been successfully submitted 🙌',
              context: context,
              type: MessageTypeConst.success,
            );
            _reviewController.clear();
            setState(() => _userRating = 0);
          } else if (state is AddReviewError) {
            aweSnackBar(
              title: 'Oops, something went wrong',
              msg: '${state.message.message}',
              context: context,
              type: MessageTypeConst.failure,
            );
          }
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: FadeInDown(
                  duration: const Duration(milliseconds: 600),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      height: 240,
                      width: 160,
                      color: MyColors.white60,
                      child: imageUrl != null
                          ? CachedNetworkImage(
                        imageUrl: imageUrl,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => const LoadingIndicator(),
                        errorWidget: (context, url, error) => const Icon(Icons.broken_image),
                      )
                          : const Icon(Icons.book, size: 60),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              FadeInUp(
                duration: const Duration(milliseconds: 500),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(volume?.title ?? "Unknown Title", style: MyFonts.styleMedium500_20),
                    const SizedBox(height: 8),
                    Text(volume?.authors?.join(", ") ?? "Unknown Author", style: MyFonts.styleRegular400_14.copyWith(color: Colors.grey)),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Text(
                volume?.description ?? "No Description Available.",
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
                style: MyFonts.styleRegular400_14,
              ),
              const SizedBox(height: 28),
              FadeInLeft(
                duration: const Duration(milliseconds: 500),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Your Rating", style: MyFonts.styleMedium500_16),
                    const SizedBox(height: 8),
                    RatingBar.builder(
                      initialRating: _userRating,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemSize: 26.sp,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => const Icon(Icons.star, color: Colors.amber),
                      onRatingUpdate: (rating) => setState(() => _userRating = rating),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              FadeInRight(
                duration: const Duration(milliseconds: 500),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Leave a Review", style: MyFonts.styleMedium500_16),
                    const SizedBox(height: 8),
                    TextField(
                      controller: _reviewController,
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
              ),
              const SizedBox(height: 20),
              FadeIn(
                duration: const Duration(milliseconds: 600),
                child: Center(
                  child: ElevatedButton.icon(
                    onPressed: _submitReview,
                    icon: const Icon(Icons.send_rounded),
                    label: const Text("Submit Review"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: MyColors.primaryColor,
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              FadeIn(
                duration: const Duration(milliseconds: 500),
                child: Center(
                  child: TextButton.icon(
                    onPressed: _showAllReviews,
                    icon: const Icon(Icons.visibility),
                    label: const Text("View All Reviews"),
                  ),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}*/

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mastery_hub_its_task/core/styles/colors/my_colors.dart';
import 'package:mastery_hub_its_task/core/styles/fonts/my_fonts.dart';
import 'package:mastery_hub_its_task/core/utils/widgets/base/snack_bar.dart';
import 'package:mastery_hub_its_task/di/di.dart';
import 'package:mastery_hub_its_task/features/review/domain/entities/review_entity.dart';
import 'package:mastery_hub_its_task/features/review/presentation/viewModel/review_action.dart';
import 'package:mastery_hub_its_task/features/review/presentation/viewModel/review_view_model_cubit.dart';

import '../widgets/book_image_widget.dart';
import '../widgets/book_info_widget.dart';
import '../widgets/rating_widget.dart';
import '../widgets/review_bottom_sheet.dart';
import '../widgets/review_input_widget.dart';
import '../widgets/submit_review_button.dart';
import '../widgets/view_all_reviews_button.dart';

class BookDetailsView extends StatefulWidget {
  final dynamic book;

  const BookDetailsView({super.key, required this.book});

  @override
  State<BookDetailsView> createState() => _BookDetailsViewState();
}

class _BookDetailsViewState extends State<BookDetailsView> {
  double _userRating = 0;
  final _reviewController = TextEditingController();
  late final ReviewViewModelCubit _viewModel;

  @override
  void initState() {
    _viewModel = getIt.get<ReviewViewModelCubit>();
    super.initState();
  }

  @override
  void dispose() {
    _reviewController.dispose();
    super.dispose();
  }

  void _submitReview() {
    final review = ReviewEntity(
      reviewId: DateTime.now().millisecondsSinceEpoch.toString(),
      userId: FirebaseAuth.instance.currentUser?.uid ?? '',
      bookId: widget.book.id ?? '',
      comment: _reviewController.text,
      rating: _userRating,
      createdAt: DateTime.now(),
    );

    _viewModel.doAction(AddReview(review));
  }

  void _showAllReviews() {
    _viewModel.doAction(GetBookReviews(widget.book.id ?? ''));

    showModalBottomSheet(
      context: context,
      backgroundColor: MyColors.white,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return ReviewBottomSheet(viewModel: _viewModel);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final volume = widget.book.volumeInfo;
    final imageUrl = volume?.imageLinks?.thumbnail;

    return Scaffold(
      backgroundColor: MyColors.white,
      appBar: AppBar(
        backgroundColor: MyColors.white,
        elevation: 0,
        centerTitle: false,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon:
              const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Book Details",
          style: MyFonts.styleMedium500_16.copyWith(color: Colors.black),
        ),
      ),
      body: BlocListener<ReviewViewModelCubit, ReviewViewModelState>(
        bloc: _viewModel,
        listener: (context, state) {
          if (state is AddReviewSuccess) {
            aweSnackBar(
              title: 'Thank you',
              msg: 'Your review has been successfully submitted 🙌',
              context: context,
              type: MessageTypeConst.success,
            );
            _reviewController.clear();
            setState(() => _userRating = 0);
          } else if (state is AddReviewError) {
            aweSnackBar(
              title: 'Oops, something went wrong',
              msg: '${state.message.message}',
              context: context,
              type: MessageTypeConst.failure,
            );
          }
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BookImageWidget(imageUrl: imageUrl),
              const SizedBox(height: 24),
              BookInfoWidget(title: volume?.title, authors: volume?.authors),
              const SizedBox(height: 16),
              Text(
                volume?.description ?? "No Description Available.",
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
                style: MyFonts.styleRegular400_14,
              ),
              const SizedBox(height: 28),
              RatingWidget(
                userRating: _userRating,
                onRatingUpdate: (rating) =>
                    setState(() => _userRating = rating),
              ),
              const SizedBox(height: 24),
              ReviewInputWidget(controller: _reviewController),
              const SizedBox(height: 20),
              SubmitReviewButton(onPressed: _submitReview),
              const SizedBox(height: 24),
              ViewAllReviewsButton(onPressed: _showAllReviews),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
