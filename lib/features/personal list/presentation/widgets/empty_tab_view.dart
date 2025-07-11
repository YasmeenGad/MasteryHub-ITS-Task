import 'package:flutter/material.dart';
import 'package:mastery_hub_its_task/core/styles/colors/my_colors.dart';
import 'package:mastery_hub_its_task/core/styles/fonts/my_fonts.dart';

class EmptyTabView extends StatelessWidget {
  final String tab;

  const EmptyTabView({super.key, required this.tab});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.menu_book_rounded,
                size: 70, color: MyColors.primaryColor.withOpacity(0.5)),
            const SizedBox(height: 20),
            Text("No books in \"$tab\" yet.",
                textAlign: TextAlign.center,
                style: MyFonts.styleMedium500_16.copyWith(color: Colors.grey)),
            const SizedBox(height: 12),
            Text("Start exploring and add your favorite books here!",
                textAlign: TextAlign.center,
                style: MyFonts.styleRegular400_14
                    .copyWith(color: Colors.grey.shade600)),
          ],
        ),
      ),
    );
  }
}
