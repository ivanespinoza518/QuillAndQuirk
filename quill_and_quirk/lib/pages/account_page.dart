import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';

class AccountPage extends StatefulWidget {
  final String savedText;

  const AccountPage({Key? key, required this.savedText}) : super(key: key);

  //const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const SizedBox(height: 20), // Empty space

          // Greet the user
          Text(
            "Hey, ${widget.savedText}!",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.grey.shade800,
              fontFamily: GoogleFonts.crimsonPro().fontFamily,
              fontSize: 20.0,
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 48),

          Container(
            child: Center(
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'You have ',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 53, 94, 43),
                        fontFamily: GoogleFonts.crimsonPro().fontFamily,
                        fontSize: 24.0,
                      ),
                    ),
                    TextSpan(
                      text: '216 ',
                      style: TextStyle(
                        color: Colors.amber,
                        height: 1.5,
                        fontFamily: GoogleFonts.crimsonPro().fontFamily,
                        fontSize: 18.0,
                      ),
                    ),
                    TextSpan(
                      text: 'points.',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 53, 94, 43),
                        fontFamily: GoogleFonts.crimsonPro().fontFamily,
                        fontSize: 24.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: 48),

          // order history
          Text(
            "Order History",
            style: TextStyle(
              //fontWeight: FontWeight.bold,
              color: Colors.black,
              fontFamily: GoogleFonts.crimsonPro().fontFamily,
              fontSize: 20.0,
            ),
            textAlign: TextAlign.center,
          ),
          Icon(
            CupertinoIcons.chevron_compact_down,
              color: Colors.grey.shade700,
              size: 28.0,
            ),

          const SizedBox(height: 28),

          // email address
          Text(
            "Shipping Address",
            style: TextStyle(
              //fontWeight: FontWeight.bold,
              color: Colors.black,
              fontFamily: GoogleFonts.crimsonPro().fontFamily,
              fontSize: 20.0,
            ),
            textAlign: TextAlign.center,
          ),
          Icon(
            CupertinoIcons.chevron_compact_down,
              color: Colors.grey.shade700,
              size: 28.0,
            ),
            
          const SizedBox(height:28),

          // payment methods
          Text(
            "Payment Methods",
            style: TextStyle(
              //fontWeight: FontWeight.bold,
              color: Colors.black,
              fontFamily: GoogleFonts.crimsonPro().fontFamily,
              fontSize: 20.0,
            ),
            textAlign: TextAlign.center,
          ),
          Icon(
            CupertinoIcons.chevron_compact_down,
              color: Colors.grey.shade700,
              size: 28.0,
            ),

          const SizedBox(height: 28),

            // manage membership
          Text(
            "Manage Membership",
            style: TextStyle(
              //fontWeight: FontWeight.bold,
              color: Colors.black,
              fontFamily: GoogleFonts.crimsonPro().fontFamily,
              fontSize: 20.0,
            ),
            textAlign: TextAlign.center,
          ),
          Icon(
            CupertinoIcons.chevron_compact_down,
              color: Colors.grey.shade700,
              size: 28.0,
            ),
            
        ], // children
      ),
    );
  }
}
