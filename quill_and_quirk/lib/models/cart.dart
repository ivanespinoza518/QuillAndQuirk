import 'package:flutter/material.dart';

import 'package:quill_and_quirk/models/book.dart';
import 'package:http/http.dart' as http;
import 'package:quill_and_quirk/models/category.dart';

class Cart extends ChangeNotifier {
  // list of books for sale
  //temporary replacement for previous list, category needs to be fixed for this
  List<Book> bookStore = [
    Book(
      '1',
      'Basics with Babish',
      'Andrea Rea',
      '',
      15.99,
      'http://books.google.com/books/content?id=GRSsEAAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api',
      'Cooking',
    ),
    Book(
      '2',
      'Iron Flame',
      'Rebecca Yarros',
      '',
      22.99,
      'http://books.google.com/books/content?id=xIS9EAAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api',
      'Fantasy',
    ),
    Book(
      '3',
      'Sword Catcher',
      'Cassandra Claire',
      '',
      24.99,
      'http://books.google.com/books/content?id=BfyiEAAAQBAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api',
      'Fantasy',
    ),
    Book(
      '4',
      'The Way of Kings',
      'Brandon Sanderson',
      '',
      24.99,
      'http://books.google.com/books/content?id=QVn-CgAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api',
      'Fantasy',
    ),
  ];
  /*List<Book> bookStore = [
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
      author: 'Rebecca Barros',
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
  ]; */

  // list of items in user cart
  List<Book> userCart = [];

  // subtotal before taxes
  double subtotal = 0.0;

  // get list of books for sale
  List<Book> getBookList() {
    return bookStore;
  }

  // get cart
  List<Book> getUserCart() {
    return userCart;
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

  // remove item from cart
  void removeItemFromCart(Book book) {
    userCart.remove(book);
    subtotal -= book.price;
    notifyListeners();
  }
}
