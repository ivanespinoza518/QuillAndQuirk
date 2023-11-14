import 'package:flutter/material.dart';

import 'package:quill_and_quirk/models/book.dart';
import 'package:quill_and_quirk/models/category.dart';

class Cart extends ChangeNotifier {
  // list of books for sale
  List<Book> bookStore = [
    Book(
      title: 'Basics with Babish',
      author: 'Andrea Rea',
      price: 15.99,
      image: 'lib/images/BasicsWithBabish.png',
      category: Category(
        name: 'Cooking',
        bgColor: Colors.yellow,
        txtColor: Colors.black54,
      ),
    ),
    Book(
      title: 'Iron Flame',
      author: 'author',
      price: 22.99,
      image: 'lib/images/IronFlame.png',
      category: Category(
        name: 'Fantasy',
        bgColor: Colors.blue.withOpacity(0.8),
        txtColor: Colors.black54,
      ),
    ),
    Book(
      title: 'Sword Catcher',
      author: 'Cassandra Claire',
      price: 24.99,
      image: 'lib/images/SwordCatcher.png',
      category: Category(
        name: 'Fantasy',
        bgColor: Colors.blue.withOpacity(0.8),
        txtColor: Colors.black54,
      ),
    ),
    Book(
      title: 'The Way of Kings',
      author: 'Brandon Sanderson',
      price: 24.99,
      image: 'lib/images/TheWayOfKings.png',
      category: Category(
        name: 'Fantasy',
        bgColor: Colors.blue.withOpacity(0.8),
        txtColor: Colors.black54,
      ),
    ),
  ];

  // list of items in user cart
  List<Book> userCart = [];

  // get list of books for sale
  List<Book> getBookList() {
    return bookStore;
  }

  // get cart
  List<Book> getUserCart() {
    return userCart;
  }

  // add items to cart
  void addItemToCart(Book book) {
    userCart.add(book);
    notifyListeners();
  }

  // remove item from cart
  void removeItemFromCart(Book book) {
    userCart.remove(book);
    notifyListeners();
  }
}
