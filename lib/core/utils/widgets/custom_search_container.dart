import 'package:flutter/material.dart';
import 'package:mastery_hub_its_task/core/utils/extension/media_query_values.dart';

import '../../styles/colors/my_colors.dart';

class CustomSearchContainer extends StatelessWidget {
  final VoidCallback? onTap;
  final Color? containerBg;

  const CustomSearchContainer({super.key, this.onTap, this.containerBg});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AbsorbPointer(
        absorbing: onTap != null,
        child: Container(
          width: context.width,
          height: 50,
          decoration: BoxDecoration(
            color: containerBg ?? MyColors.white,
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
      ),
    );
  }
}
