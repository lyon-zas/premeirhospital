import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/colors.dart';

class ExpenseReport extends StatefulWidget {
  static const routeName = "/ExpenseReport";
  const ExpenseReport({super.key});

  @override
  State<ExpenseReport> createState() => _ExpenseReportState();
}

class _ExpenseReportState extends State<ExpenseReport> {
  List<String> timeDuration = ['All', 'This month', 'Year'];
  late dynamic _selectedTimeDuration = 'Select';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFE8E4E4),
        appBar: AppBar(
          backgroundColor: primaryColor,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(
            "Expense Report",
            style: GoogleFonts.rubik(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
          ),
        ),
        body: SingleChildScrollView(
            child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:15.0),
                child: Text(
                  "Time Duration",
                  style: GoogleFonts.rubik(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(
                height: 6,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:15.0),
                child: DropdownButtonHideUnderline(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      color: Colors.white,
                      width: MediaQuery.of(context).size.width*0.2,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal:10.0),
                        child: DropdownButton<String>(
                            hint: Text(
                              _selectedTimeDuration,
                              style: GoogleFonts.rubik(
                                  color: Color(0xFF908F8F),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400),
                            ),

                            // style: TextStyle(color: Color(0xFFD9D9D9),),

                            focusColor: Color(0xFFD9D9D9),
                            items: timeDuration.map(
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
                                  _selectedTimeDuration = val!;
                                },
                              );
                            }),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Card(
                color: Colors.white,
                elevation: 10,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 600,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,

                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal:15.0),
                          child: Text(
                            "Results",
                            style: GoogleFonts.rubik(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Table(
                            border: TableBorder
                                .all(), // Allows to add a border decoration around your table
                            children: [
                              TableRow(
                                  decoration: const BoxDecoration(
                                    color: Color(0xFFB3B3B3),
                                  ),
                                  children: [
                                    Text(
                                      'Name',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.rubik(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Text(
                                      'Invoice Number',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.rubik(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Text(
                                      'Expense Head',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.rubik(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Text(
                                      'Date',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.rubik(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Text(
                                      'Amount',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.rubik(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    
                                  ]),
                              const TableRow(
                                decoration: const BoxDecoration(
                                    color: Color(0xFFB3B3B3),
                                  ),
                                children: [
                                Text(
                                  '',
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  '',
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  '',
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  '',
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  '',
                                  textAlign: TextAlign.center,
                                ),
                                
                              ]),
                              
                            ]),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        )));
  }
}
