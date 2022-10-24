import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:premierhospitaladmin/utils/colors.dart';
import 'package:charts_flutter_new/flutter.dart' as charts;

import '../HomePage/Dashboard/dashboard.dart';

class Report extends StatefulWidget {
  const Report({super.key});

  @override
  State<Report> createState() => _ReportState();
}

class _ReportState extends State<Report> {
  late List<charts.Series<Income, String>> _seriesPieData;
  late List<charts.Series<Appointments, String>> _seriesData;
  late List<charts.Series<Sales, int>> _seriesLineData;

  _generateData() {
    // appointments per week
    // new patients
    var data2 = [
      Appointments(1985, '0', 800), // week 1
      Appointments(1980, '1', 600), // week 2
      Appointments(1985, '2', 900), // week 2
      Appointments(1980, '3', 755),
      Appointments(1985, '4', 255),
      Appointments(1980, '5', 1000),
      Appointments(1980, '6', 300),
      Appointments(1980, '7', 900),
      Appointments(1980, '8', 790),
      Appointments(1980, '9', 300),
    ];
    // returning patients
    var data3 = [
      Appointments(1985, '0', 700),
      Appointments(1980, '1', 300),
      Appointments(1985, '2', 800),
      Appointments(1980, '3', 790),
      Appointments(1985, '4', 800),
      Appointments(1980, '5', 240),
      Appointments(1980, '6', 800),
      Appointments(1980, '7', 600),
      Appointments(1980, '8', 600),
      Appointments(1980, '9', 550),
    ];

    var piedata = [
      Income('Unconfirmed', 35, const Color(0xffFFBE18)),
      Income('Cancel', 5, const Color(0xffFF4E02)),
      Income('Confirmed', 45, const Color(0xFF17A1FA)),
      Income('Conpleted', 75, const Color(0xff0BF7B0)),
    ];

    var linesalesdata = [
      Sales(0, 600),
      Sales(1, 550),
      Sales(2, 1000),
      Sales(3, 780),
      Sales(4, 1000),
      Sales(5, 810),
      Sales(6, 290),
      Sales(7, 160),
      Sales(8, 600),
      Sales(9, 1000)
    ];
    var linesalesdata1 = [
      Sales(0, 1000),
      Sales(1, 600),
      Sales(2, 550),
      Sales(3, 700),
      Sales(4, 1000),
      Sales(5, 800),
      Sales(6, 255),
      Sales(7, 150),
      Sales(8, 700),
      Sales(9, 1000)
    ];

    var linesalesdata2 = [
      Sales(0, 20),
      Sales(1, 24),
      Sales(2, 25),
      Sales(3, 40),
      Sales(4, 45),
      Sales(5, 60),
    ];

    _seriesData.add(
      charts.Series(
        domainFn: (Appointments appointments, _) => appointments.week,
        measureFn: (Appointments appointments, _) => appointments.quantity,
        id: 'New Patient',
        data: data2,
        fillPatternFn: (_, __) => charts.FillPatternType.solid,
        fillColorFn: (Appointments appointments, _) =>
            charts.ColorUtil.fromDartColor(const Color(0xffC3BE3D)),
      ),
    );

    _seriesData.add(
      charts.Series(
        domainFn: (Appointments appointments, _) => appointments.week,
        measureFn: (Appointments appointments, _) => appointments.quantity,
        id: 'Returing  Patient',
        data: data3,
        fillPatternFn: (_, __) => charts.FillPatternType.solid,
        fillColorFn: (Appointments appointments, _) =>
            charts.ColorUtil.fromDartColor(const Color(0xff112255)),
      ),
    );

    _seriesPieData.add(
      charts.Series(
        domainFn: (Income task, _) => task.income,
        measureFn: (Income task, _) => task.incomevalue,
        colorFn: (Income task, _) =>
            charts.ColorUtil.fromDartColor(task.colorval),
        id: 'Monthly income',
        data: piedata,
        labelAccessorFn: (Income row, _) => '${row.incomevalue}',
      ),
    );

    _seriesLineData.add(
      charts.Series(
        colorFn: (__, _) =>
            charts.ColorUtil.fromDartColor(const Color(0xff5154F8)),
        id: 'Air Pollution',
        data: linesalesdata,
        areaColorFn: (_, __) =>
            charts.ColorUtil.fromDartColor(Color.fromARGB(255, 143, 140, 140)),
        domainFn: (Sales sales, _) => sales.yearval,
        measureFn: (Sales sales, _) => sales.salesval,
      ),
    );
    _seriesLineData.add(
      charts.Series(
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(
            const Color.fromARGB(255, 19, 17, 17)),
        areaColorFn: (_, __) =>
            charts.ColorUtil.fromDartColor(Color.fromARGB(255, 59, 61, 197)),
        id: 'Air Pollution',
        data: linesalesdata1,
        domainFn: (Sales sales, _) => sales.yearval,
        measureFn: (Sales sales, _) => sales.salesval,
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _seriesData = <charts.Series<Appointments, String>>[];
    _seriesPieData = <charts.Series<Income, String>>[];
    _seriesLineData = <charts.Series<Sales, int>>[];
    _generateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Color(0xFFE8E4E4),
              height: 150,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          color: primaryColor,
                          height: 45,
                          width: MediaQuery.of(context).size.width / 9,
                          child: Center(
                            child: ListTile(
                              // selected: selectedIndex == 1,
                              iconColor: Colors.white,
                              title: const Text("Financial Report",
                                  style: TextStyle(
                                    color: Colors.white,
                                  )),
                              onTap: () {
                                // onIndexChanged(1);
                              },
                            ),
                          ),
                        ),
                        Container(
                          color: primaryColor,
                          height: 45,
                          width: MediaQuery.of(context).size.width / 6,
                          child: Center(
                            child: ListTile(
                              // selected: selectedIndex == 1,

                              iconColor: Colors.white,
                              leading:
                                  FaIcon(FontAwesomeIcons.moneyBillTransfer),
                              title: const Text("Expense Report",
                                  style: TextStyle(
                                    color: Colors.white,
                                  )),
                              onTap: () {
                                // onIndexChanged(1);
                              },
                            ),
                          ),
                        ),
                        Container(
                          color: primaryColor,
                          height: 45,
                          width: MediaQuery.of(context).size.width / 5,
                          child: Center(
                            child: ListTile(
                              // selected: selectedIndex == 1,
                              iconColor: Colors.white,
                              leading: FaIcon(FontAwesomeIcons.calendarCheck),
                              title: const Text("Appointment Report",
                                  style: TextStyle(
                                    color: Colors.white,
                                  )),
                              onTap: () {
                                // onIndexChanged(1);
                              },
                            ),
                          ),
                        ),
                        Container(
                          color: primaryColor,
                          height: 45,
                          width: MediaQuery.of(context).size.width / 7,
                          child: Center(
                            child: ListTile(
                              // selected: selectedIndex == 1,
                              iconColor: Colors.white,
                              leading: FaIcon(FontAwesomeIcons.calendarCheck),
                              title: const Text("Appointment Report",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                  )),
                              onTap: () {
                                // onIndexChanged(1);
                              },
                            ),
                          ),
                        ),
                        Container(
                          color: primaryColor,
                          height: 50,
                          width: MediaQuery.of(context).size.width / 7,
                          child: Center(
                            child: ListTile(
                              // selected: selectedIndex == 1,
                              iconColor: Colors.white,
                              leading: FaIcon(FontAwesomeIcons.barsProgress),
                              title: const Text("Performance Metric",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                  )),
                              onTap: () {
                                // onIndexChanged(1);
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          color: primaryColor,
                          height: 45,
                          width: MediaQuery.of(context).size.width / 9,
                          child: Center(
                            child: ListTile(
                              // selected: selectedIndex == 1,
                              iconColor: Colors.white,
                              leading: FaIcon(FontAwesomeIcons.userLarge),
                              title: const Text("Patients",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                  )),
                              onTap: () {
                                // onIndexChanged(1);
                              },
                            ),
                          ),
                        ),
                        Container(
                          color: primaryColor,
                          height: 45,
                          width: MediaQuery.of(context).size.width / 7,
                          child: Center(
                            child: ListTile(
                              // selected: selectedIndex == 1,
                              iconColor: Colors.white,
                              leading: FaIcon(FontAwesomeIcons.columns),
                              title: const Text("Usage Report ",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                  )),
                              onTap: () {
                                // onIndexChanged(1);
                              },
                            ),
                          ),
                        ),
                        Container(
                          color: primaryColor,
                          height: 45,
                          width: MediaQuery.of(context).size.width / 6,
                          child: Center(
                            child: ListTile(
                              // selected: selectedIndex == 1,
                              iconColor: Colors.white,
                              leading: FaIcon(FontAwesomeIcons.columns),
                              title: const Text("Audit Trail Report",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                  )),
                              onTap: () {
                                // onIndexChanged(1);
                              },
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              color: primaryColor,
              height: 45,
              width: MediaQuery.of(context).size.width / 5,
              child: Center(
                child: ListTile(
                  // selected: selectedIndex == 1,
                  iconColor: Colors.white,
                  leading: FaIcon(FontAwesomeIcons.calendarCheck),
                  title: const Text("Appointment Summary",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                      )),
                  onTap: () {
                    // onIndexChanged(1);
                  },
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Card(
                      elevation: 8,
                      color: const Color(0xFFE8E4E4),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2.2,
                        height: 260,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Appointment Schedule',
                                  style: GoogleFonts.rubik(
                                      color: Colors.black,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w700),
                                  textAlign: TextAlign.start,
                                ),
                              ),
                              Expanded(
                                child: charts.BarChart(
                                  _seriesData,
                                  animate: true,
                                  barGroupingType:
                                      charts.BarGroupingType.grouped,
                                  behaviors: [
                                    charts.SeriesLegend(
                                      position: charts.BehaviorPosition.bottom,
                                      // outsideJustification:
                                      //     charts.OutsideJustification.endDrawArea,
                                      entryTextStyle: charts.TextStyleSpec(
                                          color: charts.MaterialPalette.blue
                                              .shadeDefault,
                                          fontFamily: 'Georgia',
                                          fontSize: 11),
                                    )
                                  ],
                                  animationDuration: const Duration(seconds: 5),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Card(
                      elevation: 10,
                      color: const Color(0xFFE8E4E4),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2.2,
                        height: 380,
                        child: Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Booking Statistics',
                                  style: GoogleFonts.rubik(
                                      color: Colors.black,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w700),
                                  textAlign: TextAlign.start,
                                ),
                              ),
                              Container(
                                color: Colors.white,
                                padding: EdgeInsets.all(20.0),
                                child: Expanded(
                                  child: Table(
                                      border: TableBorder
                                          .all(), // Allows to add a border decoration around your table
                                      children: const [
                                        TableRow(children: [
                                          Text('User/Status'),
                                          Text('First Time'),
                                          Text('Follow-up'),
                                          Center(child: Text('Total')),
                                        ]),
                                        TableRow(children: [
                                          Text(
                                            'Admin Name',
                                          ),
                                          Text('3'),
                                          Text('3'),
                                          Text('6'),
                                        ]),
                                        TableRow(children: [
                                          Text('Unconfirmed'),
                                          Text('4'),
                                          Text('3'),
                                          Text('7'),
                                        ]),
                                        TableRow(children: [
                                          Text('Confirmed'),
                                          Text('4'),
                                          Text('6'),
                                          Text('10'),
                                        ]),
                                        TableRow(children: [
                                          Text('Completed'),
                                          Text('3'),
                                          Text('7'),
                                          Text('10'),
                                        ]),
                                        TableRow(children: [
                                          Text('Cancelled'),
                                          Text('3'),
                                          Text('0'),
                                          Text('3'),
                                        ]),
                                      ]),
                                ),
                              ),
                              SizedBox(height: 15,),
                              Container(
                                color: Colors.white,
                                padding: EdgeInsets.all(20.0),
                                child: Expanded(
                                  child: Table(
                                      border: TableBorder
                                          .all(), // Allows to add a border decoration around your table
                                      children: const [
                                        TableRow(children: [
                                          Text('User/Status'),
                                          Text('First Time'),
                                          Text('Follow-up'),
                                          Center(child: Text('Total')),
                                        ]),
                                        TableRow(children: [
                                          Text(
                                            'Admin Name',
                                          ),
                                          Text('3'),
                                          Text('3'),
                                          Text('6'),
                                        ]),
                                        TableRow(children: [
                                          Text('Unconfirmed'),
                                          Text('4'),
                                          Text('3'),
                                          Text('7'),
                                        ]),
                                        TableRow(children: [
                                          Text('Confirmed'),
                                          Text('4'),
                                          Text('6'),
                                          Text('10'),
                                        ]),
                                        TableRow(children: [
                                          Text('Completed'),
                                          Text('3'),
                                          Text('7'),
                                          Text('10'),
                                        ]),
                                        TableRow(children: [
                                          Text('Cancelled'),
                                          Text('3'),
                                          Text('0'),
                                          Text('3'),
                                        ]),
                                      ]),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                // SizedBox(width: 50,),
                Container(
                  // constraints: BoxConstraints(maxWidth: 500),
                  child: Card(
                    elevation: 10,
                    color: const Color(0xFFE8E4E4),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 4,
                        height: 500,
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Appointment Schedule',
                                style: GoogleFonts.rubik(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600),
                                textAlign: TextAlign.start,
                              ),
                            ),
                            const SizedBox(
                              height: 5.0,
                            ),
                            Expanded(
                              child: charts.PieChart<String>(_seriesPieData,
                                  animate: true,
                                  animationDuration: const Duration(seconds: 5),
                                  behaviors: [
                                    charts.DatumLegend(
                                      outsideJustification: charts
                                          .OutsideJustification.middleDrawArea,
                                      position: charts.BehaviorPosition.bottom,
                                      horizontalFirst: true,
                                      desiredMaxColumns: 1,
                                      cellPadding: const EdgeInsets.only(
                                          left: 6, right: 4.0, bottom: 4.0),
                                      entryTextStyle: charts.TextStyleSpec(
                                          color: charts.ColorUtil.fromDartColor(
                                              Color.fromARGB(255, 0, 0, 0)),
                                          fontFamily: 'Rubik',
                                          fontSize: 18),
                                    )
                                  ],
                                  defaultRenderer: charts.ArcRendererConfig(
                                      arcWidth: 1000,
                                      arcRendererDecorators: [])),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
