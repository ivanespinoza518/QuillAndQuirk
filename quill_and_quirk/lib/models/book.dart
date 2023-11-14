import 'package:quill_and_quirk/models/category.dart';

/// model for book
class Book {
  final String title;
  final String author;
  final double price;
  final String image;
  final Category category;

  Book(
      {required this.title,
      required this.author,
      required this.price,
      required this.image,
      required this.category});
}
