import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../firebase_resources/auth_method.dart';
import '../../firebase_resources/firebase_methods.dart';
import '../../utils/colors.dart';
import '../HomePage/home_screen.dart';

class CreateNewAdmin extends StatefulWidget {
  const CreateNewAdmin({super.key});

  @override
  State<CreateNewAdmin> createState() => _CreateNewAdminState();
}

class _CreateNewAdminState extends State<CreateNewAdmin> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _password = TextEditingController();

  final TextEditingController _email = TextEditingController();

  final TextEditingController _phone = TextEditingController();
  add() async {
    setState(() {
      _isLoading = true;
    });

    await AuthMethods().signUpUser(
      context,
      _email.text,
      _name.text,
      _password.text,
      _phone.text,
    );
    setState(() {
      _isLoading = false;
      _name.clear();
      _email.clear();
      _password.clear();
      _phone.clear();
    });
    Navigator.pop(context);
  }

  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8E4E4),
      appBar: AppBar(
        backgroundColor: primaryColor,
        centerTitle: false,
        title: Text(
          "ADD NEW USER",
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
                                  "ADMIN ID",
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
                                  "ADMIN NAME",
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
                                    controller: _name,
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
                                  "PASSWORD",
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
                                    controller: _password,
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
                        Center(
                          child: GestureDetector(
                            onTap: () => add(),
                            child: Container(
                                alignment: Alignment.center,
                                width: MediaQuery.of(context).size.width * 0.18,
                                height: 50,
                                decoration:
                                    const BoxDecoration(color: primaryColor),
                                child: _isLoading
                                    ? const Center(
                                        child: CircularProgressIndicator(
                                            color: Colors.white,
                                            strokeWidth: 3),
                                      )
                                    : Text("ADD",
                                        style: GoogleFonts.rubik(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                        ))),
                          ),
                        ),
                      ],
                    ))))
      ]))),
    );
  }
}
