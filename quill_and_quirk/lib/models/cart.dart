import 'package:flutter/material.dart';

import 'package:quill_and_quirk/models/book.dart';

class Cart extends ChangeNotifier {
  // list of items in user cart
  List<Book> userCart = [];

  // list of items in user saved list
  List<Book> userSaved = [];

  // subtotal before taxes
  double subtotal = 0.0;

  // get cart
  List<Book> getUserCart() {
    return userCart;
  }

  // get saved list
  List<Book> getUserSaved() {
    return userSaved;
  }

  double getSubtotal() {
    return subtotal;
  }

  double getTaxes() {
    return subtotal * .10;
  }

  // add items to cart
  void addItemToCart(Book book) {
    userCart.add(book);
    subtotal += book.price;
    notifyListeners();
  }

  // add items to saved list
  void addItemToSaved(Book book) {
    userSaved.add(book);
    notifyListeners();
  }

  // remove item from cart
  void removeItemFromCart(Book book) {
    userCart.remove(book);
    subtotal -= book.price;
    notifyListeners();
  }

  // remove item from saved list
  void removeItemFromSaved(Book book) {
    userSaved.remove(book);
    notifyListeners();
  }
}
