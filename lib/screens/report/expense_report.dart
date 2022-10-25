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
    );
  }
}
