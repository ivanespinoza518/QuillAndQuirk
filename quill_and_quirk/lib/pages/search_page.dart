import 'package:quill_and_quirk/models/book.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'dart:convert';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  Icon icon = const Icon(Icons.search);
  Widget widgetSearch = const Text(
    'Search',
    style: TextStyle(
      color: Colors.grey,
    ),
  );
  String result = '';
  List<Book> books = List<Book>.empty();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(
            color: Colors.grey,
          ),
          title: widgetSearch,
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                setState(() {
                  if (icon.icon == Icons.search) {
                    icon = const Icon(Icons.cancel);
                    widgetSearch = TextField(
                      textInputAction: TextInputAction.search,
                      style: const TextStyle(color: Colors.black),
                      onSubmitted: (t) => bookSearch(t),
                    );
                  } else {
                    setState(() {
                      widgetSearch = const Text(
                        'Search',
                        style: TextStyle(color: Colors.grey),
                      );
                    });
                  }
                });
              },
            )
          ],
        ),
        body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: books.length,
          itemBuilder: ((BuildContext ctx, int pos) {
            return Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Expanded(
                    child: books[pos].image == ''
                        ? Image.asset('lib/images/image-not-found.jpeg')
                        : Image.network(books[pos].image),
                  ),
                  const SizedBox(height: 10),
                  Text(books[pos].title),
                  //subtitle for authors here, etc
                ],
              ),
              // to change to book info page
              /*onTap: () {
                      MaterialPageRoute route = MaterialPageRoute(
                          builder: (_) => BookPage(books[pos]));
                      Navigator.push(context, route);
                    }, */
            );
          }),
        ));
  }

  Future bookSearch(String text) async {
    final String url = 'https://www.googleapis.com/books/v1/volumes?q=$text';

    try {
      http.get(Uri.parse(url)).then((res) {
        final restJson = json.decode(res.body);
        final bookMap = restJson['items'];
        books = bookMap.map<Book>((m) => Book.fromMap(m)).toList();
        setState(() {
          result = res.body;
        });
      });
    } catch (err) {
      setState(() {
        result = '';
      });
    }

    setState(() {
      result = 'Loading...';
    });
  }
}
