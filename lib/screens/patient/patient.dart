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
  late EmployeeDataSource employeeDataSource;
  late UserDataSource userDataSource;
  late List<CurrentUserInfo> UserData = [];
  
  //
  FirebaseFirestore db = FirebaseFirestore.instance;
  List<Employee> employeeData = [];

  final getDataFromFireStore =
      FirebaseFirestore.instance.collection('Patients').snapshots();
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('Patients').snapshots();

  // Stream<QuerySnapshot> _userStream = FirebaseFirestore.instance.collection('Users').snapshots();

  Widget _buildDataGrid() {
    return StreamBuilder<QuerySnapshot>(
      stream: _usersStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data =
                document.data()! as Map<String, dynamic>;
            return ListTile(
              title: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  data['First Name'].toString(),
                  style: TextStyle(color: Colors.black),
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }

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
          columns: <GridColumn>[
            GridColumn(
                columnName: 'Patient ID',
                label: Container(
                    padding: EdgeInsets.all(16.0),
                    alignment: Alignment.center,
                    child: Text(
                      'Patient ID',
                    ))),
            GridColumn(
                columnName: 'First Name',
                label: Container(
                    padding: EdgeInsets.all(8.0),
                    alignment: Alignment.center,
                    child: Text('First Name'))),
            GridColumn(
                columnName: 'Last Name',
                label: Container(
                    padding: EdgeInsets.all(8.0),
                    alignment: Alignment.center,
                    child: Text(
                      'Last Name',
                      overflow: TextOverflow.ellipsis,
                    ))),
            GridColumn(
                columnName: 'Date of Birth',
                label: Container(
                    padding: EdgeInsets.all(8.0),
                    alignment: Alignment.center,
                    child: Text('Date of Birth'))),
            GridColumn(
                columnName: 'Gender',
                label: Container(
                    padding: EdgeInsets.all(8.0),
                    alignment: Alignment.center,
                    child: Text('Gender'))),
            GridColumn(
                columnName: 'Phone',
                label: Container(
                    padding: EdgeInsets.all(8.0),
                    alignment: Alignment.center,
                    child: Text('Phone'))),
            GridColumn(
                columnName: 'Status',
                label: Container(
                    padding: EdgeInsets.all(8.0),
                    alignment: Alignment.center,
                    child: Text('Status'))),
          ],
        );
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
            // SfDataGrid(
            //   source: employeeDataSource,
            //   gridLinesVisibility: GridLinesVisibility.both,
            //   headerGridLinesVisibility: GridLinesVisibility.both,
            //   columnWidthMode: ColumnWidthMode.fill,
            //   allowColumnsResizing: true,
            //   allowSorting: true,
            //   allowFiltering: true,
            //   columns: <GridColumn>[
            //     GridColumn(
            //         columnName: 'id',
            //         label: Container(
            //             padding: const EdgeInsets.all(16.0),
            //             alignment: Alignment.center,
            //             color: backgroundColor,
            //             child: const Text(
            //               'Patient ID',
            //             ))),
            //     GridColumn(
            //         columnName: 'name',
            //         label: Container(
            //             padding: const EdgeInsets.all(8.0),
            //             alignment: Alignment.center,
            //             color: backgroundColor,
            //             child: const Text('Appt No'))),
            //     GridColumn(
            //         columnName: 'designation',
            //         label: Container(
            //             padding: const EdgeInsets.all(8.0),
            //             alignment: Alignment.center,
            //             color: backgroundColor,
            //             child: const Text(
            //               'Appt Date ',
            //               overflow: TextOverflow.ellipsis,
            //             ))),
            //     GridColumn(
            //         columnName: 'salary',
            //         label: Container(
            //             padding: const EdgeInsets.all(8.0),
            //             color: backgroundColor,
            //             alignment: Alignment.center,
            //             child: const Text('Phone'))),
            //     GridColumn(
            //         columnName: 'salary',
            //         label: Container(
            //             padding: const EdgeInsets.all(8.0),
            //             color: backgroundColor,
            //             alignment: Alignment.center,
            //             child: const Text('doctor'))),
            //     GridColumn(
            //         columnName: 'source',
            //         label: Container(
            //             padding: const EdgeInsets.all(8.0),
            //             color: backgroundColor,
            //             alignment: Alignment.center,
            //             child: const Text('Source'))),
            //     GridColumn(
            //         columnName: 'status',
            //         label: Container(
            //             padding: const EdgeInsets.all(8.0),
            //             color: backgroundColor,
            //             alignment: Alignment.center,
            //             child: const Text('Status'))),
            //   ],
            // )
          ],
        ),
      ))),
    );
  }

  // List<Employee> getEmployeeData() {
  //   return [
  //     Employee(10001, 'James', 'Project Lead', 20000),
  //     Employee(10002, 'Kathryn', 'Manager', 30000),
  //     Employee(10003, 'Lara', 'Developer', 15000),
  //     Employee(10004, 'Michael', 'Designer', 15000),
  //     Employee(10005, 'Martin', 'Developer', 15000),
  //     Employee(10006, 'Newberry', 'Developer', 15000),
  //     Employee(10007, 'Balnc', 'Developer', 15000),
  //     Employee(10008, 'Perry', 'Developer', 15000),
  //     Employee(10009, 'Gable', 'Developer', 15000),
  //     Employee(10010, 'Grimes', 'Developer', 15000)
  //   ];
  // }
}

/// Custom business object class which contains properties to hold the detailed
/// information about the employee which will be rendered in datagrid.
class Employee {
  /// Creates the employee class with required details.
  Employee(this.PatientId, this.Phonenumber, this.FirstName, this.LastName,
      this.DOB, this.Gender, this.Status);

  /// Id of an employee.
  final String PatientId;

  /// Name of an employee.
  final int Phonenumber;

  /// Designation of an employee.
  final String FirstName;
  final String LastName;
  final String DOB;
  final String Gender;
  final String Status;
}

class CurrentUserInfo {
  /// Creates the employee class with required details.
  CurrentUserInfo(this.PatientId, this.Phonenumber, this.FirstName, this.LastName,
      this.DOB, this.Gender, this.Status);



  CurrentUserInfo.fromJson(Map<String, dynamic> json) {
    PatientId = json['paymentCost'];
    Phonenumber = json['paymentDate'];
    FirstName = json["FirstName"];
    LastName=json["FirstName"];
    DOB = json['DOB'];
    Gender = json['Gender'];
    Status = json['Status'];
  }
  late String PatientId;

  /// Name of an employee.
 late String Phonenumber;

  /// Designation of an employee.
 late String FirstName;
 late String LastName;
 late String DOB;
 late String Gender;
  late String Status;
}

/// An object to set the employee collection data source to the datagrid. This
/// is used to map the employee data to the datagrid widget.
///

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
              DataGridCell<String>(columnName: "Status", value: e.Status)
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

//
class EmployeeDataSource extends DataGridSource {
  EmployeeDataSource(this.employeeData) {
    _buildDataRow();
  }

  List<DataGridRow> dataGridRows = [];
  List<Employee> employeeData;

  void _buildDataRow() {
    dataGridRows = employeeData
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<String>(
                  columnName: 'Patient ID', value: e.PatientId),
              DataGridCell<String>(
                  columnName: 'First Name', value: e.FirstName),
              DataGridCell<String>(columnName: 'Last Name', value: e.LastName),
              DataGridCell<String>(columnName: 'Date of Birth', value: e.DOB),
              DataGridCell<String>(columnName: "Gender", value: e.Gender),
              DataGridCell<int>(columnName: "Phone", value: e.Phonenumber),
              DataGridCell<String>(columnName: "Status", value: e.Status)
            ]))
        .toList();
  }

  @override
  List<DataGridRow> get rows => dataGridRows;

  @override
  DataGridRowAdapter buildRow(
    DataGridRow row,
  ) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((e) {
      return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
        child: Text(e.value.toString()),
      );
    }).toList());
  }

  void updateDataGridSource() {
    notifyListeners();
  }
}

List<GridColumn> get getColumns {
  return <GridColumn>[
    GridColumn(
        columnName: 'Patient ID',
        label: Container(
            padding: EdgeInsets.all(16.0),
            alignment: Alignment.center,
            child: Text(
              'Patient ID',
            ))),
    GridColumn(
        columnName: 'First Name',
        label: Container(
            padding: EdgeInsets.all(8.0),
            alignment: Alignment.center,
            child: Text('First Name'))),
    GridColumn(
        columnName: 'Last Name',
        label: Container(
            padding: EdgeInsets.all(8.0),
            alignment: Alignment.center,
            child: Text(
              'Last Name',
              overflow: TextOverflow.ellipsis,
            ))),
    GridColumn(
        columnName: 'Date of Birth',
        label: Container(
            padding: EdgeInsets.all(8.0),
            alignment: Alignment.center,
            child: Text('Date of Birth'))),
    GridColumn(
        columnName: 'Gender',
        label: Container(
            padding: EdgeInsets.all(8.0),
            alignment: Alignment.center,
            child: Text('Gender'))),
    GridColumn(
        columnName: 'Phone',
        label: Container(
            padding: EdgeInsets.all(8.0),
            alignment: Alignment.center,
            child: Text('Phone'))),
    GridColumn(
        columnName: 'Status',
        label: Container(
            padding: EdgeInsets.all(8.0),
            alignment: Alignment.center,
            child: Text('Status'))),
  ];
}

