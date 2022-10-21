import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../patient/patient.dart';

class Inventory extends StatefulWidget {
  const Inventory({super.key});

  @override
  State<Inventory> createState() => _InventoryState();
}

class _InventoryState extends State<Inventory> {
   late UserDataSource userDataSource;
  late List<CurrentUserInfo> UserData = [];
  FirebaseFirestore db = FirebaseFirestore.instance;
  Stream<QuerySnapshot> _userStream =
      FirebaseFirestore.instance.collection('Users').snapshots();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(
      child: StreamBuilder<QuerySnapshot>(
        stream: _userStream,
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
                columnName: "Uid",
                label: Container(
                  padding: EdgeInsets.all(16.0),
                  alignment: Alignment.center,
                  child: Text(
                    'ID',
                  ),
                ),
              ),
              //make gridcollumns for Name Surname role and city
              GridColumn(
                columnName: "Name",
                label: Container(
                  padding: EdgeInsets.all(16.0),
                  alignment: Alignment.center,
                  child: Text(
                    'Name',
                  ),
                ),
              ),
              GridColumn(
                columnName: "Surname",
                label: Container(
                  padding: EdgeInsets.all(16.0),
                  alignment: Alignment.center,
                  child: Text(
                    'Surname',
                  ),
                ),
              ),
              GridColumn(
                columnName: "Role",
                label: Container(
                  padding: EdgeInsets.all(16.0),
                  alignment: Alignment.center,
                  child: Text(
                    'Role',
                  ),
                ),
              ),
              GridColumn(
                columnName: "City",
                label: Container(
                  padding: EdgeInsets.all(16.0),
                  alignment: Alignment.center,
                  child: Text(
                    'City',
                  ),
                ),
              ),
            ],
          );
        },
      ),
    ),);
  }
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
