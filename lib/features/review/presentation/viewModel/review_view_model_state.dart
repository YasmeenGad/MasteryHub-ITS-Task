part of 'review_view_model_cubit.dart';

@immutable
sealed class ReviewViewModelState {}

final class ReviewViewModelInitial extends ReviewViewModelState {}

/* add review states */

final class AddReviewLoading extends ReviewViewModelState {}

final class AddReviewSuccess extends ReviewViewModelState {}

final class AddReviewError extends ReviewViewModelState {
  final ErrorModel message;

  AddReviewError(this.message);
}

/* get book reviews states */

final class GetBookReviewsLoading extends ReviewViewModelState {}

final class GetBookReviewsSuccess extends ReviewViewModelState {
  final List<ReviewEntity> reviews;

  GetBookReviewsSuccess(this.reviews);
}

final class GetBookReviewsError extends ReviewViewModelState {
  final ErrorModel message;

  GetBookReviewsError(this.message);
}
