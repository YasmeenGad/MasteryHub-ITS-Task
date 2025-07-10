import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mastery_hub_its_task/core/styles/colors/my_colors.dart';
import 'package:mastery_hub_its_task/core/utils/widgets/custom_search_container.dart';
import 'package:mastery_hub_its_task/features/search/presentation/widgets/empty_search_placeholder.dart';

import '../../../../core/utils/widgets/error_widget.dart';
import '../../../../core/utils/widgets/loading_indicator.dart';
import '../../../../di/di.dart';
import '../../../home/presentation/widgets/custom_book_card.dart';
import '../viewModel/search_action.dart';
import '../viewModel/search_view_model_cubit.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  late SearchViewModelCubit _viewModel;
  late final TextEditingController _queryController;

  @override
  void initState() {
    _viewModel = getIt.get<SearchViewModelCubit>();
    _queryController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _queryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      body: BlocProvider(
        create: (context) => _viewModel,
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomSearchContainer(
                containerBg: MyColors.white60,
                controller: _queryController,
                onChanged: (value) {
                  if (value.trim().isNotEmpty) {
                    _viewModel.doAction(GetSearchedBooks(value));
                  }
                },
              ),
              const SizedBox(height: 20),
              Expanded(
                child: BlocBuilder<SearchViewModelCubit, SearchViewModelState>(
                  builder: (context, state) {
                    switch (state) {
                      case SearchLoading():
                        return const Center(child: LoadingIndicator());
                      case SearchSuccess():
                        final books = state.response.items ?? [];
                        if (books.isEmpty ||
                            _queryController.text.trim().isEmpty) {
                          return const EmptySearchPlaceholder();
                        }
                        return GridView.builder(
                          padding: const EdgeInsets.only(top: 16),
                          itemCount: books.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.68,
                            mainAxisSpacing: 16,
                            crossAxisSpacing: 16,
                          ),
                          itemBuilder: (context, index) {
                            final book = books[index];
                            return FadeInUp(
                              duration:
                                  Duration(milliseconds: 300 + index * 100),
                              child:
                                  CustomBookCard(flag: 'search', book: book!),
                            );
                          },
                        );
                      case SearchFailure():
                        return CustomErrorWidget(
                          errorMessage: state.failureMessage.message.toString(),
                        );
                      default:
                        null;
                    }
                    return const EmptySearchPlaceholder();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
