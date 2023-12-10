import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:quill_and_quirk/components/saved_item.dart';
import 'package:quill_and_quirk/models/book.dart';
import 'package:quill_and_quirk/models/cart.dart';


class SavedPage extends StatefulWidget {
  const SavedPage({super.key});

  @override
  State<SavedPage> createState() => _SavedPageState();
}

class _SavedPageState extends State<SavedPage> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Consumer<Cart>(
      builder: (context, value, child) => Column(
        children: [
          const SizedBox(height: 5),

          // If page is empty, display message
          (value.getUserSaved().isEmpty)
              ? Expanded(
                  child: Container(
                    width: screenWidth,
                    color: Colors.white,
                    child: Center(
                      child: Text(
                        'Your saved list is empty!',
                        style: TextStyle(
                          fontFamily: GoogleFonts.crimsonPro().fontFamily,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ),
                )
              :

              // Else, display saved items
              Expanded(
                  child: ListView.builder(
                    itemCount: value.getUserSaved().length,
                    itemBuilder: (context, index) {
                      // Get individual book
                      Book individualBook = value.getUserSaved()[index];

                      // return saved item
                      return SavedItem(book: individualBook);
                    },
                  ),
                ),
        ],
      ),
    );
  }
}
