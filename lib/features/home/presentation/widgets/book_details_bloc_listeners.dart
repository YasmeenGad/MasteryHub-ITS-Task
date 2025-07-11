import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mastery_hub_its_task/core/utils/widgets/base/snack_bar.dart';
import 'package:mastery_hub_its_task/di/di.dart';
import 'package:mastery_hub_its_task/features/home/presentation/widgets/review_bottom_sheet.dart';
import 'package:mastery_hub_its_task/features/personal%20list/data/mapper/reading_status_mapper.dart';
import 'package:mastery_hub_its_task/features/personal%20list/domain/entities/reading_status_entity.dart';
import 'package:mastery_hub_its_task/features/personal%20list/presentation/viewModel/reading_status_action.dart';
import 'package:mastery_hub_its_task/features/personal%20list/presentation/viewModel/reading_status_view_model_cubit.dart';
import 'package:mastery_hub_its_task/features/review/domain/entities/review_entity.dart';
import 'package:mastery_hub_its_task/features/review/presentation/viewModel/review_action.dart';
import 'package:mastery_hub_its_task/features/review/presentation/viewModel/review_view_model_cubit.dart';

import 'book_details_body.dart';

class BookDetailsBlocListeners extends StatefulWidget {
  final dynamic book;

  const BookDetailsBlocListeners({super.key, required this.book});

  @override
  State<BookDetailsBlocListeners> createState() =>
      _BookDetailsBlocListenersState();
}

class _BookDetailsBlocListenersState extends State<BookDetailsBlocListeners> {
  final _reviewController = TextEditingController();
  double _userRating = 0;
  late final ReviewViewModelCubit _reviewViewModel;
  late final ReadingStatusViewModelCubit _readingStatusViewModel;

  @override
  void initState() {
    super.initState();
    _reviewViewModel = getIt.get<ReviewViewModelCubit>();
    _readingStatusViewModel = getIt.get<ReadingStatusViewModelCubit>();
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

  void _showAllReviews() {
    _reviewViewModel.doAction(GetBookReviews(widget.book.id ?? ''));
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => ReviewBottomSheet(viewModel: _reviewViewModel),
    );
  }

  @override
  void dispose() {
    _reviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
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
        BlocListener<ReadingStatusViewModelCubit, ReadingStatusViewModelState>(
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
      child: BookDetailsBody(
        book: widget.book,
        userRating: _userRating,
        reviewController: _reviewController,
        onRatingUpdate: (r) => setState(() => _userRating = r),
        onSubmitReview: _submitReview,
        onViewAllReviews: _showAllReviews,
        onChangeStatus: _handleReadingStatus,
      ),
    );
  }
}
