import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:premierhospitaladmin/screens/Inventory/vendor_form.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../utils/colors.dart';
import '../HomePage/home_screen.dart';

class VendorManagement extends StatefulWidget {
  const VendorManagement({super.key});

  @override
  State<VendorManagement> createState() => _VendorManagementState();
}

class _VendorManagementState extends State<VendorManagement> {
  late UserDataSource userDataSource;
  late List<CurrentUserInfo> UserData = [];

  FirebaseFirestore db = FirebaseFirestore.instance;

  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('Vendor_Management').snapshots();

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

  @override
  void initState() {
    super.initState();
    // getDataFromDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: primaryColor,
        centerTitle: false,
        title: Text(
          "Vendor Management",
          style: GoogleFonts.rubik(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.home,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () =>
                Navigator.pushReplacementNamed(context, HomePage.routeName),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                width: 200,
                child: ListTile(
                    // selected: selectedIndex == 1,
                    // iconColor: Colors.white,
                    tileColor: primaryColor,
                    title: Text(
                      "Create New Vendor",
                      style: GoogleFonts.rubik(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w700),
                    ),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          const VendorForm()));
                    }),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            _buildDataGrid1()
          ],
        )),
      ),
    );
  }
}

class CurrentUserInfo {
  factory CurrentUserInfo.fromJson(Map<String, dynamic> json) {
    return CurrentUserInfo(
      ComapnyName: json['Company Name'],
      ContactPerson: json['Contact Person'],
      Phonenumber: json["Phone Number"],
      email: json['Email'],
      Website: json['Website'],
    );
  }

  CurrentUserInfo(
      {required this.ComapnyName,
      required this.ContactPerson,
      required this.Phonenumber,
      required this.Website,
      required this.email});

  final String ComapnyName;

  final String ContactPerson;

  final String Phonenumber;
  final String Website;

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
                  columnName: 'Company Name', value: e.ComapnyName),
              DataGridCell<String>(
                  columnName: 'Contact Person', value: e.ContactPerson),
              DataGridCell<String>(
                  columnName: 'Phone Number', value: e.Phonenumber),
              DataGridCell<String>(columnName: "Email", value: e.email),
              DataGridCell<String>(columnName: "Website", value: e.Website),
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
        columnName: 'Company Name',
        label: Container(
            padding: EdgeInsets.all(16.0),
            alignment: Alignment.center,
            color: backgroundColor,
            child: Text(
              'Company Name',
            ))),
    GridColumn(
        columnName: 'Contact Person',
        label: Container(
            padding: EdgeInsets.all(8.0),
            color: backgroundColor,
            alignment: Alignment.center,
            child: Text('Contact Person'))),
    GridColumn(
        columnName: 'Phone Number',
        label: Container(
            padding: EdgeInsets.all(8.0),
            alignment: Alignment.center,
            color: backgroundColor,
            child: Text(
              'Phone Number',
              overflow: TextOverflow.ellipsis,
            ))),
    GridColumn(
        columnName: 'Email',
        label: Container(
            padding: EdgeInsets.all(8.0),
            alignment: Alignment.center,
            color: backgroundColor,
            child: Text('Email'))),
    GridColumn(
        columnName: 'Website',
        label: Container(
            padding: EdgeInsets.all(8.0),
            alignment: Alignment.center,
            color: backgroundColor,
            child: Text('Website'))),
  ];
}
