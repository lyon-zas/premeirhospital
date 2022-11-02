import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:premierhospitaladmin/screens/appointment/appoinment.dart';
import 'package:premierhospitaladmin/screens/calender/add_event.dart';
import 'package:premierhospitaladmin/utils/colors.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class Calender extends StatelessWidget {
  const Calender({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.black,
        body: Column(
          children: [
            AppBar(
              backgroundColor: primaryColor,
              title: Text("Calender",
                  style: GoogleFonts.rubik(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w400)),
              centerTitle: false,
            ),
            SizedBox(
              height: 10,
            ),
            SfCalendar(
              view: CalendarView.month,
              initialSelectedDate: DateTime.now(),
              dataSource: _getCalendarDataSource(),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => AddEventPage())),
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          backgroundColor: primaryColor,
        ));
  }
}

_AppointmentDataSource _getCalendarDataSource() {
  List<Appointment> appointments = <Appointment>[];
  final DateTime today = DateTime.now();
  final DateTime startTime =
      DateTime(today.year, today.month, today.day, 9, 0, 0);
  final DateTime endTime = startTime.add(const Duration(hours: 2));

  appointments.add(Appointment(
      startTime: startTime,
      endTime: endTime,
      subject: "consultation",
      color: Colors.blue));

  return _AppointmentDataSource(appointments);
}

class _AppointmentDataSource extends CalendarDataSource {
  _AppointmentDataSource(List<Appointment> source) {
    appointments = source;
  }
}
