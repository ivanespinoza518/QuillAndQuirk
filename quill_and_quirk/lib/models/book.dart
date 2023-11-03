import 'package:quill_and_quirk/models/category.dart';

/// model for book
class Book {
  final String title;
  final int price;
  final String image;
  final Category category;

  Book(this.title, this.price, this.image, this.category);
}
