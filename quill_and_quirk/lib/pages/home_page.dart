import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:quill_and_quirk/components/bottom_nav.dart';
import 'package:quill_and_quirk/pages/account_page.dart';
import 'package:quill_and_quirk/pages/saved_page.dart';
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

    // saved for later page
    const SavedPage(),

    // profile page
    const AccountPage(),
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

        // Hamburger menu for categories
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

        // Bookstore logo
        // todo: need to make it into a button to home
        title: Padding(
          padding: const EdgeInsets.only(left: 70.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Quirk',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 53, 94, 43),
                        fontFamily: GoogleFonts.crimsonPro().fontFamily,
                        fontSize: 24.0,
                      ),
                    ),
                    TextSpan(
                      text: ' & ',
                      style: TextStyle(
                        color: Colors.amber,
                        height: 1.5,
                        fontFamily: GoogleFonts.crimsonPro().fontFamily,
                        fontSize: 18.0,
                      ),
                    ),
                    TextSpan(
                      text: 'Quill',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 53, 94, 43),
                        fontFamily: GoogleFonts.crimsonPro().fontFamily,
                        fontSize: 24.0,
                      ),
                    ),
                  ],
                ),
              ),

              // Profile Icon
              // todo: Need to make it into a button
              Icon(
                CupertinoIcons.profile_circled,
                color: Colors.grey.shade700,
                size: 28.0,
              ),
            ],
          ),
        ),
      ),

      // Slide out categories menu
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
