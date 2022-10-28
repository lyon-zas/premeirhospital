import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../utils/colors.dart';

class PatientReport extends StatefulWidget {
  static const routeName = "/PatientReport";
  const PatientReport({super.key});

  @override
  State<PatientReport> createState() => _PatientReportState();
}

class _PatientReportState extends State<PatientReport> {
  late dynamic _condition = 'is not empty';
  late String _selectedpatient = 'Patient';
  late String _creationDate = 'Select';
  List<String> date = [
    'All',
  ];
  List<String> patient = [
    'All',
    '',
  ];
  List<String> others = [
    'All',
    '',
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
          "Appoinment Report",
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
            Text(
              "Select patients matching all of these conditions:",
              style: GoogleFonts.inter(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w700),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 1.8,
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DropdownButtonHideUnderline(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 200,
                        height: 35,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: DropdownButton<String>(
                              hint: Text(
                                _selectedpatient,
                                style: GoogleFonts.rubik(
                                    color: const Color(0xFF908F8F),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400),
                              ),

                              // style: TextStyle(color: Color(0xFFD9D9D9),),

                              focusColor: const Color(0xFFD9D9D9),
                              items: patient.map(
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
                                    _selectedpatient = val!;
                                  },
                                );
                              }),
                        ),
                      ),
                    ),
                  ),
                  DropdownButtonHideUnderline(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 35,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: DropdownButton<String>(
                              hint: Text(
                                _creationDate,
                                style: GoogleFonts.rubik(
                                    color: const Color(0xFF908F8F),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400),
                              ),

                              // style: TextStyle(color: Color(0xFFD9D9D9),),

                              focusColor: const Color(0xFFD9D9D9),
                              items: date.map(
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
                                    _creationDate = val!;
                                  },
                                );
                              }),
                        ),
                      ),
                    ),
                  ),
                  DropdownButtonHideUnderline(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 200,
                        height: 35,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: DropdownButton<String>(
                              hint: Text(
                                _condition,
                                style: GoogleFonts.rubik(
                                    color: const Color(0xFF908F8F),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400),
                              ),

                              // style: TextStyle(color: Color(0xFFD9D9D9),),

                              focusColor: const Color(0xFFD9D9D9),
                              items: others.map(
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
                                    _condition = val!;
                                  },
                                );
                              }),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            // const SizedBox(
            //   height: 0,
            // ),
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
                  height: MediaQuery.of(context).size.height / 1.7,
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

    final getDataFromFireStore =
        FirebaseFirestore.instance.collection('Patients').snapshots();
    final Stream<QuerySnapshot> _usersStream =
        FirebaseFirestore.instance.collection('Patients').snapshots();

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
              columns: getColumns);
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
            child: _buildDataGrid1()
            // Table(
            //     border: TableBorder
            //         .all(), // Allows to add a border decoration around your table
            //     children: [
            //       TableRow(
            //           decoration: const BoxDecoration(
            //             color: Color(0xFFB3B3B3),
            //           ),
            //           children: [
            //             Text(
            //               'Creation Date',
            //               textAlign: TextAlign.center,
            //               style: GoogleFonts.rubik(
            //                   color: Colors.black,
            //                   fontSize: 16,
            //                   fontWeight: FontWeight.w700),
            //             ),
            //             Text(
            //               'Full',
            //               textAlign: TextAlign.center,
            //               style: GoogleFonts.rubik(
            //                   color: Colors.black,
            //                   fontSize: 16,
            //                   fontWeight: FontWeight.w700),
            //             ),
            //             Text(
            //               'Gender',
            //               textAlign: TextAlign.center,
            //               style: GoogleFonts.rubik(
            //                   color: Colors.black,
            //                   fontSize: 16,
            //                   fontWeight: FontWeight.w700),
            //             ),
            //             Text(
            //               'Date of birth',
            //               textAlign: TextAlign.center,
            //               style: GoogleFonts.rubik(
            //                   color: Colors.black,
            //                   fontSize: 16,
            //                   fontWeight: FontWeight.w700),
            //             ),
            //             Text(
            //               'Phone',
            //               textAlign: TextAlign.center,
            //               style: GoogleFonts.rubik(
            //                   color: Colors.black,
            //                   fontSize: 16,
            //                   fontWeight: FontWeight.w700),
            //             ),
            //             Text(
            //               'Email',
            //               textAlign: TextAlign.center,
            //               style: GoogleFonts.rubik(
            //                   color: Colors.black,
            //                   fontSize: 16,
            //                   fontWeight: FontWeight.w700),
            //             ),
            //           ]),
            //       TableRow(children: [
            //         Text(
            //           '',
            //           textAlign: TextAlign.center,
            //           style: GoogleFonts.rubik(
            //               color: Colors.black,
            //               fontSize: 16,
            //               fontWeight: FontWeight.w700),
            //         ),
            //         Text(
            //           '',
            //           textAlign: TextAlign.center,
            //           style: GoogleFonts.rubik(
            //               color: Colors.black,
            //               fontSize: 16,
            //               fontWeight: FontWeight.w700),
            //         ),
            //         Text(
            //           '',
            //           textAlign: TextAlign.center,
            //           style: GoogleFonts.rubik(
            //               color: Colors.black,
            //               fontSize: 16,
            //               fontWeight: FontWeight.w700),
            //         ),
            //         Text(
            //           '',
            //           textAlign: TextAlign.center,
            //           style: GoogleFonts.rubik(
            //               color: Colors.black,
            //               fontSize: 16,
            //               fontWeight: FontWeight.w700),
            //         ),
            //         Text(
            //           '',
            //           textAlign: TextAlign.center,
            //           style: GoogleFonts.rubik(
            //               color: Colors.black,
            //               fontSize: 16,
            //               fontWeight: FontWeight.w700),
            //         ),
            //         Text(
            //           '',
            //           textAlign: TextAlign.center,
            //           style: GoogleFonts.rubik(
            //               color: Colors.black,
            //               fontSize: 16,
            //               fontWeight: FontWeight.w700),
            //         ),
            //       ]),
            //     ]),
            ),
      ],
    );
  }
}

class CurrentUserInfo {
  factory CurrentUserInfo.fromJson(Map<String, dynamic> json) {
    return CurrentUserInfo(
        dateOfCreation: json['Date of Creation'],
        FirstName: json['First Name'],
        LastName: json["Last Name"],
        Phonenumber: json["Phone Number"],
        Gender: json['Gender'],
        Status: json['status'],
        DOB: json['Date of birth'],
        email: json['Email']);
  }

  CurrentUserInfo(
      {required this.dateOfCreation,
      required this.Phonenumber,
      required this.FirstName,
      required this.LastName,
      required this.DOB,
      required this.Gender,
      required this.Status,
      required this.email});

//   }
  final String dateOfCreation;

  /// Name of an employee.
  final String Phonenumber;

  /// Designation of an employee.
  final String FirstName;
  final String LastName;
  final String DOB;
  final String Gender;
  final String Status;
  final String email;
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
                  columnName: 'Creation Date', value: e.dateOfCreation),
              DataGridCell<String>(
                  columnName: 'Full Name', value: e.FirstName + e.LastName),
              DataGridCell<String>(columnName: 'Gender', value: e.Gender),
              DataGridCell<String>(columnName: 'Date of birth', value: e.DOB),
              DataGridCell<String>(columnName: "Phone", value: e.Phonenumber),
              DataGridCell<String>(columnName: "Email", value: e.email)
            ]))
        .toList();
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
        columnName: 'Creation Date',
        label: Container(
            padding: EdgeInsets.all(16.0),
            alignment: Alignment.center,
            color: backgroundColor,
            child: Text(
              'Creation Date',
            ))),
    GridColumn(
        columnName: 'Full Name',
        label: Container(
            padding: EdgeInsets.all(8.0),
            color: backgroundColor,
            alignment: Alignment.center,
            child: Text('Full Name'))),
    GridColumn(
        columnName: 'Gender',
        label: Container(
            padding: EdgeInsets.all(8.0),
            alignment: Alignment.center,
            color: backgroundColor,
            child: Text(
              'Gender',
              overflow: TextOverflow.ellipsis,
            ))),
    GridColumn(
        columnName: 'Date of birth',
        label: Container(
            padding: EdgeInsets.all(8.0),
            alignment: Alignment.center,
            color: backgroundColor,
            child: Text('Date of birth'))),
    GridColumn(
        columnName: 'Phone',
        label: Container(
            padding: EdgeInsets.all(8.0),
            color: backgroundColor,
            alignment: Alignment.center,
            child: Text('Phone'))),
    GridColumn(
        columnName: 'Email',
        label: Container(
            padding: EdgeInsets.all(8.0),
            color: backgroundColor,
            alignment: Alignment.center,
            child: Text('Email'))),
  ];
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
