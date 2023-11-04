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
      backgroundColor: Colors.grey[200],

      // Bottom Nav Bar
      bottomNavigationBar: BottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),

      // Top App Bar
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Padding(
              padding: EdgeInsets.only(left: 12.0),
              child: Icon(Icons.menu, color: Colors.black),
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        title: Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Quirk',
              style: TextStyle(
                  color: Colors.green[900],
                  fontFamily: GoogleFonts.crimsonPro().fontFamily,
                  fontSize: 24.0),
            ),
            Text(
              ' & ',
              style: TextStyle(
                  color: Colors.yellow[600],
                  height: 1.5,
                  fontFamily: GoogleFonts.crimsonPro().fontFamily,
                  fontSize: 18.0),
            ),
            Text(
              'Quill',
              style: TextStyle(
                  color: Colors.green[900],
                  fontFamily: GoogleFonts.crimsonPro().fontFamily,
                  fontSize: 24.0),
            ),
          ],
        ),
      ),

      // Hamburger slide out menu
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SizedBox(
                  height: 100,
                  child: DrawerHeader(
                    child: Text(
                      'Categories',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: GoogleFonts.crimsonPro().fontFamily,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                // Divider
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Divider(color: Colors.grey[800]),
                ),

                // Fiction Category
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.book,
                      color: Colors.green[900],
                    ),
                    title: const Text(
                      'Fiction',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),

                // Nonfiction Category
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.book,
                      color: Colors.green[900],
                    ),
                    title: const Text(
                      'Nonfiction',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),

                // Biography Category
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.book,
                      color: Colors.green[900],
                    ),
                    title: const Text(
                      'Biography',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),

                // Fantasy/Scifi Category
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.book,
                      color: Colors.green[900],
                    ),
                    title: const Text(
                      'Fantasy / Scifi',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),

            // Logout
            const Padding(
              padding: EdgeInsets.only(left: 5.0, bottom: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.logout,
                  color: Colors.black,
                ),
                title: Text(
                  'Logout',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
      body: _pages[_selectedIndex],
    );
  }
}
