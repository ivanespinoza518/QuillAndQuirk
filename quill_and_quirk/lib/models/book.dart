import 'package:quill_and_quirk/constants/min_book_price.dart';

/// model for book
class Book {
  late String id;
  late String title;
  late String author;
  late String description;
  late double price;
  late String image;
  late String category;
  late double averageRating;
  late int numRatings;

  Book(
    this.id,
    this.title,
    this.author,
    this.description,
    this.price,
    this.image,
    this.category,
    this.averageRating,
    this.numRatings,
  );

  Book.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    title = map['volumeInfo']['title'];
    author = (map['volumeInfo']['authors'] == null)
        ? ''
        : map['volumeInfo']['authors'].toString();
    description = (map['volumeInfo']['description'] == null)
        ? ''
        : map['volumeInfo']['description'].toString();
    price = _extractPriceByVolume(map);
    category = (map['volumeInfo']['categories'] == null)
        ? ''
        : map['volumeInfo']['categories'].toString();

    try {
      image = (map['volumeInfo']['imageLinks']['smallThumbnail'] == null)
          ? ''
          : map['volumeInfo']['imageLinks']['smallThumbnail'].toString();
    } catch (err) {
      image = '';
    }

    averageRating = map['volumeInfo']['averageRating']?.toDouble() ?? 0.0;
    numRatings = map['volumeInfo']['ratingsCount'] as int? ?? 0;
  }

  Book.mapSingleBook(Map<String, dynamic> map) {
    id = map['id'] ?? '';
    title = map['title'] ?? '';
    author = (map['authors'] as List<dynamic>?)
            ?.map((dynamic author) => author.toString())
            .join(', ') ??
        '';
    description = map['description'] ?? '';
    price = _extractPriceById(map);
    category = (map['categories'] as List<dynamic>?)
            ?.map((dynamic category) => category.toString())
            .join(', ') ??
        '';

    try {
      image = (map['imageLinks']?['smallThumbnail'] == null)
          ? ''
          : map['imageLinks']!['smallThumbnail'].toString();
    } catch (err) {
      image = '';
    }

    averageRating = map['averageRating']?.toDouble() ?? 0.0;
    numRatings = map['ratingsCount'] as int? ?? 0;
  }

  double _extractPriceById(Map<String, dynamic> map) {
    try {
      return map['retailPrice']?['amount']?.toDouble();
    } catch (err) {
      return minBookPrice;
    }
  }

  double _extractPriceByVolume(Map<String, dynamic> map) {
    try {
      // Navigate through the nested keys to get the price
      final saleInfo = map['saleInfo'] as Map<String, dynamic>? ?? {};
      final listPrice = saleInfo['listPrice'] as Map<String, dynamic>? ?? {};
      final retailPrice =
          listPrice['retailPrice'] as Map<String, dynamic>? ?? {};
      final amount = retailPrice['amount']?.toDouble();
      return amount;
    } catch (err) {
      return minBookPrice;
    }
  }
}
