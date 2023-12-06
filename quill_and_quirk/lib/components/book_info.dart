import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quill_and_quirk/constants/app_sizes.dart';

class BookInfo extends StatelessWidget {
  const BookInfo({
    super.key,
    required this.title,
    required this.author,
    required this.price,
    required this.fontSize,
  });
  final String title;
  final String author;
  final double price;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: Colors.black,
            fontFamily: GoogleFonts.crimsonPro().fontFamily,
            fontSize: fontSize,
          ),
        ),
        Text(
          author,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: Colors.black54,
            fontFamily: GoogleFonts.crimsonPro().fontFamily,
            fontSize: fontSize * .75,
          ),
        ),
        gapH12,
        Text(
          '\$$price',
          style: TextStyle(
            color: Colors.black,
            fontFamily: GoogleFonts.crimsonPro().fontFamily,
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
