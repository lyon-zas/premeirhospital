import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/colors.dart';

class AuditReport extends StatefulWidget {
  static const routeName = "/AuditReport";
  const AuditReport({super.key});

  @override
  State<AuditReport> createState() => _AuditReportState();
}

class _AuditReportState extends State<AuditReport> {
  late dynamic _selectedTimeDuration = 'Select';
  late String _selectedDepartment = 'Select';
  late String _collectedBy = 'Select';
  List<String> timeDuration = ['All', '1 Month', 'Year'];
  List<String> deparment = [
    'All',
    'Gynecology Clinic',
    'FemNutrition Clinicale',
    'Urology Clinic',
    'Surgical Clinic',
    'Breast Clinic',
    'Nephrology and Transplant Clinic',
    'Prediatrics Clinic',
    'Well baby Clinic',
    'Dental Clinic',
    'Physiotrapy Clinic',
  ];
  List<String> collected = [
    'All',
  ];
  var selectedTab = 1;
  Widget selectedWidget = const Tables();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8E4E4),
      appBar: AppBar(
        backgroundColor: primaryColor,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Audit Trail Report List",
          style: GoogleFonts.rubik(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
        ),
      ),
      body: SingleChildScrollView(
          child: SafeArea(
              child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 1.8,
              height: 130,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Text(
                        "Time Duration",
                        textAlign: TextAlign.start,
                        style: GoogleFonts.rubik(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      DropdownButtonHideUnderline(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 200,
                            height: 35,
                            color: Colors.white,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: DropdownButton<String>(
                                  hint: Text(
                                    _selectedTimeDuration,
                                    style: GoogleFonts.rubik(
                                        color: const Color(0xFF908F8F),
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400),
                                  ),

                                  // style: TextStyle(color: Color(0xFFD9D9D9),),

                                  focusColor: const Color(0xFFD9D9D9),
                                  items: timeDuration.map(
                                    (val) {
                                      return DropdownMenuItem<String>(
                                        value: val,
                                        child: Text(val),
                                      );
                                    },
                                  ).toList(),
                                  onChanged: (val) {
                                    setState(
                                      () {
                                        _selectedTimeDuration = val!;
                                      },
                                    );
                                  }),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Column(
                  //   children: [
                  //     Text(
                  //       "Collectted by",
                  //       style: GoogleFonts.rubik(
                  //           color: Colors.black,
                  //           fontSize: 18,
                  //           fontWeight: FontWeight.w700),
                  //     ),
                  //     const SizedBox(
                  //       height: 10,
                  //     ),
                  //     DropdownButtonHideUnderline(
                  //       child: Padding(
                  //         padding: const EdgeInsets.all(8.0),
                  //         child: Container(
                  //           height: 35,
                  //           color: Colors.white,
                  //           child: Padding(
                  //             padding:
                  //                 const EdgeInsets.symmetric(horizontal: 10.0),
                  //             child: DropdownButton<String>(
                  //                 hint: Text(
                  //                   _selectedDepartment,
                  //                   style: GoogleFonts.rubik(
                  //                       color: const Color(0xFF908F8F),
                  //                       fontSize: 18,
                  //                       fontWeight: FontWeight.w400),
                  //                 ),

                  //                 // style: TextStyle(color: Color(0xFFD9D9D9),),

                  //                 focusColor: const Color(0xFFD9D9D9),
                  //                 items: deparment.map(
                  //                   (val) {
                  //                     return DropdownMenuItem<String>(
                  //                       value: val,
                  //                       child: Text(val),
                  //                     );
                  //                   },
                  //                 ).toList(),
                  //                 onChanged: (val) {
                  //                   setState(
                  //                     () {
                  //                       _selectedDepartment = val!;
                  //                     },
                  //                   );
                  //                 }),
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  Column(
                    children: [
                      Text(
                        "Select Department",
                        style: GoogleFonts.rubik(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      DropdownButtonHideUnderline(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 200,
                            height: 35,
                            color: Colors.white,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: DropdownButton<String>(
                                  hint: Text(
                                    _collectedBy,
                                    style: GoogleFonts.rubik(
                                        color: const Color(0xFF908F8F),
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400),
                                  ),

                                  // style: TextStyle(color: Color(0xFFD9D9D9),),

                                  focusColor: const Color(0xFFD9D9D9),
                                  items: collected.map(
                                    (val) {
                                      return DropdownMenuItem<String>(
                                        value: val,
                                        child: Text(val),
                                      );
                                    },
                                  ).toList(),
                                  onChanged: (val) {
                                    setState(
                                      () {
                                        _collectedBy = val!;
                                      },
                                    );
                                  }),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 0,
            ),
            Text(
              "Visualisation",
              style: GoogleFonts.inter(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 20,
            ),
            // Container(
            //   width: MediaQuery.of(context).size.width / 2,
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Container(
            //         color: selectedTab == 1
            //             ? inactiveButtonColor
            //             : const Color(0xFFD9D9D9),
            //         height: 40,
            //         width: MediaQuery.of(context).size.width * 0.11,
            //         child: Center(
            //           child: ListTile(
            //             // selected: selectedIndex == 1,
            //             iconColor: Colors.black,
            //             leading: const FaIcon(FontAwesomeIcons.table),
            //             title: Text("Table",
            //                 textAlign: TextAlign.center,
            //                 style: GoogleFonts.inter(
            //                     color: Colors.black,
            //                     fontSize: 20,
            //                     fontWeight: FontWeight.w700)),
            //             onTap: () {
            //               setState(() {
            //                 selectedTab = 1;
            //                 selectedWidget = const Tables();
            //               });
            //             },
            //           ),
            //         ),
            //       ),
            //       Container(
            //         color: selectedTab == 2
            //             ? inactiveButtonColor
            //             : const Color(0xFFD9D9D9),
            //         height: 40,
            //         width: MediaQuery.of(context).size.width * 0.12,
            //         child: Center(
            //           child: ListTile(
            //             // selected: selectedIndex == 1,
            //             iconColor: Colors.black,
            //             leading: const FaIcon(FontAwesomeIcons.chartColumn),
            //             title: Text("Column",
            //                 textAlign: TextAlign.center,
            //                 style: GoogleFonts.inter(
            //                     color: Colors.black,
            //                     fontSize: 20,
            //                     fontWeight: FontWeight.w700)),
            //             onTap: () {
            //               setState(() {
            //                 selectedTab = 2;
            //                 selectedWidget = const Columns();
            //               });
            //             },
            //           ),
            //         ),
            //       ),
            //       Container(
            //         color: selectedTab == 3
            //             ? inactiveButtonColor
            //             : const Color(0xFFD9D9D9),
            //         height: 40,
            //         width: MediaQuery.of(context).size.width * 0.1,
            //         child: Center(
            //           child: ListTile(
            //             // selected: selectedIndex == 1,
            //             iconColor: Colors.black,
            //             leading: const FaIcon(FontAwesomeIcons.chartLine),
            //             title: Text("Line",
            //                 textAlign: TextAlign.center,
            //                 style: GoogleFonts.inter(
            //                     color: Colors.black,
            //                     fontSize: 20,
            //                     fontWeight: FontWeight.w700)),
            //             onTap: () {
            //               setState(() {
            //                 selectedTab = 3;
            //                 selectedWidget = const Lines();
            //               });
            //             },
            //           ),
            //         ),
            //       ),
            //       Container(
            //         color: selectedTab == 4
            //             ? inactiveButtonColor
            //             : const Color(0xFFD9D9D9),
            //         height: 40,
            //         width: MediaQuery.of(context).size.width * 0.1,
            //         child: Center(
            //           child: ListTile(
            //             // selected: selectedIndex == 1,
            //             iconColor: Colors.black,
            //             leading: const FaIcon(FontAwesomeIcons.chartPie),
            //             title: Text("Pie",
            //                 textAlign: TextAlign.center,
            //                 style: GoogleFonts.inter(
            //                     color: Colors.black,
            //                     fontSize: 20,
            //                     fontWeight: FontWeight.w700)),
            //             onTap: () {
            //               setState(() {
            //                 selectedTab = 4;
            //                 selectedWidget = const Pie();
            //               });
            //             },
            //           ),
            //         ),
            //       ),
              //   ],
              // ),
            // ),
            const SizedBox(
              height: 15,
            ),
            Card(
              elevation: 10,
              child: Container(
                  height: MediaQuery.of(context).size.height / 1.7,
                  color: Colors.white,
                  child: const Tables()),
            )
          ],
        ),
      ))),
    );
  }
}

class Tables extends StatelessWidget {
  const Tables({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: 200,
              height: 40,
              color: primaryColor,
              child: ListTile(
                tileColor: primaryColor,
                title: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text("Build Report",
                      style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w700)),
                ),
                onTap: () {
                  // onIndexChanged(1);
                },
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
                        'Message',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.rubik(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        'Users',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.rubik(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        'IP Address',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.rubik(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        'Action',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.rubik(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        'Platform',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.rubik(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        'Agent',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.rubik(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        'Date and Time',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.rubik(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ),
                    ]),
                TableRow(children: [
                  Text(
                    '',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.rubik(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    '',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.rubik(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    '',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.rubik(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    '',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.rubik(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    '',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.rubik(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    '',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.rubik(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    '',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.rubik(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                ]),
              ]),
        ),
      ],
    );
  }
}

class Columns extends StatelessWidget {
  const Columns({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: 200,
              height: 40,
              color: primaryColor,
              child: ListTile(
                tileColor: primaryColor,
                title: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text("Build Report",
                      style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w700)),
                ),
                onTap: () {
                  // onIndexChanged(1);
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class Lines extends StatelessWidget {
  const Lines({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: 200,
              height: 40,
              color: primaryColor,
              child: ListTile(
                tileColor: primaryColor,
                title: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text("Build Report",
                      style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w700)),
                ),
                onTap: () {
                  // onIndexChanged(1);
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class Pie extends StatelessWidget {
  const Pie({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: 200,
              height: 40,
              color: primaryColor,
              child: ListTile(
                tileColor: primaryColor,
                title: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text("Build Report",
                      style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w700)),
                ),
                onTap: () {
                  // onIndexChanged(1);
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
