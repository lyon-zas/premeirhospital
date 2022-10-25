import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/single_child_widget.dart';

import '../../utils/colors.dart';

class UsageReport extends StatefulWidget {
  static const routeName = "/UsageReport";
  const UsageReport({super.key});

  @override
  State<UsageReport> createState() => _UsageReportState();
}

class _UsageReportState extends State<UsageReport> {
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
          "Usage Report",
          style: GoogleFonts.rubik(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
        ),
      ),
      body: SingleChildScrollView(
          child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Card(
            elevation: 5,
            color: Colors.white,
            child: Container(
              height: 400,
              padding: const EdgeInsets.all(25.0),
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
                            'Role',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.rubik(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            'Online',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.rubik(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            'Last time Active',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.rubik(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            'Last 24h',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.rubik(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            'Prev week',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.rubik(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            'Last month',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.rubik(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w700),
                          ),
                        ]),
                    const TableRow(children: [
                      Text(
                        'Admin',
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        'Super Admin',
                        textAlign: TextAlign.center,
                      ),
                      Center(
                        child: CircleAvatar(
                          radius: 4,
                          foregroundColor: Colors.green,
                          backgroundColor: Colors.green,
                        ),
                      ),
                      Text(
                        '25/9/2022 04:35',
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        '1:10',
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        '1:10',
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        '1:10',
                        textAlign: TextAlign.center,
                      ),
                    ]),
                    // const TableRow(children: [
                    //   Text('Unconfirmed'),
                    //   Text('1:10'),
                    //   Text('1:10'),
                    //   Text('1:10'),
                    // ]),
                    // const TableRow(children: [
                    //   Text('Confirmed'),
                    //   Text('4'),
                    //   Text('6'),
                    //   Text('10'),
                    // ]),
                    // const TableRow(children: [
                    //   Text('Completed'),
                    //   Text('3'),
                    //   Text('7'),
                    //   Text('10'),
                    // ]),
                    // const TableRow(children: [
                    //   Text('Cancelled'),
                    //   Text('3'),
                    //   Text('0'),
                    //   Text('3'),
                    // ]),
                  ]),
            ),
          ),
        ),
      )),
    );
  }
}
