import 'package:flutter/material.dart';

class ReadingStatusMenuButton extends StatelessWidget {
  final void Function(String)? onSelected;

  const ReadingStatusMenuButton({
    super.key,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: const Icon(Icons.more_vert_rounded, color: Colors.black),
      tooltip: "Reading Status",
      onSelected: onSelected,
      itemBuilder: (context) => const [
        PopupMenuItem(
          value: 'Want to Read',
          child: Row(
            children: [
              Icon(Icons.hourglass_empty, color: Colors.orange),
              SizedBox(width: 10),
              Text("Want to Read"),
            ],
          ),
        ),
        PopupMenuItem(
          value: 'Currently Reading',
          child: Row(
            children: [
              Icon(Icons.menu_book_rounded, color: Colors.blue),
              SizedBox(width: 10),
              Text("Currently Reading"),
            ],
          ),
        ),
        PopupMenuItem(
          value: 'Finished',
          child: Row(
            children: [
              Icon(Icons.check_circle_rounded, color: Colors.green),
              SizedBox(width: 10),
              Text("Finished"),
            ],
          ),
        ),
      ],
    );
  }
}
