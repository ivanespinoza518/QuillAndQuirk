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
      ),

      // Hamburger slide out menu
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
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
                            height: 1.5,
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

                // Divider
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
                ),

                // Title list
                const Padding(
                  padding: EdgeInsets.only(left: 5.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.info,
                      color: Colors.black,
                    ),
                    title: Text(
                      'About',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),

            // Title list
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
