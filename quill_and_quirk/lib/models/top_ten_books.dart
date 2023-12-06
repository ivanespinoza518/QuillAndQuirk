import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:quill_and_quirk/models/book.dart';

class TopTenBooks {
  List<Book> books = [];

  Future<void> initializeTopTen() async {
    await getBook('PGR2AwAAQBAJ'); // To Kill a Mockingbird
    await getBook('3qxaBAAAQBAJ'); // Don Quixote
    await getBook('0CFAjgEACAAJ'); // Lord of the Rings
    await getBook('kotPYEqx7kMC'); // 1984
    await getBook('YljRDwAAQBAJ'); // The Lion, the Witch, and the Wardrobe
    await getBook('jZMpaRdaUzsC'); // Gone with the Wind
    await getBook('Hcw8PgAACAAJ'); // Lord of the Flies
    await getBook('XafcRGXoez4C'); // One Flew Over the Cuckoo's Nest
    await getBook('R-tBPgAACAAJ'); // Catcher in the Rye
    await getBook('3wSTtgAACAAJ'); // Catch-22
  }

  Future<void> getBook(String bookId) async {
    final response = await http.get(
      Uri.parse('https://www.googleapis.com/books/v1/volumes/$bookId'),
    );

    if (response.statusCode == 200) {
      final restJson = json.decode(response.body);
      final bookMap = restJson['volumeInfo'];
      books.add(Book.mapSingleBook(bookMap));
    } else {
      throw Exception('Failed to load book');
    }
  }
}
