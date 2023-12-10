import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quill_and_quirk/components/book_info.dart';
import 'package:quill_and_quirk/components/book_rating.dart';
import 'package:quill_and_quirk/models/book.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:provider/provider.dart';
import 'package:quill_and_quirk/models/cart.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key, required this.book});

  final Book book;

  // add book to cart
  void addBookToCart(BuildContext context, Book book) {
    Provider.of<Cart>(context, listen: false).addItemToCart(book);

    // Alert the user that book was successfully added
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        title: Text('Successfully added!'),
        content: Text('Check your cart'),
      ),
    );
  }

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
                  ExpandableText(
                    book.description,
                    expandText: 'Read more',
                    collapseText: 'Read less',
                    maxLines: 8,
                    style: TextStyle(
                      fontFamily: GoogleFonts.crimsonPro().fontFamily,
                      fontSize: 16,
                    ),
                  ),

                  const SizedBox(height: 32),

                  // add to cart
                  GestureDetector(
                    onTap: () => addBookToCart(context, book),
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 53, 94, 43),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Center(
                        child: Text(
                          "Add To Cart",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: GoogleFonts.crimsonPro().fontFamily,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),

                  // TODO: save for later button
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
