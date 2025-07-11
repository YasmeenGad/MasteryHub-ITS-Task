import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:mastery_hub_its_task/core/styles/colors/my_colors.dart';
import 'package:mastery_hub_its_task/core/styles/fonts/my_fonts.dart';

class MyReadingListView extends StatefulWidget {
  const MyReadingListView({super.key});

  @override
  State<MyReadingListView> createState() => _MyReadingListViewState();
}

class _MyReadingListViewState extends State<MyReadingListView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<String> _tabs = ["Want to Read", "Reading", "Finished"];

  @override
  void initState() {
    _tabController = TabController(length: _tabs.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primaryColor.withOpacity(0.03),
      appBar: AppBar(
        backgroundColor: MyColors.primaryColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "📚 My Reading List",
          style: MyFonts.styleBold700_18.copyWith(color: Colors.white),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48),
          child: Container(
            decoration: BoxDecoration(
              color: MyColors.white,
              borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(20)),
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
              indicatorPadding: const EdgeInsets.symmetric(
                  horizontal: 12, vertical: 6),
              tabs: _tabs
                  .map((tab) =>
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: Text(tab),
                  ))
                  .toList(),
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: _tabs.map((tab) {
          return Padding(
            padding: const EdgeInsets.all(24),
            child: FadeInUp(
              duration: const Duration(milliseconds: 400),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.menu_book_rounded,
                    size: 70,
                    color: MyColors.primaryColor.withOpacity(0.5),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "No books in \"$tab\" yet.",
                    textAlign: TextAlign.center,
                    style: MyFonts.styleMedium500_16.copyWith(
                        color: Colors.grey),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "Start exploring and add your favorite books here!",
                    textAlign: TextAlign.center,
                    style: MyFonts.styleRegular400_14.copyWith(
                        color: Colors.grey.shade600),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
