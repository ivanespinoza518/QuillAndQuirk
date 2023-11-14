import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
      ),
      margin: const EdgeInsets.only(bottom: 5),
      child: ListTile(
        leading: Image.asset(widget.book.image),
        title: Text(widget.book.title),
        subtitle: Text('\$${widget.book.price}'),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: removeItemFromCart,
        ),
      ),
    );
  }
}
