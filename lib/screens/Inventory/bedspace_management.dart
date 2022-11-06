import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/colors.dart';
import '../HomePage/home_screen.dart';

class BedspaceManagement extends StatefulWidget {
  const BedspaceManagement({super.key});

  @override
  State<BedspaceManagement> createState() => _BedspaceManagementState();
}

class _BedspaceManagementState extends State<BedspaceManagement> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: primaryColor,
        centerTitle: false,
        title: Text(
          "BEDSPACE MANAGEMENT",
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
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.2,
              height:80,
              child: ListTile(
                // selected: selectedIndex == 1,
                tileColor: primaryColor,
                title: Text(
                  "VIEW  BEDSPACE STATUS",
                  style: GoogleFonts.rubik(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w400),
                ),
                onTap: () {},
              ),
            ),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.2,
                  height: 80,
                  child: ListTile(
                    // selected: selectedIndex == 1,
                    tileColor: Color(0xFFD9D9D9),
                    title: Text(
                      "32 OCCUPIED",
                      style: GoogleFonts.rubik(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w400),
                    ),
                    onTap: () {},
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.2,
                  height: 80,
                  child: ListTile(
                    // selected: selectedIndex == 1,
                    tileColor: Color(0xFFD9D9D9),
                    title: Text(
                      "18 FREE",
                      style: GoogleFonts.rubik(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w400),
                    ),
                    onTap: () {},
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.2,
              height: 80,
              child: ListTile(
                // selected: selectedIndex == 1,
                tileColor: primaryColor,
                title: Text(
                  "MANAGE BOOKINGS",
                  style: GoogleFonts.rubik(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w400),
                ),
                onTap: () {},
              ),
            ),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.2,
                  height: 80,
                  child: ListTile(
                    // selected: selectedIndex == 1,
                    tileColor: Color(0xFFD9D9D9),
                    title: Text(
                      "BOOK BEDSPACE",
                      style: GoogleFonts.rubik(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w400),
                    ),
                    onTap: () {},
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.2,
                  height: 80,
                  child: ListTile(
                    // selected: selectedIndex == 1,
                    tileColor: Color(0xFFD9D9D9),
                    title: Text(
                      "CANCEL BOOKING",
                      style: GoogleFonts.rubik(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w400),
                    ),
                    onTap: () {},
                  ),
                ),
              ],
            )
          ],
        ),
      ))),
    );
  }
}
