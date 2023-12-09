import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quill_and_quirk/constants/app_sizes.dart';
import 'package:quill_and_quirk/models/top_ten_books.dart';
import 'search_page.dart';

import 'package:quill_and_quirk/components/book_tile.dart';
import 'package:quill_and_quirk/models/book.dart';
import 'package:quill_and_quirk/models/cart.dart';

class ShopPage extends StatefulWidget {
  final String savedText;

  const ShopPage({Key? key, required this.savedText}) : super(key: key);

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  TopTenBooks topTenBooks = TopTenBooks();
  late Future<void> initializeTopTenBooksFuture;

  @override
  void initState() {
    super.initState();
    initializeTopTenBooksFuture = initializeTopTenBooks();
  }

  Future<void> initializeTopTenBooks() async {
    await topTenBooks.initializeTopTen();
  }

  // add shoe to cart
  void addBookToCart(Book book) {
    Provider.of<Cart>(context, listen: false).addItemToCart(book);

    // Alert the user that book was successfully added
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        title: Text('Successfully added!'),
        content: Text('Check your cart'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Column(
        children: [
          // search bar
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SearchPage(),
              ),
            ),
            child: Container(
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.symmetric(horizontal: 25),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Search',
                    style: TextStyle(color: Colors.grey),
                  ),
                  Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
          ),

          // message
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25.0),
            child: Text(
              'Welcome Back, ${widget.savedText}!',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: GoogleFonts.crimsonPro().fontFamily,
                color: Colors.black,
              ),
            ),
          ),

          // popular books
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Top 10 Books',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 53, 94, 43),
                    fontSize: 24,
                  ),
                ),
              ],
            ),
          ),

          gapH12,

          // List of books
          Expanded(
            child: FutureBuilder(
              future: initializeTopTenBooksFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return ListView.builder(
                    itemCount: topTenBooks.books.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      // get a book from shop list
                      Book book = topTenBooks.books[index];

                      // return the book
                      return BookTile(
                        book: book,
                        onTap: () => addBookToCart(book),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),

          gapH12,
        ],
      ),
    );
  }
}
