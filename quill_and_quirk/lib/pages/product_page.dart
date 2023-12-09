import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quill_and_quirk/models/book.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key, required this.book});

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text(
        "This is the product page",
        style: TextStyle(
          fontSize: 32.0,
          fontFamily: GoogleFonts.crimsonPro().fontFamily,
        ),
      )),
    );
  }
}
