import 'package:flutter/material.dart';
import 'package:mastery_hub_its_task/core/styles/colors/my_colors.dart';
import 'package:mastery_hub_its_task/core/utils/extension/media_query_values.dart';
import 'package:mastery_hub_its_task/core/utils/widgets/custom_search_container.dart';
import 'package:mastery_hub_its_task/generated/assets.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomSearchContainer(containerBg: MyColors.white60),
            const SizedBox(height: 40),
            Expanded(
              child: Center(
                child: Image.asset(
                  Assets.imagesSearch,
                  width: context.width * 0.4,
                  height: context.height * 0.43,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
