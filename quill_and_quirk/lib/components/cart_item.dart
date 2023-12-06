import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quill_and_quirk/components/book_info.dart';
import 'package:quill_and_quirk/components/two_column_layout.dart';
import 'package:quill_and_quirk/constants/app_sizes.dart';

import 'package:quill_and_quirk/models/book.dart';
import 'package:quill_and_quirk/models/cart.dart';

class CartItem extends StatefulWidget {
  Book book;
  CartItem({
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
          startContent: Image.network(
            widget.book.image,
            height: 120,
          ),
          spacing: Sizes.p24,
          endContent: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              BookInfo(
                title: widget.book.title,
                author: widget.book.author,
                price: widget.book.price,
                fontSize: 24.0,
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

                  // TODO: Wrap in Gesture Detector and Implement onTap
                  Text(
                    "Save for Later",
                    style: TextStyle(
                      color: Colors.amber,
                      fontFamily: GoogleFonts.crimsonPro().fontFamily,
                      fontSize: 18,
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


                // Container(
                //   decoration: BoxDecoration(
                //     color: Colors.white,
                //     border: Border.all(
                //       color: Colors.amber,
                //       width: 2.0,
                //     ),
                //   ),
                //   width: 100.0,
                //   height: 40.0,
                //   child: Padding(
                //     padding: const EdgeInsets.all(4.0),
                //     child: Center(
                //       child: Text(
                //         "Remove",
                //         style: TextStyle(
                //           color: Colors.amber,
                //           fontFamily: GoogleFonts.crimsonPro().fontFamily,
                //           fontSize: 18,
                //         ),
                //       ),
                //     ),
                //   ),
                // ),

      // ListTile(
      //   leading: Image.network(
      //     widget.book.image,
      //     height: 200,
      //   ),
      //   title: Text(widget.book.title),
      //   subtitle: Text('\$${widget.book.price}'),
      //   trailing: IconButton(
      //     icon: const Icon(
      //       Icons.delete,
      //       color: Colors.amber,
      //     ),
      //     onPressed: removeItemFromCart,
      //   ),
      // ),