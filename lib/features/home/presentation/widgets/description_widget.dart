import 'package:flutter/material.dart';
import 'package:mastery_hub_its_task/core/styles/fonts/my_fonts.dart';

class DescriptionWidget extends StatelessWidget {
  final String? description;

  const DescriptionWidget({super.key, this.description});

  @override
  Widget build(BuildContext context) {
    return Text(
      description ?? "No Description Available.",
      maxLines: 5,
      overflow: TextOverflow.ellipsis,
      style: MyFonts.styleRegular400_14,
    );
  }
}
