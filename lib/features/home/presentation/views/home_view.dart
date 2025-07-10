import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:mastery_hub_its_task/core/styles/colors/my_colors.dart';
import 'package:mastery_hub_its_task/di/di.dart';
import 'package:mastery_hub_its_task/features/home/presentation/viewModel/home_action.dart';
import 'package:mastery_hub_its_task/features/home/presentation/viewModel/home_view_model_cubit.dart';
import 'package:mastery_hub_its_task/features/home/presentation/widgets/custom_search_container.dart';

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
      child: Padding(
        padding:
            const EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 16),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: CustomSearchContainer(),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 16,
              ),
            ),
            BlocBuilder<HomeViewModelCubit, HomeViewModelState>(
                builder: (context, state) {
              switch (state) {
                case GetBooksLoading():
                  return SliverToBoxAdapter(
                      child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.7,
                    child: LoadingIndicator(),
                  ));
                case GetBooksSuccess():
                  return SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) => FadeInRight(
                        duration: const Duration(milliseconds: 500),
                        child: CustomBookCard(
                          book: state.books.items![index]!,
                        ),
                      ),
                      childCount: state.books.items?.length ?? 0,
                    ),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.72,
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 20,
                    ),
                  );
                case GetBooksError():
                  return SliverToBoxAdapter(
                    child: Center(
                        child: Text(state.failureMessage.message.toString())),
                  );
                default:
                  null;
              }
              return SliverToBoxAdapter(
                child: SizedBox(),
              );
            })
          ],
        ),
      ),
    );
  }
}
