import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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

  void _submitReview() {
    final review = _reviewController.text;
    debugPrint("Rating: $_userRating, Review: $review");
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Review submitted!")),
    );
    _reviewController.clear();
  }

  void _showAllReviews() {
    showModalBottomSheet(
      context: context,
      backgroundColor: MyColors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Container();
      },
    );
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
            // Book Image
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

            // Title
            Row(
              children: [
                Icon(Icons.book_rounded, color: MyColors.primaryColor),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    volume?.title ?? "Unknown Title",
                    style: MyFonts.styleMedium500_18,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),

            // Author
            Row(
              children: [
                const Icon(Icons.person_2_rounded, color: Colors.grey),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    volume?.authors?.join(", ") ?? "Unknown Author",
                    style:
                    MyFonts.styleRegular400_14.copyWith(color: Colors.grey),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Description
            Row(
              children: [
                Icon(Icons.description_rounded, color: MyColors.primaryColor),
                const SizedBox(width: 6),
                Text("Description", style: MyFonts.styleMedium500_16),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              volume?.description ?? "No Description Available.",
              maxLines: 5,
              style: MyFonts.styleRegular400_14,
            ),

            // Rating
            const SizedBox(height: 24),
            Row(
              children: [
                Icon(
                  Icons.star_rounded,
                  color: Colors.amber,
                  size: 25.sp,
                ),
                const SizedBox(width: 6),
                Text("Your Rating", style: MyFonts.styleMedium500_16),
              ],
            ),
            const SizedBox(height: 8),
            RatingBar.builder(
              initialRating: _userRating,
              minRating: 1,
              itemSize: 25.sp,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) =>
                  Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                setState(() {
                  _userRating = rating;
                });
              },
            ),

            // Review Input
            const SizedBox(height: 24),
            Row(
              children: [
                Icon(Icons.reviews_rounded, color: MyColors.primaryColor),
                const SizedBox(width: 6),
                Text("Leave a Review", style: MyFonts.styleMedium500_16),
              ],
            ),
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

            // Submit Button
            const SizedBox(height: 16),
            Center(
              child: ElevatedButton.icon(
                onPressed: _submitReview,
                icon: const Icon(Icons.send_rounded),
                label: const Text("Submit Review"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: MyColors.primaryColor,
                  padding:
                  const EdgeInsets.symmetric(horizontal: 36, vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),

            // View All Reviews Button
            const SizedBox(height: 24),
            Center(
              child: TextButton.icon(
                onPressed: _showAllReviews,
                icon: const Icon(Icons.visibility_rounded),
                label: const Text("View All Reviews"),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
