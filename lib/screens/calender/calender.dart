import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:premierhospitaladmin/utils/colors.dart';
import 'package:table_calendar/table_calendar.dart';

class Calender extends StatelessWidget {
  const Calender({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        TableCalendar(
          firstDay: DateTime.utc(2010, 10, 16),
          lastDay: DateTime.utc(2030, 3, 14),
          focusedDay: DateTime.now(),
        )
      ],
    ));
  }
}
