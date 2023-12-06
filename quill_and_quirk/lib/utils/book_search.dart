// import 'package:http/http.dart' as http;
// import 'dart:convert';

// import 'package:quill_and_quirk/models/book.dart';

// class GoogleBooksApi {
//   static Future<Map<String, dynamic>> getBook(String bookId) async {
//     final response = await http.get(
//       Uri.parse('https://www.googleapis.com/books/v1/volumes/$bookId'),
//     );

//     if (response.statusCode == 200) {
//       final restJson = json.decode(response.body);
//       final bookMap = restJson['items'];
//       return bookMap;
//     } else {
//       throw Exception('Failed to load book');
//     }
//   }
// }
