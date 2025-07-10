import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:mastery_hub_its_task/core/styles/colors/my_colors.dart';
import 'package:mastery_hub_its_task/core/styles/fonts/my_fonts.dart';
import 'package:mastery_hub_its_task/core/utils/widgets/loading_indicator.dart';

class BookDetailsView extends StatefulWidget {
  final dynamic book;

  const BookDetailsView({super.key, required this.book});

  @override
  State<BookDetailsView> createState() => _BookDetailsViewState();
}

class _BookDetailsViewState extends State<BookDetailsView> {
  double _userRating = 0;
  final _reviewController = TextEditingController();

  @override
  void dispose() {
    _reviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final volume = widget.book.volumeInfo;
    final imageUrl = volume?.imageLinks?.thumbnail;

    return Scaffold(
      backgroundColor: MyColors.white,
      appBar: AppBar(
        title: Text(
          volume?.title ?? "Book Details",
          style: MyFonts.styleMedium500_16,
        ),
        backgroundColor: MyColors.primaryColor,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  height: 220,
                  width: 150,
                  color: MyColors.white60,
                  child: imageUrl != null
                      ? CachedNetworkImage(
                    imageUrl: imageUrl,
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>
                    const Center(child: LoadingIndicator()),
                    errorWidget: (context, url, error) =>
                    const Icon(Icons.broken_image),
                  )
                      : const Icon(Icons.book, size: 60),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              volume?.title ?? "Unknown Title",
              style: MyFonts.styleMedium500_18,
            ),
            const SizedBox(height: 8),
            Text(
              volume?.authors?.join(", ") ?? "Unknown Author",
              style: MyFonts.styleRegular400_14.copyWith(color: Colors.grey),
            ),
            const SizedBox(height: 16),
            Text(
              volume?.description ?? "No Description Available.",
              style: MyFonts.styleRegular400_14,
            ),
            const SizedBox(height: 24),
            Text("Your Rating:", style: MyFonts.styleMedium500_16),
            const SizedBox(height: 8),
            RatingBar.builder(
              initialRating: _userRating,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) =>
              const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                setState(() {
                  _userRating = rating;
                });
              },
            ),
            const SizedBox(height: 24),
            Text("Leave a Review:", style: MyFonts.styleMedium500_16),
            const SizedBox(height: 8),
            TextField(
              controller: _reviewController,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: "Write your thoughts...",
                filled: true,
                fillColor: MyColors.white60,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle submit
                  final review = _reviewController.text;
                  debugPrint("Rating: $_userRating, Review: $review");
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Review submitted!")),
                  );
                  _reviewController.clear();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: MyColors.primaryColor,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 32, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text("Submit Review"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
