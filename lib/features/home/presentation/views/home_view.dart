import 'package:flutter/material.dart';
import 'package:mastery_hub_its_task/core/styles/fonts/my_fonts.dart';
import 'package:mastery_hub_its_task/features/home/presentation/widgets/custom_search_container.dart';
import 'package:mastery_hub_its_task/features/home/presentation/widgets/home_title_section.dart';

import '../widgets/custom_book_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 16),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: CustomSearchContainer(),
          ),
          SliverToBoxAdapter(
            child: HomeTitleSection(),
          ),
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) => const CustomBookCard(),
              childCount: 10, // or length of your list
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.70,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
            ),
          ),
        ],
      ),
    );
  }
}
