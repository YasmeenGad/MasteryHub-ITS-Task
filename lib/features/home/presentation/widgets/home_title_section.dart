import 'package:flutter/material.dart';

import '../../../../core/styles/fonts/my_fonts.dart';

class HomeTitleSection extends StatelessWidget {
  const HomeTitleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 10),
      child: Text(
        "Computer Science",
        style: MyFonts.styleBold700_16,
      ),
    );
  }
}
