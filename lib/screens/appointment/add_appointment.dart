import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:premierhospitaladmin/utils/colors.dart';

class AddAppointment extends StatefulWidget {
  const AddAppointment({super.key});

  @override
  State<AddAppointment> createState() => _AddAppointmentState();
}

class _AddAppointmentState extends State<AddAppointment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: primaryColor,
          title: Text("Calender",
              style: GoogleFonts.rubik(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w400)),
          centerTitle: true,
        ),

        body: Column(
          
        ),
    );
  }
}