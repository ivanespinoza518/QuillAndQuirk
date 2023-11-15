import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:quill_and_quirk/components/cart_item.dart';
import 'package:quill_and_quirk/models/book.dart';
import 'package:quill_and_quirk/models/cart.dart';
import 'package:quill_and_quirk/pages/checkout_page.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Column(
        children: [
          // Shopping cart heading (maybe make into a switch)
          const Text(
            'Shopping Cart',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),

          // space
          const SizedBox(height: 20),

          // Cart items
          Expanded(
            child: ListView.builder(
              itemCount: value.getUserCart().length,
              itemBuilder: (context, index) {
                // Get individual book
                Book individualBook = value.getUserCart()[index];

                // return cart item
                return CartItem(book: individualBook);
              },
            ),
          ),

          // Checkout button
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CheckoutPage(),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 53, 94, 43),
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(
                        5.0,
                        5.0,
                      ),
                      blurRadius: 10.0,
                      spreadRadius: 2.0,
                    ), //BoxShadow
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(0.0, 0.0),
                      blurRadius: 0.0,
                      spreadRadius: 0.0,
                    ), //BoxShadow
                  ],
                ),
                padding: const EdgeInsets.all(15),
                child: Center(
                  child: Text(
                    "CHECKOUT",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: GoogleFonts.crimsonPro().fontFamily,
                      fontSize: 21,
                    ),
                  ),
                ),
              ),
            ),
          ),

          // // Maybe this should go in the checkout page
          // // Costs
          // Padding(
          //   padding: const EdgeInsets.only(left: 15.0, right: 15.0),
          //   child: Column(
          //     children: [
          //       // Subtotal
          //       Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: [
          //           Text(
          //             'Subtotal',
          //             style: TextStyle(
          //                 color: Colors.grey[800],
          //                 fontFamily: GoogleFonts.crimsonPro().fontFamily,
          //                 fontSize: 18.0),
          //           ),
          //           Text(
          //             '\$put price here',
          //             style: TextStyle(
          //                 color: Colors.grey[800],
          //                 fontFamily: GoogleFonts.crimsonPro().fontFamily,
          //                 fontSize: 18.0),
          //           ),
          //         ],
          //       ),

          //       // Space
          //       const SizedBox(height: 10),

          //       // Estimated Tax
          //       Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: [
          //           Text(
          //             'Estimated Tax',
          //             style: TextStyle(
          //                 color: Colors.grey[800],
          //                 fontFamily: GoogleFonts.crimsonPro().fontFamily,
          //                 fontSize: 18.0),
          //           ),
          //           Text(
          //             '\$put price here',
          //             style: TextStyle(
          //                 color: Colors.grey[800],
          //                 fontFamily: GoogleFonts.crimsonPro().fontFamily,
          //                 fontSize: 18.0),
          //           ),
          //         ],
          //       ),

          //       // space with divider
          //       Divider(
          //         height: 20,
          //         thickness: 0.8,
          //         color: Colors.grey[800],
          //       ),

          //       // Total
          //       Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: [
          //           Text(
          //             'Estimated total',
          //             style: TextStyle(
          //                 color: Colors.grey[800],
          //                 fontFamily: GoogleFonts.crimsonPro().fontFamily,
          //                 fontSize: 21.0),
          //           ),
          //           Text(
          //             '\$put price here',
          //             style: TextStyle(
          //                 color: Colors.grey[800],
          //                 fontFamily: GoogleFonts.crimsonPro().fontFamily,
          //                 fontSize: 21.0),
          //           ),
          //         ],
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
