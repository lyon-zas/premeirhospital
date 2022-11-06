import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:premierhospitaladmin/screens/patient/app_patient.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

import '../../utils/colors.dart';

class Patient extends StatefulWidget {
  const Patient({super.key});

  @override
  State<Patient> createState() => _PatientState();
}

class _PatientState extends State<Patient> {
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
           columnWidthMode: ColumnWidthMode.fitByColumnName,
            source: userDataSource,
            gridLinesVisibility: GridLinesVisibility.both,
            headerGridLinesVisibility: GridLinesVisibility.both,
            allowColumnsResizing: true,
            allowSorting: true,
            allowFiltering: true,
            shrinkWrapRows: false,
            isScrollbarAlwaysShown: true,
            columns: getColumns);
      },
    );
  }

  @override
  void initState() {
    super.initState();
    // getDataFromDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: SafeArea(
              child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Container(
              color: backgroundColor,
              width: MediaQuery.of(context).size.width,
              height: 60,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Patient Registration",
                        style: GoogleFonts.rubik(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w700)),
                    GestureDetector(
                      onTap: (() {
                        Navigator.pushNamed(context, AddPatient.routeName);
                      }),
                      child: Container(
                          color: buttonColor,
                          height: MediaQuery.of(context).size.height * 0.06,
                          width: MediaQuery.of(context).size.width * 0.11,
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                                Text("New Patient",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.rubik(
                                        color: Colors.white,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400))
                              ],
                            ),
                          )),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            _buildDataGrid1()
          ],
        ),
      ))),
    );
  }
}

class CurrentUserInfo {
  factory CurrentUserInfo.fromJson(Map<String, dynamic> json) {
    return CurrentUserInfo(
        PatientId: json['Patient id'],
        FirstName: json['First Name'],
        LastName: json["Last Name"],
        Phonenumber: json["Phone Number"],
        Gender: json['Gender'],
        Status: json['status'],
        DOB: json['Date of birth'],
        email: json['Email']);
  }

  CurrentUserInfo(
      {required this.PatientId,
      required this.Phonenumber,
      required this.FirstName,
      required this.LastName,
      required this.DOB,
      required this.Gender,
      required this.Status,
      required this.email});

//   }
  final String PatientId;

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
                  columnName: 'Patient ID', value: e.PatientId),
              DataGridCell<String>(
                  columnName: 'First Name', value: e.FirstName),
              DataGridCell<String>(columnName: 'Last Name', value: e.LastName),
              DataGridCell<String>(columnName: 'Date of Birth', value: e.DOB),
              DataGridCell<String>(columnName: "Gender", value: e.Gender),
              DataGridCell<String>(columnName: "Phone", value: e.Phonenumber),
              DataGridCell<String>(columnName: "Status", value: e.Status),
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
        columnName: 'Patient ID',
        label: Container(
            padding: EdgeInsets.all(16.0),
            alignment: Alignment.center,
            color: backgroundColor,
            child: Text(
              'Patient ID',
            ))),
    GridColumn(
        columnName: 'First Name',
        label: Container(
            padding: EdgeInsets.all(8.0),
            color: backgroundColor,
            alignment: Alignment.center,
            child: Text('First Name'))),
    GridColumn(
        columnName: 'Last Name',
        label: Container(
            padding: EdgeInsets.all(8.0),
            alignment: Alignment.center,
            color: backgroundColor,
            child: Text(
              'Last Name',
              overflow: TextOverflow.ellipsis,
            ))),
    GridColumn(
        columnName: 'Date of Birth',
        label: Container(
            padding: EdgeInsets.all(8.0),
            alignment: Alignment.center,
            color: backgroundColor,
            child: Text('Date of Birth'))),
    GridColumn(
        columnName: 'Gender',
        label: Container(
            padding: EdgeInsets.all(8.0),
            alignment: Alignment.center,
            color: backgroundColor,
            child: Text('Gender'))),
    GridColumn(
        columnName: 'Phone',
        label: Container(
            padding: EdgeInsets.all(8.0),
            color: backgroundColor,
            alignment: Alignment.center,
            child: Text('Phone'))),
    GridColumn(
        columnName: 'Status',
        label: Container(
            padding: EdgeInsets.all(8.0),
            color: backgroundColor,
            alignment: Alignment.center,
            child: Text('Status'))),
     GridColumn(
        columnName: 'Email',
        label: Container(
            padding: EdgeInsets.all(8.0),
            color: backgroundColor,
            alignment: Alignment.center,
            child: Text('Email'))),
  ];
}
