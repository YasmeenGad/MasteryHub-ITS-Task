import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mastery_hub_its_task/core/styles/colors/my_colors.dart';
import 'package:mastery_hub_its_task/core/utils/extension/navigation.dart';
import 'package:mastery_hub_its_task/core/utils/widgets/custom_search_container.dart';
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
          color: MyColors.white60,
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(
                  child: CustomSearchContainer(
                    onTap: () {
                      context.pushNamed(AppRoutes.search);
                    },
                  ),
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 20)),
                BlocBuilder<HomeViewModelCubit, HomeViewModelState>(
                  builder: (context, state) {
                    switch (state) {
                      case GetBooksLoading():
                        return SliverFillRemaining(
                          hasScrollBody: false,
                          child: Center(
                            child: LoadingIndicator(),
                          ),
                        );
                      case GetBooksSuccess():
                        return SliverGrid(
                          delegate: SliverChildBuilderDelegate(
                            (context, index) => FadeInUp(
                              duration:
                                  Duration(milliseconds: 300 + index * 100),
                              child: CustomBookCard(
                                book: state.books.items![index]!,
                              ),
                            ),
                            childCount: state.books.items?.length ?? 0,
                          ),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.68,
                            mainAxisSpacing: 16,
                            crossAxisSpacing: 16,
                          ),
                        );
                      case GetBooksError():
                        return SliverFillRemaining(
                          hasScrollBody: false,
                          child: Center(
                            child: Text(
                              state.failureMessage.message.toString(),
                              style: MyFonts.styleRegular400_14.copyWith(
                                color: Colors.redAccent,
                              ),
                              textAlign: TextAlign.center,
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
