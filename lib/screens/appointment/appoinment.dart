import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter_new/flutter.dart' as charts;
import 'package:premierhospitaladmin/screens/appointment/add_appointment.dart';
import 'package:premierhospitaladmin/screens/appointment/queue.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:premierhospitaladmin/utils/colors.dart';

class AppointmentPage extends StatefulWidget {
  const AppointmentPage({super.key});

  @override
  State<AppointmentPage> createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {
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
        if (!snapshot.hasData) return const LinearProgressIndicator();
        UserData.clear();
        snapshot.data!.docs.forEach((doc) {
          UserData.add(
              AppointmentData.fromJson(doc.data() as Map<String, dynamic>));
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
            columns: getColumns,
            isScrollbarAlwaysShown: true,
            // horizontalScrollController: ScrollController(),
            // horizontalScrollPhysics: SCro(),
            shrinkWrapRows: false,
            shrinkWrapColumns: false,
            onCellTap: ((details) {
              if (details.rowColumnIndex.rowIndex != 0) {
                int selectedRowIndex = details.rowColumnIndex.rowIndex - 1;
                var row =
                    userDataSource.effectiveRows.elementAt(selectedRowIndex);

                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0))),
                        content: SizedBox(
                          height: MediaQuery.of(context).size.height / 2,
                          width: MediaQuery.of(context).size.width / 2,
                          child: Column(
                              // mainAxisAlignment: MainAxisAlignment,
                              children: [
                                AppBar(
                                  backgroundColor: primaryColor,
                                  title: Text("Appointment Details",
                                      style: GoogleFonts.rubik(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700)),
                                  centerTitle: false,
                                  actions: [
                                    IconButton(
                                        onPressed: () {
                                          // Navigator.pop(context);
                                        },
                                        icon: const Icon(
                                          Icons.delete,
                                          size: 18,
                                          color: Colors.white,
                                        )),
                                    IconButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        icon: const Icon(
                                          Icons.cancel,
                                          size: 18,
                                          color: Colors.white,
                                        ))
                                  ],
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              3,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(children: [
                                            const Text(
                                              'Patient ID',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 25)),
                                            const Text(':'),
                                            const Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 10)),
                                            Text(row
                                                .getCells()[0]
                                                .value
                                                .toString()),
                                          ]),
                                          Row(children: [
                                            const Text(
                                              'Appointment No',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 10)),
                                            const Text(':'),
                                            const Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 10)),
                                            Text(row
                                                .getCells()[1]
                                                .value
                                                .toString()),
                                          ]),
                                          Row(children: [
                                            const Text(
                                              'Appointment Date',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 25)),
                                            const Text(':'),
                                            const Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 10)),
                                            Text(row
                                                .getCells()[2]
                                                .value
                                                .toString()),
                                          ]),
                                          Row(children: [
                                            const Text(
                                              'Phone No',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 45)),
                                            const Text(':'),
                                            const Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 10)),
                                            Text(row
                                                .getCells()[3]
                                                .value
                                                .toString()),
                                          ]),
                                          Row(children: [
                                            const Text(
                                              'Payment Mode',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 45)),
                                            const Text(':'),
                                            const Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 10)),
                                            Text(row
                                                .getCells()[8]
                                                .value
                                                .toString()),
                                          ]),
                                          
                                        ],
                                      ),
                                    ),
                                    ////////
                                    //Column 2
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              3,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(children: [
                                            const Text(
                                              'Doctor',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 25)),
                                            const Text(':'),
                                            const Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 10)),
                                            Text(row
                                                .getCells()[4]
                                                .value
                                                .toString()),
                                          ]),
                                          Row(children: [
                                            const Text(
                                              'Source',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 10)),
                                            const Text(':'),
                                            const Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 10)),
                                            Text(row
                                                .getCells()[5]
                                                .value
                                                .toString()),
                                          ]),
                                          Row(children: [
                                            const Text(
                                              'Status',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 25)),
                                            const Text(':'),
                                            const Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 10)),
                                            Text(row
                                                .getCells()[6]
                                                .value
                                                .toString()),
                                          ]),
                                          Row(children: [
                                            const Text(
                                              'Slot',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 45)),
                                            const Text(':'),
                                            const Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 10)),
                                            Text(row
                                                .getCells()[7]
                                                .value
                                                .toString()),
                                          ]),
                                          Row(children: [
                                            const Text(
                                              'Appointment Type',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 45)),
                                            const Text(':'),
                                            const Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 10)),
                                            Text(row
                                                .getCells()[9]
                                                .value
                                                .toString()),
                                          ]),
                                        ],
                                      ),
                                    )
                                  ],
                                )
                                // SizedBox(
                                //   width: 300,
                                //   child: ElevatedButton(
                                //       onPressed: () {
                                //         Navigator.pop(context);
                                //       },
                                //       child: const Text("OK")),
                                // )
                              ]),
                        )));
              }
            }));
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
                                    const Icon(
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
                        // SizedBox(
                        //   width: 20,
                        // ),
                        // Container(
                        //   color: inactiveButtonColor,
                        //   height: MediaQuery.of(context).size.height * 0.06,
                        //   width: MediaQuery.of(context).size.width * 0.08,
                        //   child: Center(
                        //     child: Text("Doctor Wise",
                        //         style: GoogleFonts.rubik(
                        //             color: Colors.white,
                        //             fontSize: 13,
                        //             fontWeight: FontWeight.w400)),
                        //   ),
                        // ),
                        // SizedBox(
                        //   width: 10,
                        // ),
                        // GestureDetector(
                        //   onTap: (() {
                        //     Navigator.pushNamed(context, Queue.routeName);
                        //   }),
                        //   child: Container(
                        //     color: inactiveButtonColor,
                        //     height: MediaQuery.of(context).size.height * 0.06,
                        //     width: MediaQuery.of(context).size.width * 0.08,
                        //     child: Center(
                        //       child: Text("Queue",
                        //           style: GoogleFonts.rubik(
                        //               color: Colors.white,
                        //               fontSize: 13,
                        //               fontWeight: FontWeight.w400)),
                        //     ),
                        //   ),
                        // )
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
                width: MediaQuery.of(context).size.width * 2,
                child: _buildDataGrid1())
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
        Status: json['status'],
        slot: json['slot'],
        paymentmode: json['paymentmode'],
        appointmenttype: json['appoinmentType']);
  }

  AppointmentData({
    required this.PatientId,
    required this.AptNo,
    required this.ApptDate,
    required this.Phone,
    required this.Doctor,
    required this.Source,
    required this.Status,
    required this.slot,
    required this.paymentmode,
    required this.appointmenttype,
  });

  final String PatientId;

  final String AptNo;

  final String ApptDate;
  final String Phone;
  final String Doctor;
  final String Source;
  final String Status;
  final String slot;
  final String paymentmode;
  final String appointmenttype;
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
              DataGridCell<String>(columnName: "Status", value: e.Status),
              DataGridCell<String>(columnName: "Slot", value: e.slot),
              DataGridCell<String>(
                  columnName: "Payment Mode", value: e.paymentmode),
              DataGridCell<String>(
                  columnName: "Appointment Type", value: e.appointmenttype)
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
        padding: const EdgeInsets.all(8.0),
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
            padding: const EdgeInsets.all(16.0),
            alignment: Alignment.center,
            color: backgroundColor,
            child: const Text(
              'Patient ID',
            ))),
    GridColumn(
        columnName: 'Apt No',
        label: Container(
            padding: const EdgeInsets.all(8.0),
            alignment: Alignment.center,
            color: backgroundColor,
            child: const Text('Apt No'))),
    GridColumn(
        columnName: 'Appt Date',
        label: Container(
            padding: const EdgeInsets.all(8.0),
            alignment: Alignment.center,
            color: backgroundColor,
            child: const Text(
              'Appt Date',
              overflow: TextOverflow.ellipsis,
            ))),
    GridColumn(
        columnName: 'Phone',
        label: Container(
            padding: const EdgeInsets.all(8.0),
            alignment: Alignment.center,
            color: backgroundColor,
            child: const Text('Phone'))),
    GridColumn(
        columnName: 'Doctor',
        label: Container(
            padding: const EdgeInsets.all(8.0),
            alignment: Alignment.center,
            color: backgroundColor,
            child: const Text('Doctor'))),
    GridColumn(
        columnName: 'Source',
        label: Container(
            padding: const EdgeInsets.all(8.0),
            alignment: Alignment.center,
            color: backgroundColor,
            child: const Text('Source'))),
    GridColumn(
        columnName: 'Status',
        label: Container(
            padding: const EdgeInsets.all(8.0),
            alignment: Alignment.center,
            color: backgroundColor,
            child: const Text('Status'))),
    GridColumn(
        columnName: 'Slot',
        label: Container(
            padding: const EdgeInsets.all(8.0),
            alignment: Alignment.center,
            color: backgroundColor,
            child: const Text('Slot'))),
    GridColumn(
        columnName: 'Payment Mode',
        label: Container(
            padding: const EdgeInsets.all(8.0),
            alignment: Alignment.center,
            color: backgroundColor,
            child: const Text('Payment Mode'))),
    GridColumn(
        columnName: 'Appointment Type',
        label: Container(
            padding: const EdgeInsets.all(8.0),
            alignment: Alignment.center,
            color: backgroundColor,
            child: const Text('Appointment Type'))),
  ];
}
