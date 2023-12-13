import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:quill_and_quirk/components/cart_item.dart';
import 'package:quill_and_quirk/components/checkout_menu.dart';
import 'package:quill_and_quirk/constants/app_sizes.dart';
import 'package:quill_and_quirk/models/book.dart';
import 'package:quill_and_quirk/models/cart.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void _showCheckoutMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return const CheckoutMenu();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Consumer<Cart>(
      builder: (context, value, child) => Column(
        children: [
          // Shopping cart heading (maybe make into a switch)
          Row(
            children: [
              Container(
                alignment: Alignment.center,
                width: screenWidth,
                height: 35,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.black,
                      width: 3,
                    ),
                  ),
                ),
                child: Text(
                  'Shopping Cart',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    fontFamily: GoogleFonts.crimsonPro().fontFamily,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),

          // space
          gapH4,

          // If cart is empty, display message
          (value.getUserCart().isEmpty)
              ? Expanded(
                  child: Container(
                    width: screenWidth,
                    color: Colors.white,
                    child: Center(
                      child: Text(
                        'Your shopping bag is empty!',
                        style: TextStyle(
                          fontFamily: GoogleFonts.crimsonPro().fontFamily,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ),
                )
              :

              // Else, display Cart items
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

          // If cart is not empty, display checkout button
          // Checkout button
          value.getUserCart().isNotEmpty
              ? GestureDetector(
                  onTap: () {
                    _showCheckoutMenu(context);
                  },
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
                )
              : Container(),
        ],
      ),
    );
  }
}
