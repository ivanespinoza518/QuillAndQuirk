import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

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
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // book pic
            Image.asset(
              book.image,
              height: 200,
            ),

            // Remember to change. Maybe to be centered next to book
            // or title and author above the book and rating, price,
            // and add to cart button below
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 8.0),
              child: Column(
                children: [
                  Text(book.title,
                      style: const TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 14.0),
                      overflow: TextOverflow.ellipsis),
                  const SizedBox(height: 5.0),
                  RatingBar.builder(
                    initialRating: 3.5,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: 10,
                    ignoreGestures: true,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 0.5),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {},
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );

    // add author

    // add price and button to add to cart
  }
}
