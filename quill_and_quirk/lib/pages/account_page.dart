import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quill_and_quirk/pages/welcome_page.dart';

class AccountPage extends StatefulWidget {
  final String savedText;

  const AccountPage({Key? key, required this.savedText}) : super(key: key);

  //const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class Item {
  Item({
    required this.expandedValue,
    required this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}

List<Item> generateItems() {
  return [
    Item(
      headerValue: "Email Address",
      expandedValue: "booklover123@myemail.com",
    ),
    Item(
      headerValue: "Shipping Address",
      expandedValue: "123 Main St, Northridge, CA",
    ),
    Item(
      headerValue: "Payment Methods",
      expandedValue: "Debit Card ending in .... 5678",
    ),
    Item(
      headerValue: "Past Orders",
      expandedValue: "You have no past orders",
    ),
  ];
}

class _AccountPageState extends State<AccountPage> {
  final List<Item> _data = generateItems();

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

          _buildPanel(),

          const SizedBox(height: 48),

          // sign out button
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WelcomePage(),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 53, 94, 43),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Center(
                  child: Text(
                    "Sign Out",
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
    );
  }

  Widget _buildPanel() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _data[index].isExpanded = isExpanded;
        });
      },
      children: _data.map<ExpansionPanel>((Item item) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(item.headerValue),
            );
          },
          body: ListTile(
            title: Text(item.expandedValue),
          ),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }
}
