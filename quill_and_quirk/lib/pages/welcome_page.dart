import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quill_and_quirk/components/text_field.dart';

import 'home_page.dart';

class WelcomePage extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();

  WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 53, 94, 43),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Image.asset(
                    'lib/images/gold_quill.png',
                    height: 240,
                  ),
                ),

                // Title
                Text(
                  'Quirk & Quill Books',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: GoogleFonts.crimsonPro().fontFamily,
                    fontSize: 30,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 24), //Empty space

                // Subtitle
                // const Text(
                //   'Welcome!',
                //   style: TextStyle(
                //     fontSize: 16,
                //   ),
                //   textAlign: TextAlign.center,
                // ),

                const SizedBox(height: 48), // Empty space

                // Username
                MyTextField(
                  hintText: "Username",
                  obscureText: false,
                  controller: usernameController,
                ),

                const SizedBox(height: 48), // Empty space

                // Sign in button
                GestureDetector(
                  onTap: () {
                    String user = usernameController.text;

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(savedText: user),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xffd3a553),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      padding: const EdgeInsets.all(25),
                      child: Center(
                        child: Text(
                          "Sign in",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: GoogleFonts.crimsonPro().fontFamily,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ], // children
            ),
          ),
        ),
      ),
    );
  }
}
