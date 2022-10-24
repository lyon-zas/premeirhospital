import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:premierhospitaladmin/utils/colors.dart';

import '../../firebase_resources/firebase_methods.dart';

class AddAppointment extends StatefulWidget {
  static const routeName = "/addAppoinment";
  const AddAppointment({super.key});

  @override
  State<AddAppointment> createState() => _AddAppointmentState();
}

class _AddAppointmentState extends State<AddAppointment> {
  final TextEditingController _appointmentType = TextEditingController();
  final TextEditingController _doctor = TextEditingController();
  final TextEditingController _shift = TextEditingController();
  final TextEditingController _slot = TextEditingController();
  final TextEditingController _appoinmentPriority = TextEditingController();
  final TextEditingController _paymentMode = TextEditingController();
  final TextEditingController _patientId = TextEditingController();
  final TextEditingController _address = TextEditingController();
  late String _date = "";
  final TextEditingController _phone = TextEditingController();

  bool _isLoading = false;

  late DateTime _selectedDate;

  addAppint() async {
    setState(() {
      _isLoading = true;
    });

    await FirestoreMethods().addAppoinment(
        _date,
        _doctor.text,
        _patientId.text,
        _slot.text,
        _phone.text,
        _paymentMode.text,
        _appointmentType.text,
        context);
    setState(() {
      _isLoading = false;
      _date = '';
      _address.clear();
      _doctor.clear();
      _appoinmentPriority.clear();
      _appointmentType.clear();
      _patientId.clear();
      _paymentMode.clear();
      _shift.clear();
      _phone.clear();
      _slot.clear();
    });
  }

  //Method for showing the date picker
  void _pickDateDialog() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            //which date will display when user open the picker
            firstDate: DateTime(1950),

            //what will be the previous supported year in picker
            lastDate: DateTime(
                2050)) //what will be the up to supported date in picker
        .then((pickedDate) {
      //then usually do the future job
      if (pickedDate == null) {
        //if user tap cancel then this function will stop
        return;
      }
      setState(() {
        //for rebuilding the ui
        _selectedDate = pickedDate;
        _date = "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
        ;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text("Add Appoinment",
            style: GoogleFonts.rubik(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w400)),
        actions: [
          TextButton.icon(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios_rounded,
                color: Colors.white,
              ),
              label: Text(
                "back",
                style: GoogleFonts.rubik(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ))
        ],
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Card(
          elevation: 10,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 1.5,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Date:",
                            style: GoogleFonts.rubik(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            constraints: BoxConstraints(
                                maxWidth: MediaQuery.of(context).size.width / 6,
                                maxHeight: 100),
                            child: TextField(
                              keyboardType: TextInputType.datetime,
                              cursorColor: Colors.black,
                              // controller: _date,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400),
                              decoration: InputDecoration(
                                fillColor: Color(0xFFD9D9D9),
                                filled: true,

                                // label: Text(_date, style: GoogleFonts.rubik(
                                //     color: Colors.black,
                                //     fontSize: 20,
                                //     fontWeight: FontWeight.w400),),
                                focusColor: Colors.grey,
                                border: InputBorder.none,
                                hintText: _date,
                                hintStyle: GoogleFonts.rubik(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                          IconButton(
                              icon: Icon(Icons.calendar_month_rounded),
                              onPressed: _pickDateDialog)
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Appointment Type:",
                            style: GoogleFonts.rubik(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            constraints: BoxConstraints(
                                maxWidth: MediaQuery.of(context).size.width / 6,
                                maxHeight: 100),
                            child: TextField(
                              keyboardType: TextInputType.name,
                              cursorColor: Colors.black,
                              controller: _appointmentType,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400),
                              decoration: const InputDecoration(
                                fillColor: Color(0xFFD9D9D9),
                                filled: true,
                                focusColor: Colors.grey,
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Doctor:",
                            style: GoogleFonts.rubik(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            constraints: BoxConstraints(
                                maxWidth: MediaQuery.of(context).size.width / 6,
                                maxHeight: 100),
                            child: TextField(
                              keyboardType: TextInputType.emailAddress,
                              cursorColor: Colors.black,
                              controller: _doctor,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400),
                              decoration: InputDecoration(
                                fillColor: Color(0xFFD9D9D9),
                                filled: true,
                                focusColor: Colors.grey,
                                border: InputBorder.none,
                                hintStyle: GoogleFonts.rubik(
                                    color: Colors.grey,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Shifts:",
                            style: GoogleFonts.rubik(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            constraints: BoxConstraints(
                                maxWidth: MediaQuery.of(context).size.width / 6,
                                maxHeight: 100),
                            child: TextField(
                              keyboardType: TextInputType.emailAddress,
                              cursorColor: Colors.black,
                              controller: _shift,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400),
                              decoration: InputDecoration(
                                fillColor: Color(0xFFD9D9D9),
                                filled: true,
                                focusColor: Colors.grey,
                                border: InputBorder.none,
                                hintStyle: GoogleFonts.rubik(
                                    color: Colors.grey,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Slot:",
                            style: GoogleFonts.rubik(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            constraints: BoxConstraints(
                                maxWidth: MediaQuery.of(context).size.width / 6,
                                maxHeight: 100),
                            child: TextField(
                              keyboardType: TextInputType.emailAddress,
                              cursorColor: Colors.black,
                              controller: _slot,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400),
                              decoration: InputDecoration(
                                fillColor: Color(0xFFD9D9D9),
                                filled: true,
                                focusColor: Colors.grey,
                                border: InputBorder.none,
                                hintStyle: GoogleFonts.rubik(
                                    color: Colors.grey,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Appointment Priority:",
                            style: GoogleFonts.rubik(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            constraints: BoxConstraints(
                                maxWidth: MediaQuery.of(context).size.width / 6,
                                maxHeight: 100),
                            child: TextField(
                              keyboardType: TextInputType.emailAddress,
                              cursorColor: Colors.black,
                              controller: _appoinmentPriority,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400),
                              decoration: InputDecoration(
                                fillColor: Color(0xFFD9D9D9),
                                filled: true,
                                focusColor: Colors.grey,
                                border: InputBorder.none,
                                hintStyle: GoogleFonts.rubik(
                                    color: Colors.grey,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Payment Mode:",
                            style: GoogleFonts.rubik(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            constraints: BoxConstraints(
                                maxWidth: MediaQuery.of(context).size.width / 6,
                                maxHeight: 100),
                            child: TextField(
                              keyboardType: TextInputType.emailAddress,
                              cursorColor: Colors.black,
                              controller: _paymentMode,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400),
                              decoration: InputDecoration(
                                fillColor: Color(0xFFD9D9D9),
                                filled: true,
                                focusColor: Colors.grey,
                                border: InputBorder.none,
                                hintStyle: GoogleFonts.rubik(
                                    color: Colors.grey,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            "Phone",
                            style: GoogleFonts.rubik(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            constraints: BoxConstraints(
                                maxWidth: MediaQuery.of(context).size.width / 6,
                                maxHeight: 100),
                            child: TextField(
                              keyboardType: TextInputType.phone,
                              cursorColor: Colors.black,
                              controller: _phone,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400),
                              decoration: const InputDecoration(
                                fillColor: Color(0xFFD9D9D9),
                                filled: true,
                                focusColor: Colors.grey,
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Patient Id:",
                            style: GoogleFonts.rubik(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            constraints: BoxConstraints(
                                maxWidth: MediaQuery.of(context).size.width / 6,
                                maxHeight: 100),
                            child: TextField(
                              keyboardType: TextInputType.emailAddress,
                              cursorColor: Colors.black,
                              controller: _patientId,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400),
                              decoration: InputDecoration(
                                fillColor: Color(0xFFD9D9D9),
                                filled: true,
                                focusColor: Colors.grey,
                                border: InputBorder.none,
                                hintStyle: GoogleFonts.rubik(
                                    color: Colors.grey,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Alternate Address:",
                        style: GoogleFonts.rubik(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width / 3.5,
                            maxHeight: 100),
                        child: TextField(
                          keyboardType: TextInputType.emailAddress,
                          cursorColor: Colors.black,
                          controller: _address,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w400),
                          decoration: InputDecoration(
                            fillColor: Color(0xFFD9D9D9),
                            filled: true,
                            focusColor: Colors.grey,
                            border: InputBorder.none,
                            hintStyle: GoogleFonts.rubik(
                                color: Colors.grey,
                                fontSize: 20,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () => addAppint(),
                      child: Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width * 0.18,
                          height: 50,
                          decoration: const BoxDecoration(color: primaryColor),
                          child: _isLoading
                              ? const Center(
                                  child: CircularProgressIndicator(
                                      color: Colors.white, strokeWidth: 3),
                                )
                              : Text("Save",
                                  style: GoogleFonts.rubik(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ))),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
