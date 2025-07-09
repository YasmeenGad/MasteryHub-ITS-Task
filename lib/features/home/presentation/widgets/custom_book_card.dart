import 'package:flutter/material.dart';
import 'package:mastery_hub_its_task/core/utils/extension/media_query_values.dart';

import '../../../../core/styles/colors/my_colors.dart';
import '../../../../core/styles/fonts/my_fonts.dart';

class CustomBookCard extends StatelessWidget {
  const CustomBookCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 5,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: context.width * 0.4,
          height: context.height * 0.2,
          decoration: BoxDecoration(
            color: MyColors.green,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        FittedBox(
            alignment: Alignment.centerLeft,
            fit: BoxFit.scaleDown,
            child: Text(
              "Title",
              style: MyFonts.styleBold700_20.copyWith(color: MyColors.black),
            )),
        FittedBox(
            alignment: Alignment.centerLeft,
            fit: BoxFit.scaleDown,
            child: Text(
              "subtitle",
              style:
                  MyFonts.styleMedium500_18.copyWith(color: MyColors.black50),
            )),
      ],
    );
  }
}
