import 'package:flutter/material.dart';
import 'package:charts_flutter_new/flutter.dart' as charts;
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:premierhospitaladmin/utils/colors.dart';

class Appointment extends StatefulWidget {
  const Appointment({super.key});

  @override
  State<Appointment> createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment> {
  List<Employee> employees = <Employee>[];
  late EmployeeDataSource employeeDataSource;
  @override
  void initState() {
    // TODO: implement initState
    employees = getEmployeeData();
    employeeDataSource = EmployeeDataSource(employeeData: employees);
    super.initState();
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
                        Container(
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
            SizedBox(
              height: 10,
            ),
            SfDataGrid(
              source: employeeDataSource,
              gridLinesVisibility: GridLinesVisibility.both,
              headerGridLinesVisibility: GridLinesVisibility.both,
              columnWidthMode: ColumnWidthMode.fill,
              allowColumnsResizing: true,
              allowSorting: true,
              allowFiltering: true,
              columns: <GridColumn>[
                GridColumn(
                    columnName: 'id',
                    label: Container(
                        padding: EdgeInsets.all(16.0),
                        alignment: Alignment.center,
                        color: backgroundColor,
                        child: Text(
                          'Patient ID',
                        ))),
                GridColumn(
                    columnName: 'name',
                    label: Container(
                        padding: EdgeInsets.all(8.0),
                        alignment: Alignment.center,
                        color: backgroundColor,
                        child: Text('Appt No'))),
                GridColumn(
                    columnName: 'designation',
                    label: Container(
                        padding: EdgeInsets.all(8.0),
                        alignment: Alignment.center,
                        color: backgroundColor,
                        child: Text(
                          'Appt Date ',
                          overflow: TextOverflow.ellipsis,
                        ))),
                GridColumn(
                    columnName: 'salary',
                    label: Container(
                        padding: EdgeInsets.all(8.0),
                        color: backgroundColor,
                        alignment: Alignment.center,
                        child: Text('Phone'))),
                GridColumn(
                    columnName: 'salary',
                    label: Container(
                        padding: EdgeInsets.all(8.0),
                        color: backgroundColor,
                        alignment: Alignment.center,
                        child: Text('doctor'))),
                GridColumn(
                    columnName: 'source',
                    label: Container(
                        padding: EdgeInsets.all(8.0),
                        color: backgroundColor,
                        alignment: Alignment.center,
                        child: Text('Source'))),
                GridColumn(
                    columnName: 'status',
                    label: Container(
                        padding: EdgeInsets.all(8.0),
                        color: backgroundColor,
                        alignment: Alignment.center,
                        child: Text('Status'))),
              ],
            )
          ],
        ),
      ))),
    );
  }

  List<Employee> getEmployeeData() {
    return [
      Employee(10001, 'James', 'Project Lead', 20000),
      Employee(10002, 'Kathryn', 'Manager', 30000),
      Employee(10003, 'Lara', 'Developer', 15000),
      Employee(10004, 'Michael', 'Designer', 15000),
      Employee(10005, 'Martin', 'Developer', 15000),
      Employee(10006, 'Newberry', 'Developer', 15000),
      Employee(10007, 'Balnc', 'Developer', 15000),
      Employee(10008, 'Perry', 'Developer', 15000),
      Employee(10009, 'Gable', 'Developer', 15000),
      Employee(10010, 'Grimes', 'Developer', 15000)
    ];
  }
}

/// Custom business object class which contains properties to hold the detailed
/// information about the employee which will be rendered in datagrid.
class Employee {
  /// Creates the employee class with required details.
  Employee(this.id, this.name, this.designation, this.salary);

  /// Id of an employee.
  final int id;

  /// Name of an employee.
  final String name;

  /// Designation of an employee.
  final String designation;

  /// Salary of an employee.
  final int salary;
}

/// An object to set the employee collection data source to the datagrid. This
/// is used to map the employee data to the datagrid widget.
class EmployeeDataSource extends DataGridSource {
  /// Creates the employee data source class with required details.
  EmployeeDataSource({required List<Employee> employeeData}) {
    _employeeData = employeeData
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<int>(columnName: 'id', value: e.id),
              DataGridCell<String>(columnName: 'name', value: e.name),
              DataGridCell<String>(
                  columnName: 'designation', value: e.designation),
              DataGridCell<int>(columnName: 'salary', value: e.salary),
              DataGridCell<String>(columnName: 'doctor', value: e.name),
              DataGridCell<String>(columnName: 'source', value: e.designation),
              DataGridCell<int>(columnName: 'status', value: e.id),
            ]))
        .toList();
  }

  List<DataGridRow> _employeeData = [];

  @override
  List<DataGridRow> get rows => _employeeData;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
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
