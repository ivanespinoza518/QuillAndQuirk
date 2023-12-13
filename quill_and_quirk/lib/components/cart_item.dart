import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quill_and_quirk/components/book_info.dart';
import 'package:quill_and_quirk/components/two_column_layout.dart';
import 'package:quill_and_quirk/constants/app_sizes.dart';

import 'package:quill_and_quirk/models/book.dart';
import 'package:quill_and_quirk/models/cart.dart';
import 'package:quill_and_quirk/pages/product_page.dart';

class CartItem extends StatefulWidget {
  final Book book;
  const CartItem({
    super.key,
    required this.book,
  });

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  // Remove from cart
  void removeItemFromCart() {
    Provider.of<Cart>(context, listen: false).removeItemFromCart(widget.book);
  }

  void addItemToSaved(BuildContext context, Book book) {
    // Add to Saved List
    Provider.of<Cart>(context, listen: false).addItemToSaved(widget.book);

    // Remove from cart
    removeItemFromCart();

    // Alert the user that book was successfully added
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        title: Text('Successfully added!'),
        content: Text('Check your saved list'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            color: Colors.black,
            width: 1.0,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TwoColumnLayout(
          startFlex: 1,
          endFlex: 2,
          startContent: GestureDetector(
            onTap: () {
              MaterialPageRoute route = MaterialPageRoute(
                  builder: (_) => ProductPage(book: widget.book));
              Navigator.push(context, route);
            },
            child: Image.network(
              widget.book.image,
              height: 120,
            ),
          ),
          spacing: Sizes.p24,
          endContent: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              GestureDetector(
                onTap: () {
                  MaterialPageRoute route = MaterialPageRoute(
                      builder: (_) => ProductPage(book: widget.book));
                  Navigator.push(context, route);
                },
                child: BookInfo(
                  title: widget.book.title,
                  author: widget.book.author,
                  price: widget.book.price,
                  fontSize: 24.0,
                ),
              ),
              gapH4,
              Row(
                children: [
                  GestureDetector(
                    onTap: removeItemFromCart,
                    child: Text(
                      "Remove",
                      style: TextStyle(
                        color: Colors.amber,
                        fontFamily: GoogleFonts.crimsonPro().fontFamily,
                        fontSize: 18,
                      ),
                    ),
                  ),

                  gapW12,

                  // Divider
                  const Text(
                    "|",
                    style: TextStyle(
                      color: Colors.amber,
                      fontSize: 24,
                    ),
                  ),

                  gapW12,

                  GestureDetector(
                    onTap: () => addItemToSaved(context, widget.book),
                    child: Text(
                      "Save for Later",
                      style: TextStyle(
                        color: Colors.amber,
                        fontFamily: GoogleFonts.crimsonPro().fontFamily,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
