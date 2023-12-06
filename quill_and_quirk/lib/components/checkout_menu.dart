import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:quill_and_quirk/models/cart.dart';

class CheckoutMenu extends StatelessWidget {
  const CheckoutMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 1.8,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(15.0),
          topRight: Radius.circular(15.0),
        ),
        child: Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Consumer<Cart>(
                builder: (context, value, child) => Column(
                  children: [
                    // Checkout header
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Text(
                        'Review Order',
                        style: TextStyle(
                          fontFamily: GoogleFonts.crimsonPro().fontFamily,
                          fontSize: 24,
                        ),
                      ),
                    ),

                    const Divider(
                      height: 1.0,
                      thickness: 1.0,
                      color: Colors.black,
                    ),

                    // todo: Add form for shipping + payment info

                    // Costs
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15.0,
                        vertical: 15.0,
                      ),
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
                                    fontFamily:
                                        GoogleFonts.crimsonPro().fontFamily,
                                    fontSize: 18.0),
                              ),
                              Text(
                                '\$${value.getSubtotal().abs().toStringAsFixed(2)}',
                                style: TextStyle(
                                    color: Colors.grey[800],
                                    fontFamily:
                                        GoogleFonts.crimsonPro().fontFamily,
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
                                    fontFamily:
                                        GoogleFonts.crimsonPro().fontFamily,
                                    fontSize: 18.0),
                              ),
                              Text(
                                '\$${(value.getTaxes()).abs().toStringAsFixed(2)}',
                                style: TextStyle(
                                    color: Colors.grey[800],
                                    fontFamily:
                                        GoogleFonts.crimsonPro().fontFamily,
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
                                    fontFamily:
                                        GoogleFonts.crimsonPro().fontFamily,
                                    fontSize: 21.0),
                              ),
                              Text(
                                '\$${(value.getSubtotal() + value.getTaxes()).abs().toStringAsFixed(2)}',
                                style: TextStyle(
                                    color: Colors.grey[800],
                                    fontFamily:
                                        GoogleFonts.crimsonPro().fontFamily,
                                    fontSize: 21.0),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
