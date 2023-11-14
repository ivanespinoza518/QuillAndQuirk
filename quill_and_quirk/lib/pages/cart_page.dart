import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:quill_and_quirk/components/cart_item.dart';
import 'package:quill_and_quirk/models/book.dart';
import 'package:quill_and_quirk/models/cart.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
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
            )
          ],
        ),
      ),
    );
  }
}
