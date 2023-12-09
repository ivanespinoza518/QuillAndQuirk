import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quill_and_quirk/components/book_info.dart';
import 'package:quill_and_quirk/components/book_rating.dart';
import 'package:quill_and_quirk/models/book.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key, required this.book});

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Colors.grey[900]),
      body: Column(
        children: [
          // book details
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: ListView(
                children: [
                  // image
                  Image.network(
                    book.image,
                    height: 200,
                  ),

                  const SizedBox(height: 25),

                  // book info
                  Row(
                    children: [
                      BookInfo(
                        title: book.title,
                        author: book.author,
                        price: book.price,
                        fontSize: 16,
                      ),
                      AverageBookRating(book: book, fontSize: 10),
                    ],
                  ),

                  const SizedBox(height: 25),

                  // description
                  Text(
                    book.description,
                  ),
                ],
              ),
            ),
          ),
          // add to cart
        ],
      ),
    );
  }
}
