import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:quill_and_quirk/components/bottom_nav.dart';
import 'package:quill_and_quirk/pages/shop_page.dart';
import 'package:quill_and_quirk/pages/cart_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

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
  final List<Widget> _pages = [
    // shop page
    const ShopPage(),

    // cart page
    const CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      bottomNavigationBar: BottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, color: Colors.black),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),

      // Hamburger slide out menu
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Column(
          children: [
            DrawerHeader(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Quirk',
                    style: TextStyle(
                        color: Colors.green[900],
                        fontFamily: GoogleFonts.crimsonPro().fontFamily,
                        fontSize: 40.0),
                  ),
                  Text(
                    ' & ',
                    style: TextStyle(
                        color: Colors.yellow[600],
                        fontFamily: GoogleFonts.crimsonPro().fontFamily,
                        fontSize: 30.0),
                  ),
                  Text(
                    'Quill',
                    style: TextStyle(
                        color: Colors.green[900],
                        fontFamily: GoogleFonts.crimsonPro().fontFamily,
                        fontSize: 40.0),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Divider(color: Colors.grey[800]),
            ),

            // Title list
            const Padding(
              padding: EdgeInsets.only(left: 5.0),
              child: ListTile(
                leading: Icon(
                  Icons.home,
                  color: Colors.black,
                ),
                title: Text(
                  'Home',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            )
          ],
        ),
      ),
      body: _pages[_selectedIndex],
    );
  }
}
