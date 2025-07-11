import 'package:flutter/material.dart';
import 'package:mastery_hub_its_task/core/styles/fonts/my_fonts.dart';

class BookDetailsAppBar extends StatelessWidget implements PreferredSizeWidget {
  final dynamic book;

  const BookDetailsAppBar({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: false,
      automaticallyImplyLeading: false,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black),
        onPressed: () => Navigator.pop(context),
      ),
      title: Text("Book Details",
          style: MyFonts.styleMedium500_16.copyWith(color: Colors.black)),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
