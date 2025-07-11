import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mastery_hub_its_task/core/styles/colors/my_colors.dart';
import 'package:mastery_hub_its_task/core/styles/fonts/my_fonts.dart';
import 'package:mastery_hub_its_task/core/utils/widgets/loading_indicator.dart';
import 'package:mastery_hub_its_task/di/di.dart';
import 'package:mastery_hub_its_task/features/personal%20list/presentation/viewModel/reading_status_action.dart';
import 'package:mastery_hub_its_task/features/personal%20list/presentation/viewModel/reading_status_view_model_cubit.dart';
import '../widgets/book_card.dart';
import '../widgets/empty_tab_view.dart';

class MyReadingListView extends StatefulWidget {
  const MyReadingListView({super.key});

  @override
  State<MyReadingListView> createState() => _MyReadingListViewState();
}

class _MyReadingListViewState extends State<MyReadingListView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<String> _tabs = ["Want to Read", "Reading", "Finished"];
  late final ReadingStatusViewModelCubit _viewModel;
  final userId = getIt<FirebaseAuth>().currentUser?.uid ?? '';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
    _viewModel = getIt.get<ReadingStatusViewModelCubit>();

    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        final status = _getStatusFromTab(_tabs[_tabController.index]);
        _viewModel.doAction(GetReadingStatusAction(status, userId));
      }
    });

    final status = _getStatusFromTab(_tabs[0]);
    _viewModel.doAction(GetReadingStatusAction(status, userId));
  }

  String _getStatusFromTab(String tab) {
    switch (tab) {
      case "Want to Read":
        return "Want to Read";
      case "Reading":
        return "Currently Reading";
      case "Finished":
        return "Finished";
      default:
        return "Unknown";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primaryColor.withOpacity(0.03),
      appBar: AppBar(
        backgroundColor: MyColors.primaryColor,
        elevation: 0,
        centerTitle: true,
        title: Text("📚 My Reading List",
            style: MyFonts.styleBold700_18.copyWith(color: Colors.white)),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48),
          child: Container(
            decoration: BoxDecoration(
              color: MyColors.white,
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: TabBar(
              controller: _tabController,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: MyColors.primaryColor.withOpacity(0.15),
              ),
              labelColor: MyColors.primaryColor,
              unselectedLabelColor: Colors.grey,
              labelStyle: MyFonts.styleBold700_14,
              indicatorPadding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              tabs: _tabs
                  .map((tab) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        child: Text(tab),
                      ))
                  .toList(),
            ),
          ),
        ),
      ),
      body:
          BlocBuilder<ReadingStatusViewModelCubit, ReadingStatusViewModelState>(
        bloc: _viewModel,
        builder: (context, state) {
          if (state is GetReadingStatusLoading) {
            return const LoadingIndicator();
          } else if (state is GetReadingStatusError) {
            return Center(
              child: Text(
                "Something went wrong.\n${state.message.message}",
                textAlign: TextAlign.center,
                style: MyFonts.styleMedium500_14.copyWith(color: Colors.red),
              ),
            );
          } else if (state is GetReadingStatusSuccess) {
            final books = state.readingStatus;
            if (books.isEmpty) {
              return EmptyTabView(tab: _tabs[_tabController.index]);
            } else {
              return ListView.separated(
                padding: const EdgeInsets.all(16),
                physics: const BouncingScrollPhysics(),
                itemCount: books.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  return BookCard(book: books[index].bookData);
                },
              );
            }
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
