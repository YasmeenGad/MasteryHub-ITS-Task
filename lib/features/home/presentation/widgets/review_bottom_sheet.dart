import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mastery_hub_its_task/core/styles/colors/my_colors.dart';
import 'package:mastery_hub_its_task/core/styles/fonts/my_fonts.dart';
import 'package:mastery_hub_its_task/core/utils/widgets/loading_indicator.dart';
import 'package:mastery_hub_its_task/features/review/presentation/viewModel/review_view_model_cubit.dart';

class ReviewBottomSheet extends StatelessWidget {
  final ReviewViewModelCubit viewModel;

  const ReviewBottomSheet({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReviewViewModelCubit, ReviewViewModelState>(
      bloc: viewModel,
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
                    Text(review.rating.toString(),
                        style: MyFonts.styleRegular400_12),
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
  }
}
