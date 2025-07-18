import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mastery_hub_its_task/core/styles/colors/my_colors.dart';
import 'package:mastery_hub_its_task/core/styles/fonts/my_fonts.dart';
import 'package:mastery_hub_its_task/core/utils/widgets/base/snack_bar.dart';
import 'package:mastery_hub_its_task/di/di.dart';
import 'package:mastery_hub_its_task/features/personal list/data/mapper/reading_status_mapper.dart';
import 'package:mastery_hub_its_task/features/personal list/domain/entities/reading_status_entity.dart';
import 'package:mastery_hub_its_task/features/personal list/presentation/viewModel/reading_status_action.dart';
import 'package:mastery_hub_its_task/features/personal list/presentation/viewModel/reading_status_view_model_cubit.dart';
import 'package:mastery_hub_its_task/features/review/domain/entities/review_entity.dart';
import 'package:mastery_hub_its_task/features/review/presentation/viewModel/review_action.dart';
import 'package:mastery_hub_its_task/features/review/presentation/viewModel/review_view_model_cubit.dart';
import '../widgets/book_image_widget.dart';
import '../widgets/book_info_widget.dart';
import '../widgets/rating_widget.dart';
import '../widgets/review_input_widget.dart';
import '../widgets/submit_review_button.dart';
import '../widgets/view_all_reviews_button.dart';
import '../widgets/review_bottom_sheet.dart';
import '../widgets/reading_status_menu_button.dart';

class BookDetailsView extends StatefulWidget {
  final dynamic book;

  const BookDetailsView({super.key, required this.book});

  @override
  State<BookDetailsView> createState() => _BookDetailsViewState();
}

class _BookDetailsViewState extends State<BookDetailsView> {
  double _userRating = 0;
  final _reviewController = TextEditingController();
  late final ReviewViewModelCubit _reviewViewModel;
  late final ReadingStatusViewModelCubit _readingStatusViewModel;

  @override
  void initState() {
    super.initState();
    _reviewViewModel = getIt.get<ReviewViewModelCubit>();
    _readingStatusViewModel = getIt.get<ReadingStatusViewModelCubit>();
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

    _reviewViewModel.doAction(AddReview(review));
  }

  void _showAllReviews() {
    _reviewViewModel.doAction(GetBookReviews(widget.book.id ?? ''));

    showModalBottomSheet(
      context: context,
      backgroundColor: MyColors.white,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return ReviewBottomSheet(viewModel: _reviewViewModel);
      },
    );
  }

  void _handleReadingStatus(String status) {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) return;

    final entity = ReadingStatusEntity(
      userId: userId,
      status: status,
      bookData: ReadingStatusMapper.bookToMap(widget.book),
    );

    _readingStatusViewModel.doAction(AddReadingStatusAction(entity));
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
        actions: [
          ReadingStatusMenuButton(onSelected: _handleReadingStatus),
        ],
      ),
      body: MultiBlocListener(
        listeners: [
          BlocListener<ReviewViewModelCubit, ReviewViewModelState>(
            bloc: _reviewViewModel,
            listener: (context, state) {
              if (state is AddReviewSuccess) {
                aweSnackBar(
                  title: 'Thank you',
                  msg: 'Your review has been submitted 🙌',
                  context: context,
                  type: MessageTypeConst.success,
                );
                _reviewController.clear();
                setState(() => _userRating = 0);
              } else if (state is AddReviewError) {
                aweSnackBar(
                  title: 'Oops!',
                  msg: state.message.message ?? 'Something went wrong',
                  context: context,
                  type: MessageTypeConst.failure,
                );
              }
            },
          ),
          BlocListener<ReadingStatusViewModelCubit,
              ReadingStatusViewModelState>(
            bloc: _readingStatusViewModel,
            listener: (context, state) {
              if (state is AddReadingStatusSuccess) {
                aweSnackBar(
                  context: context,
                  title: 'Status Saved ✅',
                  msg: 'Book successfully added to your list',
                  type: MessageTypeConst.success,
                );
              } else if (state is AddReadingStatusError) {
                aweSnackBar(
                  context: context,
                  title: 'Saving Failed ❌',
                  msg: state.message.message ?? 'Something went wrong',
                  type: MessageTypeConst.failure,
                );
              }
            },
          ),
        ],
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
