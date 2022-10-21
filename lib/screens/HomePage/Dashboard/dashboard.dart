import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:premierhospitaladmin/utils/colors.dart';
import 'package:charts_flutter_new/flutter.dart' as charts;

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  late List<charts.Series<Appointments, String>> _seriesData;
  late List<charts.Series<Income, String>> _seriesPieData;
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
      Income('OPD Patient', 35.8, const Color(0xFFC3BE3D)),
      Income('IN Patient', 8.3, const Color(0xff5CD1C3)),
      Income('Pathology', 10.8, const Color(0xff5A4F9B)),
      Income('Pharmacy', 15.6, const Color(0xff2C1F77)),
      Income('Radiology', 8.2, const Color(0xffB74CB9)),
      Income('Blood Bank', 10.3, const Color(0xffdc3912)),
      Income('Amblance', 10.3, const Color(0xff6B88D3)),
      Income('Others', 5, const Color(0xff35BF19)),
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

    // _seriesData.add(
    //   charts.Series(
    //     domainFn: (Pollution pollution, _) => pollution.place,
    //     measureFn: (Pollution pollution, _) => pollution.quantity,
    //     id: '2017',
    //     data: data1,
    //     fillPatternFn: (_, __) => charts.FillPatternType.solid,
    //     fillColorFn: (Pollution pollution, _) =>
    //         charts.ColorUtil.fromDartColor(Color(0xff990099)),
    //   ),
    // );

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
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Card(
                    elevation: 5,
                    color: const Color(0xFFE8E4E4),
                    child: Container(
                      height: 80,
                      width: 250,
                      child: Row(children: [
                        Expanded(
                          flex: 6,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              children: [
                                Text("GENERAL INCOME ",
                                    style: GoogleFonts.rubik(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700)),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 5.0),
                                    child: Text(
                                      "K 1,656,000",
                                      style: GoogleFonts.rubik(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            color: Colors.green,
                          ),
                        )
                      ]),
                    ),
                  ),
                  Card(
                    elevation: 5,
                    color: const Color(0xFFE8E4E4),
                    child: Container(
                      height: 80,
                      width: 250,
                      child: Row(children: [
                        Expanded(
                          flex: 6,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text("OPD PATIENT INCOME",
                                    style: GoogleFonts.rubik(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700)),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 5.0),
                                    child: Text(
                                      "K 1,456,000",
                                      style: GoogleFonts.rubik(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            color: const Color(0xFFC3BE3D),
                          ),
                        )
                      ]),
                    ),
                  ),
                  Card(
                    elevation: 5,
                    color: const Color(0xFFE8E4E4),
                    child: Container(
                      height: 80,
                      width: 250,
                      child: Row(children: [
                        Expanded(
                          flex: 6,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              children: [
                                Text("IN PATIENT INCOME ",
                                    style: GoogleFonts.rubik(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700)),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 5.0),
                                    child: Text(
                                      "K 2,154,000",
                                      style: GoogleFonts.rubik(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            color: const Color(0xFF5CD1C3),
                          ),
                        )
                      ]),
                    ),
                  ),
                  Card(
                    elevation: 5,
                    color: const Color(0xFFE8E4E4),
                    child: Container(
                      height: 80,
                      width: 250,
                      child: Row(children: [
                        Expanded(
                          flex: 6,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              children: [
                                Text("GENERAL EXPENSE",
                                    style: GoogleFonts.rubik(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700)),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 5.0),
                                    child: Text(
                                      "K 1,134,000",
                                      style: GoogleFonts.rubik(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            color: const Color(0xFFAC1818),
                          ),
                        )
                      ]),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Card(
                  elevation: 8,
                  color: const Color(0xFFE8E4E4),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 260,
                    child: Column(
                      children: [
                        // const Text(
                        //   'Sales for the first 5 years',
                        //   style: TextStyle(
                        //       fontSize: 24.0, fontWeight: FontWeight.bold),
                        // ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              constraints: BoxConstraints(
                                  maxWidth:
                                      MediaQuery.of(context).size.width / 2.6,
                                  maxHeight: 230),
                              child: charts.LineChart(_seriesLineData,
                                  defaultRenderer: charts.LineRendererConfig(
                                      includePoints: true,
                                      includeLine: true,
                                      includeArea: false,
                                      stacked: false),
                                  animate: true,
                                  animationDuration: const Duration(seconds: 5),
                                  behaviors: [
                                    charts.ChartTitle('Years',
                                        behaviorPosition:
                                            charts.BehaviorPosition.bottom,
                                        titleOutsideJustification: charts
                                            .OutsideJustification
                                            .middleDrawArea),
                                    charts.ChartTitle('Sales',
                                        behaviorPosition:
                                            charts.BehaviorPosition.start,
                                        titleOutsideJustification: charts
                                            .OutsideJustification
                                            .middleDrawArea),
                                  ]),
                            ),
                            Container(
                              constraints: BoxConstraints(
                                  maxWidth:
                                      MediaQuery.of(context).size.width / 2.6,
                                  maxHeight: 230),
                              child: charts.LineChart(_seriesLineData,
                                  defaultRenderer: charts.LineRendererConfig(
                                      includePoints: true,
                                      includeArea: true,
                                      stacked: false),
                                  animate: true,
                                  animationDuration: const Duration(seconds: 5),
                                  behaviors: [
                                    charts.ChartTitle('Years',
                                        behaviorPosition:
                                            charts.BehaviorPosition.bottom,
                                        titleOutsideJustification: charts
                                            .OutsideJustification
                                            .middleDrawArea),
                                    charts.ChartTitle('Sales',
                                        behaviorPosition:
                                            charts.BehaviorPosition.start,
                                        titleOutsideJustification: charts
                                            .OutsideJustification
                                            .middleDrawArea),
                                  ]),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Card(
                      elevation: 8,
                      color: const Color(0xFFE8E4E4),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2.65,
                        height: 260,
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
                                barGroupingType: charts.BarGroupingType.grouped,
                                behaviors: [
                                  charts.SeriesLegend(
                                    position: charts.BehaviorPosition.bottom,
                                    // outsideJustification:
                                    //     charts.OutsideJustification.endDrawArea,
                                    entryTextStyle: charts.TextStyleSpec(
                                        color: charts
                                            .MaterialPalette.blue.shadeDefault,
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
                    const SizedBox(
                      width: 15,
                    ),
                    Card(
                      elevation: 8,
                      color: const Color(0xFFE8E4E4),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2.65,
                        height: 260,
                        child: Column(
                          children: [
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Monthly Income',
                                style: TextStyle(
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.bold),
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
                                          .OutsideJustification.endDrawArea,
                                      position: charts.BehaviorPosition.start,
                                      horizontalFirst: true,
                                      desiredMaxColumns: 1,
                                      cellPadding: const EdgeInsets.only(
                                          left: 6, right: 4.0, bottom: 4.0),
                                      entryTextStyle: charts.TextStyleSpec(
                                          color: charts.MaterialPalette.purple
                                              .shadeDefault,
                                          fontFamily: 'Georgia',
                                          fontSize: 11),
                                    )
                                  ],
                                  defaultRenderer: charts.ArcRendererConfig(
                                      arcWidth: 50,
                                      arcRendererDecorators: [
                                        charts.ArcLabelDecorator(
                                            labelPosition:
                                                charts.ArcLabelPosition.inside)
                                      ])),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}

class Appointments {
  String week;
  int year;
  int quantity;

  Appointments(this.year, this.week, this.quantity);
}

class Income {
  String income;
  double incomevalue;
  Color colorval;

  Income(this.income, this.incomevalue, this.colorval);
}

class Sales {
  int yearval;
  int salesval;

  Sales(this.yearval, this.salesval);
}
