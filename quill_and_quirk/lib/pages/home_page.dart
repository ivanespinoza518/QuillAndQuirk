import 'package:flutter/material.dart';

import 'package:quill_and_quirk/components/bottom_nav.dart';
import 'package:quill_and_quirk/components/logo.dart';
import 'package:quill_and_quirk/pages/account_page.dart';
import 'package:quill_and_quirk/pages/saved_page.dart';
import 'package:quill_and_quirk/pages/shop_page.dart';
import 'package:quill_and_quirk/pages/cart_page.dart';

class HomePage extends StatefulWidget {
  final String savedText;

  const HomePage({Key? key, required this.savedText}) : super(key: key);

  //const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // pages to display
  List<Widget> _buildPages() {
    return [
      // shop page
      ShopPage(savedText: widget.savedText),

      // cart page
      const CartPage(),

      // saved for later page
      const SavedPage(),

      // profile page
      AccountPage(savedText: widget.savedText),
    ];
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _pages = _buildPages();
    return Scaffold(
      backgroundColor: Colors.grey[200],

      // Bottom Nav Bar
      bottomNavigationBar: BottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),

      // Top App Bar
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,

        // Bookstore logo
        title: const Logo(),
      ),
      body: _pages[_selectedIndex],
    );
  }
}
