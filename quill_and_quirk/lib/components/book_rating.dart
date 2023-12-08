import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quill_and_quirk/constants/app_sizes.dart';
import 'package:quill_and_quirk/models/book.dart';

class AverageBookRating extends StatelessWidget {
  const AverageBookRating({
    super.key,
    required this.book,
    required this.fontSize,
  });
  final Book book;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        (book.averageRating == 0.0)
            ? Text(
                'No reviews yet.',
                style: TextStyle(
                  fontFamily: GoogleFonts.crimsonPro().fontFamily,
                  fontSize: fontSize,
                ),
              )
            : RatingBar.builder(
                initialRating: book.averageRating,
                minRating: 0.5,
                maxRating: 5,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: fontSize,
                ignoreGestures: true,
                itemPadding: const EdgeInsets.symmetric(horizontal: 0.5),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {},
              ),
        gapW4,
        Text(
          '(${book.numRatings})',
          style: TextStyle(
            fontFamily: GoogleFonts.crimsonPro().fontFamily,
            fontSize: fontSize,
          ),
        ),
      ],
    );
  }
}
