import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mastery_hub_its_task/core/styles/colors/my_colors.dart';
import 'package:mastery_hub_its_task/core/utils/extension/navigation.dart';
import 'package:mastery_hub_its_task/core/utils/widgets/custom_search_container.dart';
import 'package:mastery_hub_its_task/core/utils/widgets/error_widget.dart';
import 'package:mastery_hub_its_task/di/di.dart';
import 'package:mastery_hub_its_task/features/home/presentation/viewModel/home_action.dart';
import 'package:mastery_hub_its_task/features/home/presentation/viewModel/home_view_model_cubit.dart';

import '../../../../core/routes/app_routes.dart';
import '../../../../core/styles/fonts/my_fonts.dart';
import '../../../../core/utils/widgets/loading_indicator.dart';
import '../widgets/custom_book_card.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late final HomeViewModelCubit _viewModel;

  @override
  void initState() {
    _viewModel = getIt.get<HomeViewModelCubit>();
    _viewModel.doAction(GetBooksAction());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _viewModel,
      child: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFF9FAFB), Color(0xFFEFF1F5)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Discover Books 📖",
                        style: MyFonts.styleBold700_20.copyWith(
                          color: MyColors.primaryColor,
                        ),
                      ),
                      const SizedBox(height: 12),
                      CustomSearchContainer(
                        onTap: () {
                          context.pushNamed(AppRoutes.search);
                        },
                      ),
                    ],
                  ),
                ),

                const SliverToBoxAdapter(child: SizedBox(height: 20)),

                BlocBuilder<HomeViewModelCubit, HomeViewModelState>(
                  builder: (context, state) {
                    switch (state) {
                      case GetBooksLoading():
                        return SliverFillRemaining(
                          hasScrollBody: false,
                          child: Center(child: LoadingIndicator()),
                        );

                      case GetBooksError():
                        return SliverFillRemaining(
                          hasScrollBody: false,
                          child: CustomErrorWidget(
                            errorMessage:
                                state.failureMessage.message.toString(),
                          ),
                        );

                      case GetBooksSuccess():
                        final books = state.books.items ?? [];

                        if (books.isEmpty) {
                          return const SliverFillRemaining(
                            hasScrollBody: false,
                            child: Center(
                              child: Text("No books found"),
                            ),
                          );
                        }

                        return SliverPadding(
                          padding: const EdgeInsets.only(bottom: 16),
                          sliver: SliverGrid(
                            delegate: SliverChildBuilderDelegate(
                              (context, index) => FadeInUp(
                                duration:
                                    Duration(milliseconds: 200 + index * 60),
                                child: GestureDetector(
                                  onTap: () {
                                    context.pushNamed(
                                      AppRoutes.bookDetails,
                                      arguments: books[index],
                                    );
                                  },
                                  child: CustomBookCard(
                                    flag: 'default',
                                    book: books[index]!,
                                  ),
                                ),
                              ),
                              childCount: books.length,
                            ),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 20,
                              crossAxisSpacing: 20,
                              childAspectRatio: 0.65,
                            ),
                          ),
                        );

                      default:
                        return const SliverToBoxAdapter(child: SizedBox());
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
