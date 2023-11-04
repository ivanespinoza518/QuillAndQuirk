import 'package:flutter/material.dart';

import '../models/book.dart';

class BookTile extends StatelessWidget {
  Book book;
  BookTile({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 25),
      width: 280,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(children: [
        // book pic
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Image.asset(
            book.image,
            height: 200,
          ),
        ),

        // description

        // price and details

        // button to add to cart
      ]),
    );
  }
}
