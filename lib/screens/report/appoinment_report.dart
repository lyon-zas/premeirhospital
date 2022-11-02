import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_datagrid_export/export.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart'
    hide Alignment, Column, Row;

import '../../utils/save_file_mobile_desktop.dart'
    if (dart.library.html) '../../utils/save_file_web.dart' as helper;
import '../../utils/colors.dart';
import '../HomePage/Dashboard/dashboard.dart';
import 'package:charts_flutter_new/flutter.dart' as charts;
import '../patient/patient.dart';

class AppoinmentReport extends StatefulWidget {
  static const routeName = "/AppoinmentReport";
  const AppoinmentReport({super.key});

  @override
  State<AppoinmentReport> createState() => _AppoinmentReportState();
}

class _AppoinmentReportState extends State<AppoinmentReport> {
  final GlobalKey<SfDataGridState> _key = GlobalKey<SfDataGridState>();
  late dynamic _selectedTimeDuration = 'Select';
  late String _selectedpatientStatus = 'Select';
  late String _collectedBy = 'Select';
  List<String> timeDuration = ['All', 'Month', 'Year'];
  List<String> patientStatus = [
    'All',
    'New Users',
    'Old Users',
  ];
  List<String> appoinmentStatus = [
    'Completed',
    'Confirmed',
    'Unconfirmed',
    'Cancelled'
  ];
  Future<void> exportDataGridToPdf() async {
    final PdfDocument document = _key.currentState!.exportToPdfDocument(
        fitAllColumnsInOnePage: true,
        cellExport: (details) {
          if (details.cellType == DataGridExportCellType.columnHeader &&
              details.pdfCell.value == 'Appoinment Status') {
            details.pdfCell.value = 'First Time';
          }
        });

    final List<int> bytes = document.saveSync();
    await helper.saveAndLaunchFile(bytes, 'DataGrid.pdf');
    document.dispose();
  }

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
          "Appoinment Report",
          style: GoogleFonts.rubik(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
        ),
        actions: [
          InkWell(
            onTap: () {
              exportDataGridToPdf();
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
              child: Container(
                width: 60,
                color: Colors.white,
                child: Center(
                  child: Text("Save",
                      style: GoogleFonts.inter(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w700)),
                ),
              ),
            ),
          ),
        ],
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
                  Column(
                    children: [
                      Text(
                        "Patient Status",
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
                            height: 35,
                            color: Colors.white,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: DropdownButton<String>(
                                  hint: Text(
                                    _selectedpatientStatus,
                                    style: GoogleFonts.rubik(
                                        color: const Color(0xFF908F8F),
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400),
                                  ),

                                  // style: TextStyle(color: Color(0xFFD9D9D9),),

                                  focusColor: const Color(0xFFD9D9D9),
                                  items: patientStatus.map(
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
                                        _selectedpatientStatus = val!;
                                      },
                                    );
                                  }),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "Appoinment Status",
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
                                  items: appoinmentStatus.map(
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
                  height: MediaQuery.of(context).size.height / 1.1,
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
    late UserDataSource userDataSource;
    late List<CurrentUserInfo> UserData = [];

    FirebaseFirestore db = FirebaseFirestore.instance;

    final Stream<QuerySnapshot> _usersStream =
        FirebaseFirestore.instance.collection('Appointments').snapshots();

    Widget _buildDataGrid1() {
      late List<CurrentUserInfo> UserData = [];
      return StreamBuilder<QuerySnapshot>(
        stream: _usersStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) return LinearProgressIndicator();
          UserData.clear();
          snapshot.data!.docs.forEach((doc) {
            UserData.add(
                CurrentUserInfo.fromJson(doc.data() as Map<String, dynamic>));
          });

          userDataSource = UserDataSource(UserData);
          return SfDataGrid(
            columnWidthMode: ColumnWidthMode.fill,
            source: userDataSource,
            gridLinesVisibility: GridLinesVisibility.both,
            headerGridLinesVisibility: GridLinesVisibility.both,
            allowColumnsResizing: true,
            allowSorting: true,
            allowFiltering: true,
            columns: getColumns,
            tableSummaryRows: [
              GridTableSummaryRow(
                  showSummaryInRow: false,
                  title: 'Total First Time:',
                  titleColumnSpan: 1,
                  columns: [
                    const GridSummaryColumn(
                        name: 'Sum',
                        columnName: 'First Time',
                        summaryType: GridSummaryType.count),
                  ],
                  position: GridTableSummaryRowPosition.bottom),
            ],
          );
        },
      );
    }

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
            child: _buildDataGrid1()),
      ],
    );
  }
}

class CurrentUserInfo {
  factory CurrentUserInfo.fromJson(Map<String, dynamic> json) {
    return CurrentUserInfo(
      status: json['status'],
      FirstTime: json['First time'],
      FollowUp: json["Follow up"],
    );
  }

  CurrentUserInfo({
    required this.status,
    required this.FirstTime,
    required this.FollowUp,
  });

  final String status;
  final String FirstTime;
  final String FollowUp;
}

class UserDataSource extends DataGridSource {
  UserDataSource(this._currentUserInfo) {
    _buildDataRow();
  }

  List<DataGridRow> users = [];
  List<CurrentUserInfo> _currentUserInfo;

  void _buildDataRow() {
    users = _currentUserInfo
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<String>(
                  columnName: 'Appoinment Status', value: e.status),
              DataGridCell<String>(
                  columnName: 'First Time', value: e.FirstTime),
              DataGridCell<String>(columnName: 'Follow-up', value: e.FollowUp),
              // DataGridCell<String>(columnName: 'Total', value: ""),
            ]))
        .toList();
  }

  @override
  Widget? buildTableSummaryCellWidget(
      GridTableSummaryRow summaryRow,
      GridSummaryColumn? summaryColumn,
      RowColumnIndex rowColumnIndex,
      String summaryValue) {
    return Container(
        padding: const EdgeInsets.all(15.0), child: Text(summaryValue));
  }

  @override
  List<DataGridRow> get rows => users;

  @override
  DataGridRowAdapter buildRow(
    DataGridRow row,
  ) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((e) {
      return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(8.0),
        child: Text(e.value.toString()),
      );
    }).toList());
  }
}

List<GridColumn> get getColumns {
  return <GridColumn>[
    GridColumn(
        columnName: 'Appoinment Status',
        label: Container(
            padding: EdgeInsets.all(16.0),
            alignment: Alignment.center,
            color: backgroundColor,
            child: Text(
              'Appoinment Status',
            ))),
    GridColumn(
        columnName: 'First Time',
        label: Container(
            padding: EdgeInsets.all(8.0),
            color: backgroundColor,
            alignment: Alignment.center,
            child: Text('First Time'))),
    GridColumn(
        columnName: 'Follow-up',
        label: Container(
            padding: EdgeInsets.all(8.0),
            alignment: Alignment.center,
            color: backgroundColor,
            child: Text(
              'Follow-up',
              overflow: TextOverflow.ellipsis,
            ))),
    // GridColumn(
    //     columnName: 'Total',
    //     label: Container(
    //         padding: EdgeInsets.all(8.0),
    //         alignment: Alignment.center,
    //         color: backgroundColor,
    //         child: Text(
    //           'Total',
    //           overflow: TextOverflow.ellipsis,
    //         ))),
  ];
}

class Columns extends StatefulWidget {
  const Columns({super.key});

  @override
  State<Columns> createState() => _ColumnsState();
}

class _ColumnsState extends State<Columns> {
  // late List<charts.Series<Appointments, String>> _seriesData;
  late List<charts.Series<Income, String>> _seriesPieData;

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

    var piedata = [
      Income('Unconfirmed', 35, const Color(0xffFFBE18)),
      Income('Cancel', 5, const Color(0xffFF4E02)),
      Income('Confirmed', 45, const Color(0xFF17A1FA)),
      Income('Conpleted', 75, const Color(0xff0BF7B0)),
    ];

    _seriesPieData.add(
      charts.Series(
        domainFn: (Income task, _) => task.income,
        measureFn: (Income task, _) => task.incomevalue,
        colorFn: (Income task, _) =>
            charts.ColorUtil.fromDartColor(task.colorval),
        id: 'Appointment ',
        data: piedata,
        labelAccessorFn: (Income row, _) => '${row.incomevalue}',
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _seriesData = <charts.Series<Appointments, String>>[];
    _seriesPieData = <charts.Series<Income, String>>[];

    _generateData();
  }

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
        Expanded(
          child: charts.BarChart(
            _seriesPieData,
            animate: true,
            barGroupingType: charts.BarGroupingType.grouped,
            behaviors: [
              charts.SeriesLegend(
                position: charts.BehaviorPosition.bottom,
                // outsideJustification:
                //     charts.OutsideJustification.endDrawArea,
                entryTextStyle: charts.TextStyleSpec(
                    color: charts.MaterialPalette.blue.shadeDefault,
                    fontFamily: 'Georgia',
                    fontSize: 11),
              )
            ],
            animationDuration: const Duration(seconds: 5),
          ),
        ),
      ],
    );
  }
}

class Lines extends StatefulWidget {
  const Lines({super.key});

  @override
  State<Lines> createState() => _LinesState();
}

class _LinesState extends State<Lines> {
   late List<charts.Series<Income, String>> _seriesPieData;

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

    var piedata = [
      Income('Unconfirmed', 35, const Color(0xffFFBE18)),
      Income('Cancel', 5, const Color(0xffFF4E02)),
      Income('Confirmed', 45, const Color(0xFF17A1FA)),
      Income('Conpleted', 75, const Color(0xff0BF7B0)),
    ];

    _seriesPieData.add(
      charts.Series(
        domainFn: (Income task, _) => task.income,
        measureFn: (Income task, _) => task.incomevalue,
        colorFn: (Income task, _) =>
            charts.ColorUtil.fromDartColor(task.colorval),
        id: 'Appointment ',
        data: piedata,
        labelAccessorFn: (Income row, _) => '${row.incomevalue}',
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _seriesData = <charts.Series<Appointments, String>>[];
    _seriesPieData = <charts.Series<Income, String>>[];

    _generateData();
  }
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
        // charts.LineChart(_seriesPieData,
        //                           defaultRenderer: charts.LineRendererConfig(
        //                               includePoints: true,
        //                               includeLine: true,
        //                               includeArea: false,
        //                               stacked: false),
        //                           animate: true,
        //                           animationDuration: const Duration(seconds: 5),
        //                           behaviors: [
        //                             charts.ChartTitle('Years',
        //                                 behaviorPosition:
        //                                     charts.BehaviorPosition.bottom,
        //                                 titleOutsideJustification: charts
        //                                     .OutsideJustification
        //                                     .middleDrawArea),
        //                             charts.ChartTitle('Sales',
        //                                 behaviorPosition:
        //                                     charts.BehaviorPosition.start,
        //                                 titleOutsideJustification: charts
        //                                     .OutsideJustification
        //                                     .middleDrawArea),
        //                           ]),
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
  late List<charts.Series<Income, String>> _seriesPieData;

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

    var piedata = [
      Income('Unconfirmed', 35, const Color(0xffFFBE18)),
      Income('Cancel', 5, const Color(0xffFF4E02)),
      Income('Confirmed', 45, const Color(0xFF17A1FA)),
      Income('Conpleted', 75, const Color(0xff0BF7B0)),
    ];

    _seriesPieData.add(
      charts.Series(
        domainFn: (Income task, _) => task.income,
        measureFn: (Income task, _) => task.incomevalue,
        colorFn: (Income task, _) =>
            charts.ColorUtil.fromDartColor(task.colorval),
        id: 'Appointment Report',
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
        Container(
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
                        outsideJustification: charts.OutsideJustification.start,
                        position: charts.BehaviorPosition.top,
                        horizontalFirst: true,
                        desiredMaxColumns: 2,
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
                        arcWidth: 1000, arcRendererDecorators: [])),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
