import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../firebase_resources/firebase_methods.dart';
import '../../utils/colors.dart';

class Queue extends StatefulWidget {
  static const routeName = "/queue";
  const Queue({super.key});

  @override
  State<Queue> createState() => _QueueState();
}

class _QueueState extends State<Queue> {
  final _formKey = GlobalKey<FormBuilderState>();
  // final _emailFieldKey = GlobalKey<FormBuilderFieldState>();
  // final _phonenumberkey = GlobalKey<FormBuilderFieldState>();
  final TextEditingController _phonenumberkey = TextEditingController();
  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _email = TextEditingController();
  late String _date = "";
  final TextEditingController _phone = TextEditingController();
  List<String> genderOptions = ['Male', 'Female', 'Other'];
  late String _emailError;

  bool _isLoading = false;
  late String _selectedgender = '';
  late DateTime _selectedDate;

  add() async {
    setState(() {
      _isLoading = true;
    });

    await FirestoreMethods().addPatient(_date, _email.text, _firstName.text,
        _lastName.text, _selectedgender, _phone.text, context);
    setState(() {
      _isLoading = false;
      _date = '';
      _email.clear();
      _firstName.clear();
      _lastName.clear();
      _selectedgender = '';
      _phone.clear();
    });
  }

  //Method for showing the date picker
  void _pickDateDialog() {
    showDatePicker(
            context: context,
            initialDate: DateTime(2014),
            //which date will display when user open the picker
            firstDate: DateTime(1950),

            //what will be the previous supported year in picker
            lastDate: DateTime
                .now()) //what will be the up to supported date in picker
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
        title: Text("Queue",
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Text(
                            "First Name:",
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
                              keyboardType: TextInputType.name,
                              cursorColor: Colors.black,
                              controller: _firstName,
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
                            "Last Name:",
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
                              keyboardType: TextInputType.name,
                              cursorColor: Colors.black,
                              controller: _lastName,
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
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Date of Birth:",
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
                      SizedBox(
                        width: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            "Gender:",
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
                                      MediaQuery.of(context).size.width / 3.5,
                                  maxHeight: 100),
                              child: DropdownButtonHideUnderline(
                                child: Container(
                                  color: Color(0xFFD9D9D9),
                                  child: DropdownButton<String>(
                                      hint: Text(
                                        _selectedgender,
                                        style: GoogleFonts.rubik(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w400),
                                      ),

                                      // style: TextStyle(color: Color(0xFFD9D9D9),),

                                      focusColor: Color(0xFFD9D9D9),
                                      items: ['Male', 'Female', 'Other'].map(
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
                                            _selectedgender = val!;
                                          },
                                        );
                                      }),
                                ),
                              )),
                        ],
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Email:",
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
                              controller: _email,
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
                                maxWidth:
                                    MediaQuery.of(context).size.width / 3.5,
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
                      )
                    ],
                  ),
                  Center(
                    child: GestureDetector(
                      onTap: () => add(),
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
                              : Text("Submit",
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
