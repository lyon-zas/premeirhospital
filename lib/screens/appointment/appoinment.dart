import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter_new/flutter.dart' as charts;
import 'package:premierhospitaladmin/screens/appointment/add_appointment.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:premierhospitaladmin/utils/colors.dart';

class Appointment extends StatefulWidget {
  const Appointment({super.key});

  @override
  State<Appointment> createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment> {
  late UserDataSource userDataSource;
  late List<AppointmentData> UserData = [];

  FirebaseFirestore db = FirebaseFirestore.instance;

  final getDataFromFireStore =
      FirebaseFirestore.instance.collection('Appointments').snapshots();
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('Appointments').snapshots();

  Widget _buildDataGrid1() {
    late List<AppointmentData> UserData = [];
    return StreamBuilder<QuerySnapshot>(
      stream: _usersStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();
        UserData.clear();
        snapshot.data!.docs.forEach((doc) {
          UserData.add(
              AppointmentData.fromJson(doc.data() as Map<String, dynamic>));
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
                    Text("Appointment Details",
                        style: GoogleFonts.rubik(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w700)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: (() {
                            Navigator.pushNamed(
                                context, AddAppointment.routeName);
                          }),
                          child: Container(
                              color: buttonColor,
                              height: MediaQuery.of(context).size.height * 0.06,
                              width: MediaQuery.of(context).size.width * 0.11,
                              child: Center(
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.add,
                                      color: Colors.white,
                                    ),
                                    Text("Add Appointments",
                                        style: GoogleFonts.rubik(
                                            color: Colors.white,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w400))
                                  ],
                                ),
                              )),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          color: inactiveButtonColor,
                          height: MediaQuery.of(context).size.height * 0.06,
                          width: MediaQuery.of(context).size.width * 0.08,
                          child: Center(
                            child: Text("Doctor Wise",
                                style: GoogleFonts.rubik(
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400)),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          color: inactiveButtonColor,
                          height: MediaQuery.of(context).size.height * 0.06,
                          width: MediaQuery.of(context).size.width * 0.08,
                          child: Center(
                            child: Text("Queue",
                                style: GoogleFonts.rubik(
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400)),
                          ),
                        )
                      ],
                    )
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

class AppointmentData {
  factory AppointmentData.fromJson(Map<String, dynamic> json) {
    return AppointmentData(
        PatientId: json['Patient ID'],
        AptNo: json['Apt No'],
        ApptDate: json["Appt Date"],
        Phone: json["Phone"],
        Doctor: json['Doctor'],
        Source: json['Source'],
        Status: json['status']);
  }

  AppointmentData(
      {required this.PatientId,
      required this.AptNo,
      required this.ApptDate,
      required this.Phone,
      required this.Doctor,
      required this.Source,
      required this.Status});

  final String PatientId;

  final String AptNo;

  final String ApptDate;
  final String Phone;
  final String Doctor;
  final String Source;
  final String Status;
}

class UserDataSource extends DataGridSource {
  UserDataSource(this._appointmentData) {
    _buildDataRow();
  }

  List<DataGridRow> users = [];
  List<AppointmentData> _appointmentData;

  void _buildDataRow() {
    users = _appointmentData
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<String>(
                  columnName: 'Patient ID', value: e.PatientId),
              DataGridCell<String>(columnName: 'Apt No', value: e.AptNo),
              DataGridCell<String>(columnName: 'Appt Date', value: e.ApptDate),
              DataGridCell<String>(columnName: 'Phone', value: e.Phone),
              DataGridCell<String>(columnName: "Doctor", value: e.Doctor),
              DataGridCell<String>(columnName: "Source", value: e.Source),
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
        columnName: 'Apt No',
        label: Container(
            padding: EdgeInsets.all(8.0),
            alignment: Alignment.center,
            color: backgroundColor,
            child: Text('Apt No'))),
    GridColumn(
        columnName: 'Appt Date',
        label: Container(
            padding: EdgeInsets.all(8.0),
            alignment: Alignment.center,
            color: backgroundColor,
            child: Text(
              'Appt Date',
              overflow: TextOverflow.ellipsis,
            ))),
    GridColumn(
        columnName: 'Phone',
        label: Container(
            padding: EdgeInsets.all(8.0),
            alignment: Alignment.center,
            color: backgroundColor,
            child: Text('Phone'))),
    GridColumn(
        columnName: 'Doctor',
        label: Container(
            padding: EdgeInsets.all(8.0),
            alignment: Alignment.center,
            color: backgroundColor,
            child: Text('Doctor'))),
    GridColumn(
        columnName: 'Source',
        label: Container(
            padding: EdgeInsets.all(8.0),
            alignment: Alignment.center,
            color: backgroundColor,
            child: Text('Source'))),
    GridColumn(
        columnName: 'Status',
        label: Container(
            padding: EdgeInsets.all(8.0),
            alignment: Alignment.center,
            color: backgroundColor,
            child: Text('Status'))),
  ];
}
