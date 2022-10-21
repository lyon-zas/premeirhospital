import 'package:flutter/material.dart';
import 'package:premierhospitaladmin/screens/HomePage/Dashboard/dashboard.dart';
import 'package:premierhospitaladmin/screens/HomePage/header.dart';
import 'package:premierhospitaladmin/screens/Inventory/inventory.dart';
import 'package:premierhospitaladmin/screens/appointment/appoinment.dart';
import 'package:premierhospitaladmin/screens/calender/calender.dart';
import 'package:premierhospitaladmin/screens/patient/patient.dart';
import 'package:premierhospitaladmin/screens/payment/payment.dart';
import 'package:premierhospitaladmin/screens/report/report.dart';
import 'package:provider/provider.dart';

import '../../controllers/controller.dart';
import '../../responsive.dart';
import '../Resources/recources.dart';
import 'components/sidemenu.dart';

class HomePage extends StatefulWidget {
  static const routeName = "/homepage";
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Header(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen
            if (Responsive.isDesktop(context))
              Expanded(
                  flex: 1,
                  child: SideMenu((int index) {
                    setState(() {
                      selectedIndex = index;
                    });
                  }, selectedIndex)),

            Expanded(
                // It takes 5/6 part of the screen
                flex: 5,
                child: Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height,
                    // color: Colors.black,
                    child: Builder(builder: (context) {
                      if (selectedIndex == 0) {
                        return const DashBoard();
                      }
                      if (selectedIndex == 1) {
                        return const Patient();
                      }
                      if (selectedIndex == 2) {
                        return const Appointment();
                      }
                      if (selectedIndex == 3) {
                        return const Recources();
                      }
                      if (selectedIndex == 4) {
                        return const Inventory();
                      }
                      if (selectedIndex == 5) {
                        return const Payment();
                      }
                      if (selectedIndex == 6) {
                        return const Report();
                      }
                      if (selectedIndex == 7) {
                        return const Calender();
                      }
                      if (selectedIndex == 8) {
                        return Container();
                      }
                      return Container();
                    }))),
          ],
        ),
      ),
    );
  }
}
