import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:mastery_hub_its_task/core/networking/common/api_result.dart';
import 'package:mastery_hub_its_task/core/networking/error/error_model.dart';
import 'package:mastery_hub_its_task/core/networking/error/firebase_error_handler.dart';
import 'package:mastery_hub_its_task/features/review/presentation/viewModel/review_action.dart';
import 'package:meta/meta.dart';

import '../../domain/entities/review_entity.dart';
import '../../domain/use_cases/add_review_usecase.dart';
import '../../domain/use_cases/get_book_reviews_usecase.dart';

part 'review_view_model_state.dart';

@injectable
class ReviewViewModelCubit extends Cubit<ReviewViewModelState> {
  final AddReviewUseCase _addReviewUseCase;
  final GetBookReviewsUseCase _getReviewsUseCase;

  void doAction(ReviewAction action) {
    switch (action) {
      case AddReview():
        _addReview(action.review);
      case GetBookReviews():
        _getBookReviews(action.bookId);
    }
  }

  ReviewViewModelCubit(this._addReviewUseCase, this._getReviewsUseCase)
      : super(ReviewViewModelInitial());

  Future<void> _addReview(ReviewEntity review) async {
    emit(AddReviewLoading());
    final response = await _addReviewUseCase.call(review);
    switch (response) {
      case Success<void>():
        emit(AddReviewSuccess());
      case Fail<void>():
        emit(AddReviewError(FirebaseErrorHandler.handle(response.exception!)));
    }
  }

  Future<void> _getBookReviews(String bookId) async {
    emit(GetBookReviewsLoading());
    final response = await _getReviewsUseCase.call(bookId);
    switch (response) {
      case Success<List<ReviewEntity>>():
        emit(GetBookReviewsSuccess(response.data));
      case Fail<List<ReviewEntity>>():
        emit(GetBookReviewsError(
            FirebaseErrorHandler.handle(response.exception!)));
    }
  }
}
