import 'package:flutter/material.dart';
import 'package:mastery_hub_its_task/core/routes/app_routes.dart';
import 'package:mastery_hub_its_task/core/utils/extension/media_query_values.dart';
import 'package:mastery_hub_its_task/core/utils/extension/navigation.dart';

import '../../../../core/styles/colors/my_colors.dart';

class CustomSearchContainer extends StatelessWidget {
  const CustomSearchContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(AppRoutes.search);
      },
      child: Container(
        width: context.width,
        height: 50,
        decoration: BoxDecoration(
          color: MyColors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextFormField(
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(Icons.search, color: MyColors.black50),
            hintText: 'Search',
            hintStyle: TextStyle(color: MyColors.black50),
          ),
        ),
      ),
    );
  }
}
