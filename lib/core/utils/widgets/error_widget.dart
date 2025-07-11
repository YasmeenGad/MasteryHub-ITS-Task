import 'package:flutter/material.dart';

import '../../styles/fonts/my_fonts.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, required this.errorMessage});

  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errorMessage,
        style: MyFonts.styleRegular400_14.copyWith(
          color: Colors.redAccent,
        ),
      ),
    );
  }
}
