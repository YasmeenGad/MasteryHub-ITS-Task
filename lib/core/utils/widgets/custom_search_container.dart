import 'package:flutter/material.dart';
import 'package:mastery_hub_its_task/core/utils/extension/media_query_values.dart';

import '../../styles/colors/my_colors.dart';
import '../../styles/fonts/my_fonts.dart';

class CustomSearchContainer extends StatelessWidget {
  final VoidCallback? onTap;
  final Color? containerBg;
  final TextEditingController? controller;
  final Function(String)? onChanged;

  const CustomSearchContainer({
    super.key,
    this.onTap,
    this.containerBg,
    this.controller,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final bool hasInput = controller?.text.isNotEmpty ?? false;

    return GestureDetector(
      onTap: onTap,
      child: AbsorbPointer(
        absorbing: onTap != null,
        child: Container(
          width: context.width,
          height: 55,
          decoration: BoxDecoration(
            color: containerBg ?? MyColors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.15),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: TextFormField(
            controller: controller,
            onChanged: onChanged,
            textAlignVertical: TextAlignVertical.center,
            style: MyFonts.styleRegular400_14,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Search books, authors...',
              hintStyle: TextStyle(color: Colors.grey.shade500),
              prefixIcon: const Icon(Icons.search_rounded, color: Colors.grey),
              contentPadding: const EdgeInsets.symmetric(vertical: 16),
            ),
          ),
        ),
      ),
    );
  }
}
