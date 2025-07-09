import 'package:flutter/material.dart';
import 'package:mastery_hub_its_task/core/utils/extension/media_query_values.dart';

import '../../../../core/styles/colors/my_colors.dart';
import '../../../../core/styles/fonts/my_fonts.dart';
import '../../../../generated/assets.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: context.height * 0.08),
        Image.asset(Assets.imagesLogo, width: context.width * 0.3),
        SizedBox(height: context.height * 0.08),
        Text(
          text,
          style: MyFonts.styleBold700_24.copyWith(color: MyColors.black),
        ),
        SizedBox(height: context.height * 0.05),
      ],
    );
  }
}
