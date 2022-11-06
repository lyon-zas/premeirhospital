import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/colors.dart';
import '../HomePage/home_screen.dart';

class StockTracking extends StatefulWidget {
  const StockTracking({super.key});

  @override
  State<StockTracking> createState() => _StockTrackingState();
}

class _StockTrackingState extends State<StockTracking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: primaryColor,
        centerTitle: false,
        title: Text(
          "STOCK TRACKING",
          style: GoogleFonts.rubik(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.home,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () =>
                Navigator.pushReplacementNamed(context, HomePage.routeName),
          ),
        ],
      ),
      body: SingleChildScrollView(
          child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Card(
                color: const Color(0xFFF5F5F5),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            color: primaryColor,
                            height: 45,
                            width: MediaQuery.of(context).size.width / 5,
                            child: Center(
                              child: ListTile(
                                // selected: selectedIndex == 1,
                                iconColor: Colors.white,
                                title: Text(
                                  "VIEW CONSUMMABLES",
                                  style: GoogleFonts.rubik(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700),
                                ),
                                onTap: () {},
                              ),
                            ),
                          ),
                          Container(
                            color: Color(0xFFD9D9D9),
                            height: 45,
                            width: MediaQuery.of(context).size.width / 4,
                            child: Center(
                              child: ListTile(
                                // selected: selectedIndex == 1,
                                iconColor: Colors.white,
                                title: Text(
                                  "EMERGENCY REQUISITIONS",
                                  style: GoogleFonts.rubik(
                                      color: primaryColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700),
                                ),
                                onTap: () {},
                              ),
                            ),
                          ),
                          Container(
                            color: Color(0xFFD9D9D9),
                            height: 45,
                            width: MediaQuery.of(context).size.width / 6,
                            child: Center(
                              child: ListTile(
                                  // selected: selectedIndex == 1,

                                  iconColor: Colors.white,
                                  title: Text(
                                    "PHYSICAL COUNT",
                                    style: GoogleFonts.rubik(
                                        color: primaryColor,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  onTap: () {}),
                            ),
                          ),
                          Container(
                            color: Color(0xFFD9D9D9),
                            height: 45,
                            width: MediaQuery.of(context).size.width / 6,
                            child: Align(
                              alignment: Alignment.center,
                              child: ListTile(
                                // selected: selectedIndex == 1,
                                iconColor: Colors.white,
                                title: Text(
                                  "FORWARD STOCK",
                                  style: GoogleFonts.rubik(
                                      color: primaryColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700),
                                ),
                                onTap: () {},
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            color: Color(0xFFD9D9D9),
                            height: 45,
                            width: MediaQuery.of(context).size.width / 5,
                            child: Align(
                              alignment: Alignment.center,
                              child: ListTile(
                                // selected: selectedIndex == 1,
                                iconColor: Colors.white,
                                title: Text(
                                  "CREATE REQUISITIONS",
                                  style: GoogleFonts.rubik(
                                      color: primaryColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700),
                                ),
                                onTap: () {
                                  // Navigator.pushNamed(
                                  //     context, FinancialReport.routeName);
                                },
                              ),
                            ),
                          ),
                          Container(
                            color: Color(0xFFD9D9D9),
                            height: 45,
                            width: MediaQuery.of(context).size.width / 6,
                            child: Center(
                              child: ListTile(
                                  // selected: selectedIndex == 1,
                                  iconColor: Colors.white,
                                  title: Text(
                                    "PENDING ORDERS",
                                    style: GoogleFonts.rubik(
                                        color: primaryColor,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  onTap: () {}),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Card(
                color: const Color(0xFFF5F5F5),
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 1.2,
                    child: Column(
                      children: [
                        Table(
                            border: TableBorder
                                .all(), // Allows to add a border decoration around your table
                            children: [
                              TableRow(
                                  decoration: const BoxDecoration(
                                    color: Color(0xFFB3B3B3),
                                  ),
                                  children: [
                                    Text(
                                      'ASSETS',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.rubik(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Text(
                                      'DISCRIPTION',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.rubik(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Text(
                                      'SUPPLIER',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.rubik(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Text(
                                      'PURCHASE',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.rubik(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Text(
                                      'EXPIRY DATE',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.rubik(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Text(
                                      'QUANTITY',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.rubik(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Text(
                                      'BATCH NUMBER',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.rubik(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Text(
                                      'ACTIONS',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.rubik(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ]),
                              const TableRow(children: [
                                Text(
                                  'Bedsheets',
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  '',
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  '',
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  '',
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  '',
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  '',
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  '',
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  'Amend Quantity/Approve amendment',
                                  textAlign: TextAlign.center,
                                ),
                              ]),
                              const TableRow(children: [
                                Text(
                                  'Hospital Gowns',
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  '',
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  '',
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  '',
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  '',
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  '',
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  '',
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  '',
                                  textAlign: TextAlign.center,
                                ),
                              ]),
                              const TableRow(children: [
                                Text(
                                  'Surgical Gloves',
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  '',
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  '',
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  '',
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  '',
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  '',
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  '',
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  '',
                                  textAlign: TextAlign.center,
                                ),
                              ]),
                              const TableRow(children: [
                                Text(
                                  'Hand Sanitisers',
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  '',
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  '',
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  '',
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  '',
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  '',
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  '',
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  '',
                                  textAlign: TextAlign.center,
                                ),
                              ]),
                              const TableRow(children: [
                                Text(
                                  'Cleaning Liquid',
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  '',
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  '',
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  '',
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  '',
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  '',
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  '',
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  '',
                                  textAlign: TextAlign.center,
                                ),
                              ]),
                              const TableRow(children: [
                                Text(
                                  'Pillows',
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  '',
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  '',
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  '',
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  '',
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  '',
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  '',
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  '',
                                  textAlign: TextAlign.center,
                                ),
                              ]),
                            ]),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
