import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:charts_flutter_new/flutter.dart' as charts;

import '../../utils/colors.dart';

class FinancialReport extends StatefulWidget {
  static const routeName = "/FinancialReport";
  const FinancialReport({super.key});

  @override
  State<FinancialReport> createState() => _FinancialReportState();
}

class _FinancialReportState extends State<FinancialReport> {
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
          "Financial Summary",
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
            Container(
              width: MediaQuery.of(context).size.width / 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    color: selectedTab == 1
                        ? inactiveButtonColor
                        : const Color(0xFFD9D9D9),
                    height: 40,
                    width: MediaQuery.of(context).size.width * 0.11,
                    child: Center(
                      child: ListTile(
                        // selected: selectedIndex == 1,
                        iconColor: Colors.black,
                        leading: const FaIcon(FontAwesomeIcons.table),
                        title: Text("Table",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inter(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w700)),
                        onTap: () {
                          setState(() {
                            selectedTab = 1;
                            selectedWidget = const Tables();
                          });
                        },
                      ),
                    ),
                  ),
                  Container(
                    color: selectedTab == 2
                        ? inactiveButtonColor
                        : const Color(0xFFD9D9D9),
                    height: 40,
                    width: MediaQuery.of(context).size.width * 0.12,
                    child: Center(
                      child: ListTile(
                        // selected: selectedIndex == 1,
                        iconColor: Colors.black,
                        leading: const FaIcon(FontAwesomeIcons.chartColumn),
                        title: Text("Column",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inter(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w700)),
                        onTap: () {
                          setState(() {
                            selectedTab = 2;
                            selectedWidget = const Columns();
                          });
                        },
                      ),
                    ),
                  ),
                  Container(
                    color: selectedTab == 3
                        ? inactiveButtonColor
                        : const Color(0xFFD9D9D9),
                    height: 40,
                    width: MediaQuery.of(context).size.width * 0.1,
                    child: Center(
                      child: ListTile(
                        // selected: selectedIndex == 1,
                        iconColor: Colors.black,
                        leading: const FaIcon(FontAwesomeIcons.chartLine),
                        title: Text("Line",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inter(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w700)),
                        onTap: () {
                          setState(() {
                            selectedTab = 3;
                            selectedWidget = const Lines();
                          });
                        },
                      ),
                    ),
                  ),
                  Container(
                    color: selectedTab == 4
                        ? inactiveButtonColor
                        : const Color(0xFFD9D9D9),
                    height: 40,
                    width: MediaQuery.of(context).size.width * 0.1,
                    child: Center(
                      child: ListTile(
                        // selected: selectedIndex == 1,
                        iconColor: Colors.black,
                        leading: const FaIcon(FontAwesomeIcons.chartPie),
                        title: Text("Pie",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inter(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w700)),
                        onTap: () {
                          setState(() {
                            selectedTab = 4;
                            selectedWidget = const Pie();
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Card(
              elevation: 10,
              child: Container(
                  height: MediaQuery.of(context).size.height / 1.3,
                  color: Colors.white,
                  child: selectedWidget),
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
                        'TransactionID',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.rubik(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        'Date',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.rubik(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        'Patients Name',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.rubik(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        'Reference No',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.rubik(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        'Category',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.rubik(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        'Collected by',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.rubik(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        'Payment Type',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.rubik(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        'Payment Mode',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.rubik(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        'Amount',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.rubik(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ),
                    ]),
                TableRow(children: [
                  Text(
                    'Trf1328348',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.rubik(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    '10/08/2021',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.rubik(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    'Authur Voss',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.rubik(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    'Ph0018bd',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.rubik(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    'FemNutrition',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.rubik(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    'accountant',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.rubik(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    'Transfer',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.rubik(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    'Bank',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.rubik(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    '1000',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.rubik(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                ]),
                TableRow(children: [
                  Text(
                    'Trf1328348',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.rubik(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    '10/08/2021',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.rubik(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    'Authur Voss',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.rubik(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    'Ph0018bd',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.rubik(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    'FemNutrition',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.rubik(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    'accountant',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.rubik(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    'Transfer',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.rubik(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    'Bank',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.rubik(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    '1000',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.rubik(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                ]),
                TableRow(children: [
                  Text(
                    'Trf1328348',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.rubik(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    '10/08/2021',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.rubik(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    'Authur Voss',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.rubik(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    'Ph0018bd',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.rubik(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    'FemNutrition',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.rubik(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    'accountant',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.rubik(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    'Transfer',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.rubik(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    'Bank',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.rubik(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    '1000',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.rubik(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                ]),
                TableRow(children: [
                  Text(
                    'Trfru29898348',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.rubik(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    '14/08/2021',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.rubik(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    'James kane',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.rubik(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    'Ph0018bd',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.rubik(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    'FemNutrition',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.rubik(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    'accountant',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.rubik(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    'Transfer',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.rubik(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    'Bank',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.rubik(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    '500',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.rubik(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                ]),
                TableRow(children: [
                  Text(
                    'Trf1322u3i8',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.rubik(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    '11/08/2021',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.rubik(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    'Smith john',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.rubik(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    'Ph0113bed',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.rubik(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    'FemNutrition',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.rubik(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    'accountant',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.rubik(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    'Cash',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.rubik(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    'Cash',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.rubik(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    '5000',
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

class Columns extends StatefulWidget {
  const Columns({super.key});

  @override
  State<Columns> createState() => _ColumnsState();
}

class _ColumnsState extends State<Columns> {
  late List<charts.Series<Financial, String>> _seriesBarData;
  late List<Financial> mydata;
  _generateData(mydata) {
    _seriesBarData = <charts.Series<Financial, String>>[];
    _seriesBarData.add(
      charts.Series(
        domainFn: (Financial sales, _) => sales.saleYear.toString(),
        measureFn: (Financial sales, _) => int.parse(sales.saleVal),
        colorFn: (Financial sales, _) =>
            charts.ColorUtil.fromDartColor(Color(int.parse(sales.colorVal))),
        id: 'Finacial Report',
        data: mydata,
        labelAccessorFn: (Financial row, _) => row.saleYear,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream:
          FirebaseFirestore.instance.collection('financialchart').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const LinearProgressIndicator();
        } else {
          List<Financial> sales = snapshot.data!.docs
              .map((doc) =>
                  Financial.fromMap(doc.data() as Map<String, dynamic>))
              .toList();
          return _buildChart(context, sales);
        }
      },
    );
  }

  Widget _buildChart(BuildContext context, List<Financial> saledata) {
    mydata = saledata;
    _generateData(mydata);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              const Text(
                'Sales by Year',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Expanded(
                child: charts.BarChart(
                  _seriesBarData,
                  
                  animate: true,
                  animationDuration: const Duration(seconds: 5),
                  behaviors: [
                    charts.DatumLegend(
                      // desiredMaxRows: ,
                     desiredMaxColumns: 5,
                      entryTextStyle: charts.TextStyleSpec(
                          color: charts.MaterialPalette.purple.shadeDefault,
                          fontFamily: 'Georgia',
                          fontSize: 12),
                    )
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

class Financial {
  final String saleVal;
  final String saleYear;
  final String colorVal;
  Financial(this.saleVal, this.saleYear, this.colorVal);

  Financial.fromMap(Map<String, dynamic> map)
      : assert(map['saleVal'] != null),
        assert(map['department'] != null),
        assert(map['colorVal'] != null),
        saleVal = map['saleVal'],
        colorVal = map['colorVal'],
        saleYear = map['department'];

  @override
  String toString() => "Record<$saleVal:$saleYear:$colorVal>";
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

class Pie extends StatefulWidget {
  const Pie({super.key});

  @override
  State<Pie> createState() => _PieState();
}

class _PieState extends State<Pie> {
   late List<charts.Series<Financial, String>> _seriesPieData;
  late List<Financial> mydata;
  _generateData(mydata) {
    _seriesPieData = <charts.Series<Financial, String>>[];
    _seriesPieData.add(
      charts.Series(
        domainFn: (Financial task, _) => task.saleYear,
        measureFn: (Financial task, _) => (int.parse(task.saleVal)),
        colorFn: (Financial task, _) =>
            charts.ColorUtil.fromDartColor(Color(int.parse(task.colorVal))),
        id: 'tasks',
        data: mydata,
        labelAccessorFn: (Financial row, _) => row.saleVal,
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  _buildBody(context),
      // children: [
      //   Padding(
      //     padding: const EdgeInsets.all(8.0),
      //     child: Align(
      //       alignment: Alignment.centerLeft,
      //       child: Container(
      //         width: 200,
      //         height: 40,
      //         color: primaryColor,
      //         child: ListTile(
      //           tileColor: primaryColor,
      //           title: Padding(
      //             padding: const EdgeInsets.all(5.0),
      //             child: Text("Build Report",
      //                 style: GoogleFonts.inter(
      //                     color: Colors.white,
      //                     fontSize: 20,
      //                     fontWeight: FontWeight.w700)),
      //           ),
      //           onTap: () {
      //             // onIndexChanged(1);
      //           },
      //         ),
      //       ),
      //     ),
      //   ),
      // ],
    );
  }
  Widget _buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream:
          FirebaseFirestore.instance.collection('financialchart').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const LinearProgressIndicator();
        } else {
          List<Financial> sales = snapshot.data!.docs
              .map((doc) =>
                  Financial.fromMap(doc.data() as Map<String, dynamic>))
              .toList();
          return _buildChart(context, sales);
        }
      },
    );
  }
  Widget _buildChart(BuildContext context, List<Financial> taskdata) {
    mydata = taskdata;
    _generateData(mydata);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              // Text(
              //   'Time spent on daily tasks',
              //   style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              // ),
              const SizedBox(
                height: 10.0,
              ),
              Expanded(
                child:  charts.PieChart<String>(_seriesPieData,
                    animate: true,
                    animationDuration: const Duration(seconds: 5),
                    behaviors: [
                       charts.DatumLegend(
                        outsideJustification:
                            charts.OutsideJustification.endDrawArea,
                        horizontalFirst: false,
                        desiredMaxRows: 2,
                        cellPadding:
                             const EdgeInsets.only(right: 4.0, bottom: 4.0,top:4.0),
                        entryTextStyle: charts.TextStyleSpec(
                            color: charts.MaterialPalette.purple.shadeDefault,
                            fontFamily: 'Georgia',
                            fontSize: 18),
                      )
                    ],
                    defaultRenderer:  charts.ArcRendererConfig(
                        arcWidth: 100,
                        arcRendererDecorators: [
                           charts.ArcLabelDecorator(
                              labelPosition: charts.ArcLabelPosition.inside)
                        ])),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
