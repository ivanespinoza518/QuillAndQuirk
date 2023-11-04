import 'package:flutter/material.dart';

import 'package:quill_and_quirk/components/book_tile.dart';
import 'package:quill_and_quirk/models/book.dart';
import 'package:quill_and_quirk/models/category.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // search bar
        Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.symmetric(horizontal: 25),
          decoration: BoxDecoration(
            color: Colors.grey[100],
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

        // message
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 25.0),
          child: Text(
            'Welcome Back!',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),

        // popular books
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Popular Books',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.green[900],
                  fontSize: 24,
                ),
              ),
              Text(
                'See all',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.green[900]),
              )
            ],
          ),
        ),

        const SizedBox(height: 10),

        Expanded(
          child: ListView.builder(
            itemCount: 4,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              Book book = Book(
                title: 'Sword Catcher',
                price: 24.99,
                image: 'lib/images/SwordCatcher.png',
                category: Category(
                    name: 'Fantasy',
                    bgColor: Colors.blue.withOpacity(0.8),
                    txtColor: Colors.black54),
              );
              return BookTile(book: book);
            },
          ),
        ),
      ],
    );
  }
}
