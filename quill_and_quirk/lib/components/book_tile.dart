import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:quill_and_quirk/components/book_info.dart';
import 'package:quill_and_quirk/components/book_rating.dart';
import 'package:quill_and_quirk/pages/product_page.dart';

import '../models/book.dart';

class BookTile extends StatelessWidget {
  final Book book;
  final void Function()? onTap;
  const BookTile({super.key, required this.book, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        MaterialPageRoute route =
            MaterialPageRoute(builder: (_) => ProductPage(book: book));
        Navigator.push(context, route);
      },
      child: Container(
        margin: const EdgeInsets.only(left: 25),
        width: 260,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Book Title
                      BookInfo(
                        title: book.title,
                        author: book.author,
                        price: book.price,
                        fontSize: 16.0,
                      ),
                      AverageBookRating(
                        book: book,
                        fontSize: 10.0,
                      ),
                      // const SizedBox(height: 5.0),
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
      ),
    );
  }
}
