import 'dart:html' as html;
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:premierhospitaladmin/screens/Auth/forgot_password.dart';
import 'package:premierhospitaladmin/screens/HomePage/home_screen.dart';
import 'package:premierhospitaladmin/utils/colors.dart';
import 'package:premierhospitaladmin/utils/utils.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../firebase_resources/auth_method.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = "/login";
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool value = false;
  final AuthMethods _authMethods = AuthMethods();
  bool _isLoading = false;

  loginUser() async {
    setState(() {
      _isLoading = true;
    });
    bool res = await _authMethods.loginUser(
      context,
      _emailController.text,
      _passwordController.text,
    );
    setState(() {
      _isLoading = false;
    });
    if (res) {
      Navigator.pushReplacementNamed(context, HomePage.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.white, Color(0xFFE8E4E4)])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                flex: 5,
                child: Row(
                  children: [
                    Expanded(
                        child: Column(
                      children: [
                        SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Image.asset(
                              "assets/Premier Hospital Logo 2.png",
                              height: MediaQuery.of(context).size.height / 3.7,
                              // width: MediaQuery.of(context).size.width,
                            )),
                        SizedBox(
                            child: Image.asset(
                          "assets/image 51.png",
                          height: MediaQuery.of(context).size.height / 1.65,
                          width: MediaQuery.of(context).size.width,
                        )),
                      ],
                    )),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 100,
                          ),
                          Container(
                            child: Column(
                              children: [
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Admin ID",
                                      style: GoogleFonts.rubik(
                                          fontSize: 18,
                                          color: Color(0xFF4D5959),
                                          fontWeight: FontWeight.w500),
                                      textAlign: TextAlign.start,
                                    )),
                                SizedBox(
                                  height: 8,
                                ),
                                Center(
                                  child: TextField(
                                    keyboardType: TextInputType.emailAddress,
                                    cursorColor: Colors.black,
                                    controller: _emailController,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400),
                                    decoration: InputDecoration(
                                      hintText: "Admin ID",
                                      // labelText: "Admin ID",
                                      fillColor: Color(0xFFEFF0F2),
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
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Container(
                            height: 35,
                            child: Center(
                              child: TextField(
                                keyboardType: TextInputType.visiblePassword,
                                cursorColor: Colors.black,
                                controller: _passwordController,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400),
                                decoration: InputDecoration(
                                  hintText: "Enter your Password",
                                  // labelText: "Enter your Password",
                                  fillColor: Color(0xFFEFF0F2),
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
                          ),
                          const SizedBox(
                            height: 100,
                          ),
                          Center(
                            child: GestureDetector(
                              onTap: () => loginUser(),
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
                                      : Text("Sign In",
                                          style: GoogleFonts.rubik(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500,
                                          ))),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Center(
                            child: InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, ForgotPassword.routeName);
                              },
                              child: Text(
                                "Forgot password ?",
                                textAlign: TextAlign.start,
                                style: GoogleFonts.rubik(
                                  fontSize: 18,
                                  color: Color(0xFF4D5959),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ))
                  ],
                ),
              ),
              Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.04,
                    color: primaryColor,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        onTap: () {
                          html.window.open(
                              'https://www.premierhospital.org/', "_blank");
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text("Premier Hospital Website",
                              style: GoogleFonts.rubik(
                                  decoration: TextDecoration.underline,
                                  color: Colors.white)),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.08,
                    color: secondaryColor,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

final Uri _url = Uri.parse('https://flutter.dev');
Future<void> _launchUrl() async {
  if (!await launchUrl(_url)) {
    throw 'Could not launch $_url';
  }
}
