import 'dart:html' as html;
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:premierhospitaladmin/screens/Auth/login_screen.dart';
import 'package:premierhospitaladmin/screens/HomePage/home_screen.dart';
import 'package:premierhospitaladmin/utils/colors.dart';

import 'package:url_launcher/url_launcher.dart';

class ResetLink extends StatefulWidget {
  static const routeName = "/ResetLink";
  const ResetLink({super.key});

  @override
  State<ResetLink> createState() => _ResetLinkState();
}

class _ResetLinkState extends State<ResetLink> {
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
                child: Center(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 60,
                      ),
                      Text(
                        "A password reset link has been sent to your registered email address",
                        style: GoogleFonts.rubik(
                            fontSize: 25,
                            color: Colors.green,
                            fontWeight: FontWeight.w600),
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Image.asset(
                          "assets/Successful registration.png",
                          width: MediaQuery.of(context).size.width,
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Center(
                        child: GestureDetector(
                          onTap: () => Navigator.pushNamed(
                              context, LoginScreen.routeName),
                          child: Container(
                              alignment: Alignment.center,
                              width: MediaQuery.of(context).size.width * 0.18,
                              height: 50,
                              decoration:
                                  const BoxDecoration(color: primaryColor),
                              child: Text("Go to Login page",
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
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
