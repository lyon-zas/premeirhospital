import 'package:flutter/material.dart';
import 'package:premierhospitaladmin/screens/Resources/asign_role.dart';
import 'package:premierhospitaladmin/screens/report/financial_report.dart';

import '../../utils/colors.dart';

class Recources extends StatelessWidget {
  const Recources({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, bottom: 20),
                    child: Card(
                      color: const Color(0xFFE8E4E4),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                color: primaryColor,
                                height: 45,
                                width: MediaQuery.of(context).size.width / 6,
                                child: Center(
                                  child: ListTile(
                                    // selected: selectedIndex == 1,
                                    iconColor: Colors.white,
                                    title: const Text("Roles and User Groups",
                                        style: TextStyle(
                                          color: Colors.white,
                                        )),
                                    onTap: () {
                                      // Navigator.pushNamed(
                                      //     context, FinancialReport.routeName);
                                    },
                                  ),
                                ),
                              ),
                              Container(
                                color: primaryColor,
                                height: 45,
                                width: MediaQuery.of(context).size.width / 6,
                                child: Center(
                                  child: ListTile(
                                    // selected: selectedIndex == 1,
                                    iconColor: Colors.white,
                                    title: const Text("Assign Role",
                                        style: TextStyle(
                                          color: Colors.white,
                                        )),
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  AssignRole()));
                                    },
                                  ),
                                ),
                              ),
                              Container(
                                color: primaryColor,
                                height: 45,
                                width: MediaQuery.of(context).size.width / 6,
                                child: Center(
                                  child: ListTile(
                                    // selected: selectedIndex == 1,
                                    iconColor: Colors.white,
                                    title:
                                        const Text("Policies and permissions",
                                            style: TextStyle(
                                              color: Colors.white,
                                            )),
                                    onTap: () {
                                      // Navigator.pushNamed(
                                      //     context, FinancialReport.routeName);
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            color: primaryColor,
                            height: 45,
                            width: MediaQuery.of(context).size.width / 4,
                            child: Center(
                              child: ListTile(
                                // selected: selectedIndex == 1,
                                iconColor: Colors.white,
                                title:
                                    const Text("Roles and User Groups Portal",
                                        style: TextStyle(
                                          color: Colors.white,
                                        )),
                                onTap: () {
                                  // Navigator.pushNamed(
                                  //     context, FinancialReport.routeName);
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Card(
                    color: Color(0xFFE8E4E4),
                    child: Container(
                      height: MediaQuery.of(context).size.height / 1.5,
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              color: Color(0xFFD9D9D9),
                              height: 45,
                              width: MediaQuery.of(context).size.width / 7,
                              child: Center(
                                child: ListTile(
                                  // selected: selectedIndex == 1,
                                  // iconColor: Colors.white,
                                  title: const Text("CREATE NEW ROLE",
                                      style: TextStyle(
                                        color: Colors.black,
                                      )),
                                  onTap: () {
                                    // Navigator.pushNamed(
                                    //     context, FinancialReport.routeName);
                                  },
                                ),
                              ),
                            ),
                            Container(
                              color: Color(0xFFD9D9D9),
                              height: 45,
                              width: MediaQuery.of(context).size.width / 7,
                              child: Center(
                                child: ListTile(
                                  // selected: selectedIndex == 1,
                                  // iconColor: Colors.white,
                                  title: const Text("EDIT EXISTING ROLE",
                                      style: TextStyle(
                                        color: Colors.black,
                                      )),
                                  onTap: () {
                                    // Navigator.pushNamed(
                                    //     context, FinancialReport.routeName);
                                  },
                                ),
                              ),
                            ),
                            Container(
                              color: Color(0xFFD9D9D9),
                              height: 45,
                              width: MediaQuery.of(context).size.width / 7,
                              child: Center(
                                child: ListTile(
                                  // selected: selectedIndex == 1,
                                  // iconColor: Colors.white,
                                  title: const Text("DELETE ROLE",
                                      style: TextStyle(
                                        color: Colors.black,
                                      )),
                                  onTap: () {
                                    // Navigator.pushNamed(
                                    //     context, FinancialReport.routeName);
                                  },
                                ),
                              ),
                            ),
                            Container(
                              color: Color(0xFFD9D9D9),
                              height: 45,
                              width: MediaQuery.of(context).size.width / 7,
                              child: Center(
                                child: ListTile(
                                  // selected: selectedIndex == 1,
                                  // iconColor: Colors.white,
                                  title: const Text("CREATE USER GROUP",
                                      style: TextStyle(
                                        color: Colors.black,
                                      )),
                                  onTap: () {
                                    // Navigator.pushNamed(
                                    //     context, FinancialReport.routeName);
                                  },
                                ),
                              ),
                            ),
                            Container(
                              color: Color(0xFFD9D9D9),
                              height: 45,
                              width: MediaQuery.of(context).size.width / 8,
                              child: Center(
                                child: ListTile(
                                  // selected: selectedIndex == 1,
                                  // iconColor: Colors.white,
                                  title: const Text("MANAGE USER GROUP",
                                      style: TextStyle(
                                        color: Colors.black,
                                      )),
                                  onTap: () {
                                    // Navigator.pushNamed(
                                    //     context, FinancialReport.routeName);
                                  },
                                ),
                              ),
                            ),
                            Container(
                              color: Color(0xFFD9D9D9),
                              height: 45,
                              width: MediaQuery.of(context).size.width / 7,
                              child: Center(
                                child: ListTile(
                                  // selected: selectedIndex == 1,
                                  // iconColor: Colors.white,
                                  title: const Text("ADD/REMOVE USER",
                                      style: TextStyle(
                                        color: Colors.black,
                                      )),
                                  onTap: () {
                                    // Navigator.pushNamed(
                                    //     context, FinancialReport.routeName);
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
