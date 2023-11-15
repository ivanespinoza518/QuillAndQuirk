import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:quill_and_quirk/models/cart.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Column(
        children: [
          // Checkout header
          const Text(
            'Checkout',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),

          // Maybe this should go in the checkout page
          // Costs
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0),
            child: Column(
              children: [
                // Subtotal
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Subtotal',
                      style: TextStyle(
                          color: Colors.grey[800],
                          fontFamily: GoogleFonts.crimsonPro().fontFamily,
                          fontSize: 18.0),
                    ),
                    Text(
                      '\$${value.getSubtotal().abs().toStringAsFixed(2)}',
                      style: TextStyle(
                          color: Colors.grey[800],
                          fontFamily: GoogleFonts.crimsonPro().fontFamily,
                          fontSize: 18.0),
                    ),
                  ],
                ),

                // Space
                const SizedBox(height: 10),

                // Estimated Tax
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Estimated Tax',
                      style: TextStyle(
                          color: Colors.grey[800],
                          fontFamily: GoogleFonts.crimsonPro().fontFamily,
                          fontSize: 18.0),
                    ),
                    Text(
                      '\$${(value.getTaxes()).abs().toStringAsFixed(2)}',
                      style: TextStyle(
                          color: Colors.grey[800],
                          fontFamily: GoogleFonts.crimsonPro().fontFamily,
                          fontSize: 18.0),
                    ),
                  ],
                ),

                // space with divider
                Divider(
                  height: 20,
                  thickness: 0.8,
                  color: Colors.grey[800],
                ),

                // Total
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Estimated total',
                      style: TextStyle(
                          color: Colors.grey[800],
                          fontFamily: GoogleFonts.crimsonPro().fontFamily,
                          fontSize: 21.0),
                    ),
                    Text(
                      '\$${(value.getSubtotal() + value.getTaxes()).abs().toStringAsFixed(2)}',
                      style: TextStyle(
                          color: Colors.grey[800],
                          fontFamily: GoogleFonts.crimsonPro().fontFamily,
                          fontSize: 21.0),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
