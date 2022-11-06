import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:premierhospitaladmin/utils/colors.dart';

import '../../firebase_resources/firebase_methods.dart';

class AddAppointment extends StatefulWidget {
  static const routeName = "/addAppoinment";
  const AddAppointment({super.key});

  @override
  State<AddAppointment> createState() => _AddAppointmentState();
}

class _AddAppointmentState extends State<AddAppointment> {
  late String _appointmentType = '';
  late String _doctor = '';
  late String _shift = "";
  late String _slot = "";
  late String _appoinmentPriority = '';
  late String _paymentMode = "";
  final TextEditingController _patientId = TextEditingController();
  final TextEditingController _address = TextEditingController();
  final TextEditingController date = TextEditingController();
  late String _date = "";
  final TextEditingController _phone = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  bool _isLoading = false;

  late DateTime _selectedDate;

  addAppint() async {
    setState(() {
      _isLoading = true;
    });

    await FirestoreMethods().addAppoinment(_date, _doctor, _patientId.text,
        _slot, _phone.text, _paymentMode, _appointmentType, context);

    var fromDates = DateFormat('dd/MM/yyyy HH:mm:ss').format(_selectedDate);
    var toDates = DateFormat('dd/MM/yyyy HH:mm:ss').format(_selectedDate);
    await _firestore.collection("CalendarAppointmentCollection").doc().set({
      'Subject': "Consultation with $_doctor",
      'StartTime': fromDates,
      'EndTime': toDates,
      'description': _appointmentType,
    });
    setState(() {
      _isLoading = false;
      _date = '';
      _address.clear();
      _doctor = '';
      _appoinmentPriority = '';
      _appointmentType = '';
      _patientId.clear();
      _paymentMode = '';
      _shift = '';
      _phone.clear();
      _slot;
    });
    Navigator.pop(context);
  }

  //Method for showing the date picker
  void _pickDateDialog() {
    
    showDatePicker(
      
            context: context,
            initialDate: DateTime.now(),
            
            firstDate: DateTime(1950),
            
            // locale: Locale,
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
        _date = DateFormat('dd/MM/yyyy HH:mm').format(pickedDate);
        date.text = _date;
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
                              controller: date,
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
                                  minWidth:
                                      MediaQuery.of(context).size.width / 5.5,
                                  maxHeight: 100),
                              child: DropdownButtonHideUnderline(
                                child: Container(
                                  color: Color(0xFFD9D9D9),
                                  child: DropdownButton<String>(
                                      hint: Text(
                                        _appointmentType,
                                        style: GoogleFonts.rubik(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w400),
                                      ),

                                      // style: TextStyle(color: Color(0xFFD9D9D9),),

                                      focusColor: Color(0xFFD9D9D9),
                                      items: [
                                        'Inperson',
                                        'Online',
                                      ].map(
                                        (val) {
                                          return DropdownMenuItem<String>(
                                            value: val,
                                            child: Text(val),
                                          );
                                        },
                                      ).toList(),
                                      onChanged: (val) {
                                        setState(
                                          () {
                                            _appointmentType = val!;
                                          },
                                        );
                                      }),
                                ),
                              )),
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
                                  minWidth:
                                      MediaQuery.of(context).size.width / 5.5,
                                  maxHeight: 100),
                              child: DropdownButtonHideUnderline(
                                child: Container(
                                  color: Color(0xFFD9D9D9),
                                  child: DropdownButton<String>(
                                      hint: Text(
                                        _doctor,
                                        style: GoogleFonts.rubik(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w400),
                                      ),

                                      // style: TextStyle(color: Color(0xFFD9D9D9),),

                                      focusColor: Color(0xFFD9D9D9),
                                      items:
                                          ['Dr Cal', 'Dr Smith', 'Dr John'].map(
                                        (val) {
                                          return DropdownMenuItem<String>(
                                            value: val,
                                            child: Text(val),
                                          );
                                        },
                                      ).toList(),
                                      onChanged: (val) {
                                        setState(
                                          () {
                                            _doctor = val!;
                                          },
                                        );
                                      }),
                                ),
                              )),
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
                                  minWidth:
                                      MediaQuery.of(context).size.width / 5.5,
                                  maxHeight: 100),
                              child: DropdownButtonHideUnderline(
                                child: Container(
                                  color: Color(0xFFD9D9D9),
                                  child: DropdownButton<String>(
                                      hint: Text(
                                        _shift,
                                        style: GoogleFonts.rubik(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w400),
                                      ),

                                      // style: TextStyle(color: Color(0xFFD9D9D9),),

                                      focusColor: Color(0xFFD9D9D9),
                                      items: [
                                        'Morning 8am-4pm',
                                        'Evening 4pm-8pm',
                                        'Other'
                                      ].map(
                                        (val) {
                                          return DropdownMenuItem<String>(
                                            value: val,
                                            child: Text(val),
                                          );
                                        },
                                      ).toList(),
                                      onChanged: (val) {
                                        setState(
                                          () {
                                            _shift = val!;
                                          },
                                        );
                                      }),
                                ),
                              )),
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
                                  minWidth:
                                      MediaQuery.of(context).size.width / 5.5,
                                  maxHeight: 100),
                              child: DropdownButtonHideUnderline(
                                child: Container(
                                  color: Color(0xFFD9D9D9),
                                  child: DropdownButton<String>(
                                      hint: Text(
                                        _slot,
                                        style: GoogleFonts.rubik(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w400),
                                      ),

                                      // style: TextStyle(color: Color(0xFFD9D9D9),),

                                      focusColor: Color(0xFFD9D9D9),
                                      items: [
                                        '8am-9am',
                                        '9am-10am',
                                        '10am-11am',
                                        '12pm-1pm',
                                        '1pm-2pm',
                                        '2pm-3pm',
                                        '4pm-5pm',
                                        '5pm-6pm',
                                        '7pm-8pm',
                                        '8pm-9pm',
                                      ].map(
                                        (val) {
                                          return DropdownMenuItem<String>(
                                            value: val,
                                            child: Text(val),
                                          );
                                        },
                                      ).toList(),
                                      onChanged: (val) {
                                        setState(
                                          () {
                                            _slot = val!;
                                          },
                                        );
                                      }),
                                ),
                              )),
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
                                  minWidth:
                                      MediaQuery.of(context).size.width / 5.5,
                                  maxHeight: 100),
                              child: DropdownButtonHideUnderline(
                                child: Container(
                                  color: Color(0xFFD9D9D9),
                                  child: DropdownButton<String>(
                                      hint: Text(
                                        _appoinmentPriority,
                                        style: GoogleFonts.rubik(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w400),
                                      ),

                                      // style: TextStyle(color: Color(0xFFD9D9D9),),

                                      focusColor: Color(0xFFD9D9D9),
                                      items: [
                                        'Normal',
                                        'Urgent',
                                        'Emergency',
                                        'Low'
                                      ].map(
                                        (val) {
                                          return DropdownMenuItem<String>(
                                            value: val,
                                            child: Text(val),
                                          );
                                        },
                                      ).toList(),
                                      onChanged: (val) {
                                        setState(
                                          () {
                                            _appoinmentPriority = val!;
                                          },
                                        );
                                      }),
                                ),
                              )),
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
                                  minWidth:
                                      MediaQuery.of(context).size.width / 5.5,
                                  maxHeight: 100),
                              child: DropdownButtonHideUnderline(
                                child: Container(
                                  color: Color(0xFFD9D9D9),
                                  child: DropdownButton<String>(
                                      hint: Text(
                                        _paymentMode,
                                        style: GoogleFonts.rubik(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w400),
                                      ),

                                      // style: TextStyle(color: Color(0xFFD9D9D9),),

                                      focusColor: Color(0xFFD9D9D9),
                                      items:
                                          ['Cash', 'Bank Transfer', 'Card'].map(
                                        (val) {
                                          return DropdownMenuItem<String>(
                                            value: val,
                                            child: Text(val),
                                          );
                                        },
                                      ).toList(),
                                      onChanged: (val) {
                                        setState(
                                          () {
                                            _paymentMode = val!;
                                          },
                                        );
                                      }),
                                ),
                              )),
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
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
                                maxWidth:
                                    MediaQuery.of(context).size.width / 3.5,
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
                      Row(
                        children: [
                          Text(
                            "Consultation Fee:",
                            style: GoogleFonts.rubik(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            color: Color(0xFFD9D9D9),
                            constraints: BoxConstraints(
                                minWidth:
                                    MediaQuery.of(context).size.width / 5.8,
                                minHeight: 40),
                            child: Center(
                              child: Text(
                                "100",
                                style: GoogleFonts.rubik(
                                    color: Color.fromARGB(255, 51, 50, 50),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            // child: TextField(
                            //   keyboardType: TextInputType.emailAddress,
                            //   cursorColor: Colors.black,
                            //   // controller: _address,

                            //   style: const TextStyle(
                            //       color: Colors.black,
                            //       fontSize: 20,
                            //       fontWeight: FontWeight.w400),
                            //   decoration: InputDecoration(
                            //     fillColor: Color(0xFFD9D9D9),
                            //     filled: true,
                            //     hintText: "100",
                            //     focusColor: Colors.grey,
                            //     border: InputBorder.none,
                            //     hintStyle: GoogleFonts.rubik(
                            //         color: Colors.grey,
                            //         fontSize: 20,
                            //         fontWeight: FontWeight.w400),
                            //   ),
                            // ),
                          ),
                        ],
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
