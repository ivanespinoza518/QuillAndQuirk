/// model for book
class Book {
  late String id;
  late String title;
  late String author;
  late String description;
  late double price;
  late String image;
  late String category;

  Book(
    this.id,
    this.title,
    this.author,
    this.description,
    this.price,
    this.image,
    this.category,
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
    //price retrieval may need to be fixed
    /*price = (map['saleInfo']['retailPrice']['amount'] == null)
        ? ''
        : map['saleInfo']['retailPrice']['amount'].toDouble(); */
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
  }

  Book.mapSingleBook(Map<String, dynamic> map) {
    id = map['id'] ?? '';
    title = map['title'] ?? '';
    author = (map['authors'] as List<dynamic>?)
            ?.map((dynamic author) => author.toString())
            .join(', ') ??
        '';
    description = map['description'] ?? '';
    price = 15.99;
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
  }
}
