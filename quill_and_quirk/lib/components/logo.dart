import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
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
    );
  }
}
