import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:premierhospitaladmin/utils/colors.dart';

import '../HomePage/Dashboard/dashboard.dart';
import 'package:charts_flutter_new/flutter.dart' as charts;

class PerformanceMetric extends StatefulWidget {
  static const routeName = "/performanceMetric";
  const PerformanceMetric({super.key});

  @override
  State<PerformanceMetric> createState() => _PerformanceMetricState();
}

class _PerformanceMetricState extends State<PerformanceMetric> {
  late List<charts.Series<Income, String>> _seriesPieData;
  late dynamic _selectedTimeDuration = 'Select';
  late String _selectedDepartment = 'Select';
  late String _doctor = 'Select';
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
  List<String> doctor = [
    'All',
  ];
  _generateData() {
    var piedata = [
      Income('Gynecology Clinic', 23.8, const Color(0xff0BF7B0)),
      Income('Nutrition Clinic', 4.2, Color(0xFFDF6C0E)),
      Income('Chest Clinic', 3.0, Color(0xFFDFDB09)),
      Income('Urology Clinic', 2.4, Color(0xFF66C0FC)),
      Income('Surgical Clinic', 10.7, Color(0xFF2277E6)),
      Income('Breast Clinic', 2.4, Color(0xFF305970)),
      Income('Nephrology and Transplant Clinic', 1.2, Color(0xFF21965F)),
      Income('ENT Clinic', 2.3, Color(0xFF054C75)),
      Income('Prediatrics Clinic', 7.1, Color(0xFF0C4B38)),
      Income('Well baby Clinic', 10.7, Color(0xFF9F64A7)),
      Income('Dental Clinic', 17.9, Color(0xFFF0E477)),
      Income('Physiotrapy Clinic', 14.3, Color.fromRGBO(91, 181, 255, 1)),
    ];

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
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _seriesPieData = <charts.Series<Income, String>>[];
    _generateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
          "Performance Metric",
          style: GoogleFonts.rubik(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
        ),
      ),
      body: SingleChildScrollView(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width / 2.5,
                color: Colors.white,
                child: Column(
                  children: [
                    Card(
                      elevation: 5,
                      color: Color(0xFFE8E4E4),
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Text(
                                  "Time Duration",
                                  style: GoogleFonts.rubik(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                DropdownButtonHideUnderline(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      color: Colors.white,
                                      child: DropdownButton<String>(
                                          hint: Text(
                                            _selectedTimeDuration,
                                            style: GoogleFonts.rubik(
                                                color: Color(0xFF908F8F),
                                                fontSize: 18,
                                                fontWeight: FontWeight.w400),
                                          ),

                                          // style: TextStyle(color: Color(0xFFD9D9D9),),

                                          focusColor: Color(0xFFD9D9D9),
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
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  "Department",
                                  style: GoogleFonts.rubik(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                DropdownButtonHideUnderline(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      color: Colors.white,
                                      child: DropdownButton<String>(
                                          hint: Text(
                                            _selectedDepartment,
                                            style: GoogleFonts.rubik(
                                                color: Color(0xFF908F8F),
                                                fontSize: 18,
                                                fontWeight: FontWeight.w400),
                                          ),

                                          // style: TextStyle(color: Color(0xFFD9D9D9),),

                                          focusColor: Color(0xFFD9D9D9),
                                          items: deparment.map(
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
                                                _selectedDepartment = val!;
                                              },
                                            );
                                          }),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  "Doctor",
                                  style: GoogleFonts.rubik(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                DropdownButtonHideUnderline(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      color: Colors.white,
                                      child: DropdownButton<String>(
                                          hint: Text(
                                            _doctor,
                                            style: GoogleFonts.rubik(
                                                color: Color(0xFF908F8F),
                                                fontSize: 18,
                                                fontWeight: FontWeight.w400),
                                          ),

                                          // style: TextStyle(color: Color(0xFFD9D9D9),),

                                          focusColor: Color(0xFFD9D9D9),
                                          items: doctor.map(
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
                                                _doctor = val!;
                                              },
                                            );
                                          }),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          width: 200,
                          color: primaryColor,
                          child: ListTile(
                            tileColor: primaryColor,
                            title: const Text("Build Report",
                                style: TextStyle(
                                  color: Colors.white,
                                )),
                            onTap: () {
                              // onIndexChanged(1);
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 5),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Result",
                          textAlign: TextAlign.left,
                          style: GoogleFonts.rubik(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                    Card(
                      color: Color(0xFFE8E4E4),
                      child: Container(
                        height: 400,
                        child: Table(
                            border: TableBorder
                                .all(), // Allows to add a border decoration around your table
                            children: [
                              TableRow(
                                  decoration: BoxDecoration(
                                    color: Color(0xFFB3B3B3),
                                  ),
                                  children: [
                                    Text(
                                      'Name',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.rubik(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Text(
                                      'Department',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.rubik(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Center(
                                        child: Text(
                                      'Completed appointments',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.rubik(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700),
                                    )),
                                  ]),
                            ]),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Card(
                color: Color(0xFFE8E4E4),
                elevation: 8,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2,
                    height: 650,
                    child: Column(
                      children: [
                        Text(
                          "Departmental Performance Metric ",
                          style: GoogleFonts.rubik(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Expanded(
                          child: Container(
                            color: Color(0xFFE8E4E4),
                            child: charts.PieChart<String>(_seriesPieData,
                                animate: true,
                                animationDuration: const Duration(seconds: 5),
                                behaviors: [
                                  charts.DatumLegend(
                                    outsideJustification: charts
                                        .OutsideJustification.middleDrawArea,
                                    position: charts.BehaviorPosition.bottom,
                                    horizontalFirst: true,
                                    desiredMaxColumns: 3,
                                    cellPadding: const EdgeInsets.only(
                                        left: 6, right: 4.0, bottom: 6.0),
                                    entryTextStyle: charts.TextStyleSpec(
                                        color: charts.ColorUtil.fromDartColor(
                                            Color.fromARGB(255, 0, 0, 0)),
                                        fontFamily: 'Rubik',
                                        fontSize: 18),
                                  )
                                ],
                                defaultRenderer: charts.ArcRendererConfig(
                                    arcWidth: 1000,
                                    arcRendererDecorators: [
                                      charts.ArcLabelDecorator(
                                          labelPosition:
                                              charts.ArcLabelPosition.outside)
                                    ])),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
