import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../firebase_resources/firebase_methods.dart';
import '../../utils/colors.dart';
import '../HomePage/home_screen.dart';

class VendorForm extends StatefulWidget {
  const VendorForm({super.key});

  @override
  State<VendorForm> createState() => _VendorFormState();
}

class _VendorFormState extends State<VendorForm> {
  final TextEditingController _companyName = TextEditingController();
  final TextEditingController _contactPerson = TextEditingController();
  final TextEditingController _companywebsite = TextEditingController();
  final TextEditingController _email = TextEditingController();
  late String _date = "";
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _vendorCategory = TextEditingController();

  bool _isLoading = false;

  add() async {
    setState(() {
      _isLoading = true;
    });

    await FirestoreMethods().addVendor(
        _companyName.text,
        _contactPerson.text,
        _phone.text,
        _email.text,
        _companywebsite.text,
        _vendorCategory.text,
        context);
    setState(() {
      _isLoading = false;
      _date = '';
      _email.clear();

      _phone.clear();
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFE8E4E4),
        appBar: AppBar(
          backgroundColor: primaryColor,
          centerTitle: false,
          title: Text(
            "CREATE NEW VENDOR",
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
                child: Column(children: [
          Card(
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
                              Column(
                                children: [
                                  Text(
                                    "COMPANY NAME",
                                    style: GoogleFonts.rubik(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    constraints: BoxConstraints(
                                        maxWidth:
                                            MediaQuery.of(context).size.width /
                                                3.5,
                                        maxHeight: 100),
                                    child: TextField(
                                      keyboardType: TextInputType.name,
                                      cursorColor: Colors.black,
                                      controller: _companyName,
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
                              Column(
                                children: [
                                  Text(
                                    "CONTACT PERSON",
                                    style: GoogleFonts.rubik(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    constraints: BoxConstraints(
                                        maxWidth:
                                            MediaQuery.of(context).size.width /
                                                3.5,
                                        maxHeight: 100),
                                    child: TextField(
                                      keyboardType: TextInputType.name,
                                      cursorColor: Colors.black,
                                      controller: _contactPerson,
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
                              Column(
                                children: [
                                  Text(
                                    "PHONE NUMBER",
                                    style: GoogleFonts.rubik(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    constraints: BoxConstraints(
                                        maxWidth:
                                            MediaQuery.of(context).size.width /
                                                3.5,
                                        maxHeight: 100),
                                    child: TextField(
                                      keyboardType: TextInputType.name,
                                      cursorColor: Colors.black,
                                      controller: _phone,
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
                              Column(
                                children: [
                                  Text(
                                    "EMAIL",
                                    style: GoogleFonts.rubik(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    constraints: BoxConstraints(
                                        maxWidth:
                                            MediaQuery.of(context).size.width /
                                                3.5,
                                        maxHeight: 100),
                                    child: TextField(
                                      keyboardType: TextInputType.name,
                                      cursorColor: Colors.black,
                                      controller: _email,
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
                              Column(
                                children: [
                                  Text(
                                    "COMPANY WEBSITE",
                                    style: GoogleFonts.rubik(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    constraints: BoxConstraints(
                                        maxWidth:
                                            MediaQuery.of(context).size.width /
                                                3.5,
                                        maxHeight: 100),
                                    child: TextField(
                                      keyboardType: TextInputType.emailAddress,
                                      cursorColor: Colors.black,
                                      controller: _companywebsite,
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
                              Column(
                                children: [
                                  Text(
                                    "VENDOR CATEGORY",
                                    style: GoogleFonts.rubik(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    constraints: BoxConstraints(
                                        maxWidth:
                                            MediaQuery.of(context).size.width /
                                                3.5,
                                        maxHeight: 100),
                                    child: TextField(
                                      keyboardType: TextInputType.phone,
                                      cursorColor: Colors.black,
                                      controller: _vendorCategory,
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
                                  width:
                                      MediaQuery.of(context).size.width * 0.18,
                                  height: 50,
                                  decoration:
                                      const BoxDecoration(color: primaryColor),
                                  child: _isLoading
                                      ? const Center(
                                          child: CircularProgressIndicator(
                                              color: Colors.white,
                                              strokeWidth: 3),
                                        )
                                      : Text("Submit For Approval",
                                          style: GoogleFonts.rubik(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500,
                                          ))),
                            ),
                          ),
                        ],
                      ))))
        ]))));
  }
}
