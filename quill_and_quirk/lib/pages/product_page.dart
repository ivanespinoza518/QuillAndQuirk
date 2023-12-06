import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quill_and_quirk/models/book.dart';
import 'package:quill_and_quirk/utils/book_search.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key, required this.book});

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text(
        book.id,
        style: TextStyle(
          fontSize: 32.0,
          fontFamily: GoogleFonts.crimsonPro().fontFamily,
        ),
      )),
    );
  }
}
