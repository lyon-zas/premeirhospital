import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:premierhospitaladmin/utils/colors.dart';

class SideMenu extends StatelessWidget {
  final Function onIndexChanged;
  final int selectedIndex;
  SideMenu(this.onIndexChanged, this.selectedIndex);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        color: Color(0xFFE8E4E4),
        child: SingleChildScrollView(
            child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 35,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        color: selectedIndex == 0
                            ? primaryColor
                            : inactiveButtonColor,
                      ),
                      child: ListTile(
                        selected: selectedIndex == 0,
                        title: const Text("Dashboard",
                            style: TextStyle(
                              color: Colors.white,
                            )),
                        onTap: () {
                          onIndexChanged(0);
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        color: selectedIndex == 1
                            ? primaryColor
                            : inactiveButtonColor,
                      ),
                      child: ListTile(
                        selected: selectedIndex == 1,
                        title: const Text("Patient",
                            style: TextStyle(
                              color: Colors.white,
                            )),
                        onTap: () {
                          onIndexChanged(1);
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        color: selectedIndex == 2
                            ? primaryColor
                            : inactiveButtonColor,
                      ),
                      child: ListTile(
                        selected: selectedIndex == 2,
                        title: const Text("Appointment",
                            style: TextStyle(
                              color: Colors.white,
                            )),
                        onTap: () {
                          onIndexChanged(2);
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        color: selectedIndex == 3
                            ? primaryColor
                            : inactiveButtonColor,
                      ),
                      child: ListTile(
                        selected: selectedIndex == 3,
                        title: const Text("Resource",
                            style: TextStyle(
                              color: Colors.white,
                            )),
                        onTap: () {
                          onIndexChanged(3);
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        color: selectedIndex == 4
                            ? primaryColor
                            : inactiveButtonColor,
                      ),
                      child: ListTile(
                        selected: selectedIndex == 4,
                        title: const Text("Inventory",
                            style: TextStyle(
                              color: Colors.white,
                            )),
                        onTap: () {
                          onIndexChanged(4);
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        color: selectedIndex == 5
                            ? primaryColor
                            : inactiveButtonColor,
                      ),
                      child: ListTile(
                        selected: selectedIndex == 5,
                        title: const Text("Payment",
                            style: TextStyle(
                              color: Colors.white,
                            )),
                        onTap: () {
                          onIndexChanged(5);
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        color: selectedIndex == 6
                            ? primaryColor
                            : inactiveButtonColor,
                      ),
                      child: ListTile(
                        selected: selectedIndex == 6,
                        title: const Text("Report",
                            style: TextStyle(
                              color: Colors.white,
                            )),
                        onTap: () {
                          onIndexChanged(6);
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        color: selectedIndex == 7
                            ? primaryColor
                            : inactiveButtonColor,
                      ),
                      child: ListTile(
                        selected: selectedIndex == 7,
                        title: const Text("Calendar",
                            style: TextStyle(
                              color: Colors.white,
                            )),
                        onTap: () {
                          onIndexChanged(7);
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        color: selectedIndex == 8
                            ? primaryColor
                            : inactiveButtonColor,
                      ),
                      child: ListTile(
                        selected: selectedIndex == 8,
                        title: const Text("Push Notification",
                            style: TextStyle(
                              color: Colors.white,
                            )),
                        onTap: () {
                          onIndexChanged(8);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}
