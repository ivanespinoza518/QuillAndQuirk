import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:quill_and_quirk/components/book_info.dart';

import '../models/book.dart';

class BookTile extends StatelessWidget {
  Book book;
  void Function()? onTap;
  BookTile({super.key, required this.book, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 25),
      width: 250,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // book pic
            Image.network(
              book.image,
              height: 200,
            ),

            // Book Info
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    // Book Title
                    BookInfo(
                      title: book.title,
                      author: book.author,
                      price: book.price,
                      fontSize: 16.0,
                    ),

                    const SizedBox(height: 5.0),

                    // Rating
                    // RatingBar.builder(
                    //   initialRating: 3.5,
                    //   minRating: 1,
                    //   direction: Axis.horizontal,
                    //   allowHalfRating: true,
                    //   itemCount: 5,
                    //   itemSize: 10,
                    //   ignoreGestures: true,
                    //   itemPadding: const EdgeInsets.symmetric(horizontal: 0.5),
                    //   itemBuilder: (context, _) => const Icon(
                    //     Icons.star,
                    //     color: Colors.amber,
                    //   ),
                    //   onRatingUpdate: (rating) {},
                    // )
                  ],
                ),

                // Add to Cart Button
                GestureDetector(
                  onTap: onTap,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 53, 94, 43),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    height: 50,
                    width: 50,
                    child: Icon(
                      Icons.add,
                      color: Colors.grey[100],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
