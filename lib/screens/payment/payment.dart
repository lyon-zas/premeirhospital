import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:premierhospitaladmin/screens/report/financial_report.dart';

import '../../utils/colors.dart';

class Payment extends StatelessWidget {
  const Payment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: primaryColor,
          title: Text(
            "Payment",
            style: GoogleFonts.rubik(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
          ),
        ),
        body: SingleChildScrollView(
          child: SafeArea(
              child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      color: const Color(0xFFE8E4E4),
                      width: MediaQuery.of(context).size.width / 4.5,
                      height: MediaQuery.of(context).size.height / 1.5,
                      child: Card(
                        color: const Color(0xFFE8E4E4),
                        child: Column(
                          children: [
                            const Center(
                              child: ListTile(
                                tileColor: primaryColor,
                                title: Text("Cash",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                    )),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text("Invoice Number",
                                          textAlign: TextAlign.start,
                                          style: GoogleFonts.rubik(
                                              color: Colors.black,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w700)),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0, vertical: 5),
                                    child: Center(
                                      child: TextField(
                                        keyboardType: TextInputType.number,
                                        cursorColor: Colors.black,
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w400),
                                        decoration: InputDecoration(
                                          fillColor: const Color(0xFFD9D9D9),
                                          filled: true,
                                          focusColor: const Color(0xFFD9D9D9),
                                          border: InputBorder.none,
                                          hintStyle: GoogleFonts.rubik(
                                              color: const Color(0xFFD9D9D9),
                                              fontSize: 20,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text("Amount",
                                          textAlign: TextAlign.start,
                                          style: GoogleFonts.rubik(
                                              color: Colors.black,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w700)),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0, vertical: 5),
                                    child: Center(
                                      child: TextField(
                                        keyboardType: TextInputType.number,
                                        cursorColor: Colors.black,
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w400),
                                        decoration: InputDecoration(
                                          fillColor: const Color(0xFFD9D9D9),
                                          filled: true,
                                          focusColor: const Color(0xFFD9D9D9),
                                          border: InputBorder.none,
                                          hintStyle: GoogleFonts.rubik(
                                              color: const Color(0xFFD9D9D9),
                                              fontSize: 20,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      color: const Color(0xFFE8E4E4),
                      width: MediaQuery.of(context).size.width / 3,
                      height: MediaQuery.of(context).size.height / 1.4,
                      child: Card(
                        color: Color(0xFFE8E4E4),
                        child: Column(
                          children: [
                            const Center(
                              child: ListTile(
                                tileColor: primaryColor,
                                title: Text("Card Link",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                    )),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text("Card Name:",
                                  style: GoogleFonts.rubik(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700)),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 5),
                              child: TextField(
                                keyboardType: TextInputType.number,
                                cursorColor: Colors.black,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400),
                                decoration: InputDecoration(
                                  fillColor: const Color(0xFFD9D9D9),
                                  filled: true,
                                  focusColor: const Color(0xFFD9D9D9),
                                  border: InputBorder.none,
                                  hintStyle: GoogleFonts.rubik(
                                      color: const Color(0xFFD9D9D9),
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text("Card No:",
                                  style: GoogleFonts.rubik(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700)),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 5),
                              child: TextField(
                                keyboardType: TextInputType.number,
                                cursorColor: Colors.black,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400),
                                decoration: InputDecoration(
                                  fillColor: const Color(0xFFD9D9D9),
                                  filled: true,
                                  focusColor: const Color(0xFFD9D9D9),
                                  border: InputBorder.none,
                                  hintStyle: GoogleFonts.rubik(
                                      color: const Color(0xFFD9D9D9),
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text("Expiry Date:",
                                  style: GoogleFonts.rubik(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700)),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 5),
                              child: TextField(
                                keyboardType: TextInputType.number,
                                cursorColor: Colors.black,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400),
                                decoration: InputDecoration(
                                  fillColor: const Color(0xFFD9D9D9),
                                  filled: true,
                                  focusColor: const Color(0xFFD9D9D9),
                                  border: InputBorder.none,
                                  hintStyle: GoogleFonts.rubik(
                                      color: const Color(0xFFD9D9D9),
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text("CVV:",
                                  style: GoogleFonts.rubik(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700)),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 5),
                              child: TextField(
                                keyboardType: TextInputType.number,
                                cursorColor: Colors.black,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400),
                                decoration: InputDecoration(
                                  fillColor: const Color(0xFFD9D9D9),
                                  filled: true,
                                  focusColor: const Color(0xFFD9D9D9),
                                  border: InputBorder.none,
                                  hintStyle: GoogleFonts.rubik(
                                      color: const Color(0xFFD9D9D9),
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text("Billing Address:",
                                  style: GoogleFonts.rubik(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700)),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 5),
                              child: TextField(
                                keyboardType: TextInputType.number,
                                cursorColor: Colors.black,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400),
                                decoration: InputDecoration(
                                  fillColor: const Color(0xFFD9D9D9),
                                  filled: true,
                                  focusColor: const Color(0xFFD9D9D9),
                                  border: InputBorder.none,
                                  hintStyle: GoogleFonts.rubik(
                                      color: const Color(0xFFD9D9D9),
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      color: const Color(0xFFE8E4E4),
                      width: MediaQuery.of(context).size.width / 4,
                      height: MediaQuery.of(context).size.height / 1.5,
                      child: Card(
                        color: const Color(0xFFE8E4E4),
                        child: Column(
                          children: [
                            const Center(
                              child: ListTile(
                                tileColor: primaryColor,
                                title: Text("Bank Details",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                    )),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Bank Name:",
                                        style: GoogleFonts.rubik(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700)),
                                    Text("Bank of Africa \nKenya Limited",
                                        style: GoogleFonts.rubik(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700)),
                                  ],
                                )),
                            const SizedBox(
                              height: 20,
                            ),
                            Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Account Name:",
                                        style: GoogleFonts.rubik(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700)),
                                    Text("Premier \nHospital LTD",
                                        style: GoogleFonts.rubik(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700)),
                                  ],
                                )),
                            const SizedBox(
                              height: 20,
                            ),
                            Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Sort Code:",
                                        style: GoogleFonts.rubik(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700)),
                                    Text("Sort Code:",
                                        style: GoogleFonts.rubik(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700)),
                                  ],
                                )),
                            const SizedBox(
                              height: 20,
                            ),
                            Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Account No:",
                                        style: GoogleFonts.rubik(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700)),
                                    Text("020103000",
                                        style: GoogleFonts.rubik(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700)),
                                  ],
                                )),
                            const SizedBox(
                              height: 20,
                            ),
                            Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Swift Code:",
                                        style: GoogleFonts.rubik(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700)),
                                    Text("AFRIKENX",
                                        style: GoogleFonts.rubik(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700)),
                                  ],
                                )),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width / 5,
                      child: ListTile(
                        tileColor: primaryColor,
                        title: const Text("Generate Receipt",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                            )),
                        onTap: () {},
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
        ));
  }
}
