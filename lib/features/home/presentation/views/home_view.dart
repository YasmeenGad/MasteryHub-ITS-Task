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
      child: Scaffold(
        backgroundColor: MyColors.primaryColor.withOpacity(0.03),
        appBar: AppBar(
          backgroundColor: MyColors.primaryColor,
          elevation: 0,
          titleSpacing: 16,
          centerTitle: false,
          title: Text(
            "📚 Discover Books",
            style: MyFonts.styleBold700_18.copyWith(color: Colors.white),
          ),
          actions: [
            IconButton(
              onPressed: () => context.pushNamed(AppRoutes.personalList),
              icon: const Icon(Icons.menu_book_rounded, color: Colors.white),
              tooltip: "My Reading List",
            ),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: CustomSearchContainer(
                onTap: () => context.pushNamed(AppRoutes.search),
              ),
            ),
          ),
        ),
        body: BlocBuilder<HomeViewModelCubit, HomeViewModelState>(
          builder: (context, state) {
            switch (state) {
              case GetBooksLoading():
                return const Center(child: LoadingIndicator());

              case GetBooksError():
                return CustomErrorWidget(
                  errorMessage: state.failureMessage.message.toString(),
                );

              case GetBooksSuccess():
                final books = state.books.items ?? [];

                if (books.isEmpty) {
                  return Center(
                    child: Text(
                      "No books found",
                      style: MyFonts.styleMedium500_16,
                    ),
                  );
                }

                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: books.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                      childAspectRatio: 0.65,
                    ),
                    itemBuilder: (context, index) {
                      return FadeInUp(
                        duration: Duration(milliseconds: 200 + index * 60),
                        child: GestureDetector(
                          onTap: () => context.pushNamed(
                            AppRoutes.bookDetails,
                            arguments: books[index],
                          ),
                          child: CustomBookCard(
                            flag: 'default',
                            book: books[index]!,
                          ),
                        ),
                      );
                    },
                  ),
                );

              default:
                return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
