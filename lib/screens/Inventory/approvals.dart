import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/colors.dart';
import '../HomePage/home_screen.dart';

class Approvals extends StatefulWidget {
  const Approvals({super.key});

  @override
  State<Approvals> createState() => _ApprovalsState();
}

class _ApprovalsState extends State<Approvals> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8E4E4),
      appBar: AppBar(
        backgroundColor: primaryColor,
        centerTitle: false,
        title: Text(
          "APPROVALS",
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
              child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            child: Card(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Table(
                        border: TableBorder
                            .all(), // Allows to add a border decoration around your table
                        children: [
                          TableRow(
                              decoration: const BoxDecoration(
                                color: Color(0xFFB3B3B3),
                              ),
                              children: [
                                Text(
                                  'SELECT',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.rubik(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  'INPUTTER',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.rubik(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  'SUMMARY',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.rubik(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  'DATE OF TIME',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.rubik(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700),
                                ),
                              ]),
                          const TableRow(children: [
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
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 150,
                        child: ListTile(
                          // selected: selectedIndex == 1,
                          tileColor: primaryColor,
                          title: Text(
                            "REVIEW",
                            style: GoogleFonts.rubik(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w400),
                          ),
                          onTap: () {},
                        ),
                      ),
                      SizedBox(height: 10),
                      SizedBox(
                        width: 150,
                        child: ListTile(
                          // selected: selectedIndex == 1,
                          tileColor: primaryColor,
                          title: Text(
                            "APPROVE",
                            style: GoogleFonts.rubik(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w400),
                          ),
                          onTap: () {},
                        ),
                      ),
                      SizedBox(height: 10),
                      SizedBox(
                        width: 150,
                        child: ListTile(
                          // selected: selectedIndex == 1,
                          tileColor: primaryColor,
                          title: Text(
                            "DECLINE",
                            style: GoogleFonts.rubik(
                                color: Colors.white,
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
            ),
          ),
        ],
      ))),
    );
  }
}
