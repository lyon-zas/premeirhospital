import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class AssignRole extends StatefulWidget {
  const AssignRole({super.key});

  @override
  State<AssignRole> createState() => _AssignRoleState();
}

class _AssignRoleState extends State<AssignRole> {
  final TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(children: [
        Container(
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    color: primaryColor,
                    height: 45,
                    width: MediaQuery.of(context).size.width / 9,
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
                    width: MediaQuery.of(context).size.width / 9,
                    child: Center(
                      child: ListTile(
                        // selected: selectedIndex == 1,
                        iconColor: Colors.white,
                        title: const Text("Assign Role",
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
                    width: MediaQuery.of(context).size.width / 9,
                    child: Center(
                      child: ListTile(
                        // selected: selectedIndex == 1,
                        iconColor: Colors.white,
                        title: const Text("Policies and permissions",
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
              Container(
                color: primaryColor,
                height: 45,
                width: MediaQuery.of(context).size.width / 9,
                child: Center(
                  child: ListTile(
                    // selected: selectedIndex == 1,
                    iconColor: Colors.white,
                    title: const Text("ASSIGN ROLE PORTAL",
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
        SizedBox(
          height: 20,
        ),
        Card(
          elevation: 8,
          child: Container(
            color: Color(0xFFD9D9D9),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 1.5,
            child: Column(children: [
              Row(
                children: [
                  Container(
                    color: Color(0xFFB3B3B3),
                    height: 45,
                    width: MediaQuery.of(context).size.width / 9,
                    child: Center(
                      child: ListTile(
                        // selected: selectedIndex == 1,
                        iconColor: Colors.white,
                        title: const Text("SEARCH USER EMAIL",
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
                    constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width / 6,
                        maxHeight: 100),
                    child: TextField(
                      keyboardType: TextInputType.name,
                      cursorColor: Colors.black,
                      controller: emailController,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w400),
                      decoration: const InputDecoration(
                        fillColor: Color(0xFFD9D9D9),
                        filled: true,
                        focusColor: Colors.grey,
                        hintText: 'Email',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text("Press Enter"),
                // style: ButtonStyle(
                //   backgroundColor: primaryColor,
                // ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Container(
                    color: Color(0xFFB3B3B3),
                    height: 45,
                    width: MediaQuery.of(context).size.width / 9,
                    child: Center(
                      child: ListTile(
                        // selected: selectedIndex == 1,
                        iconColor: Colors.white,
                        title: const Text("RESULT",
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
                    constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width / 6,
                        maxHeight: 100),
                    child: TextField(
                      keyboardType: TextInputType.name,
                      cursorColor: Colors.black,
                      controller: emailController,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w400),
                      decoration: const InputDecoration(
                        fillColor: Color(0xFFD9D9D9),
                        filled: true,
                        focusColor: Colors.grey,
                        hintText: 'Email',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Container(
                    color: Color(0xFFB3B3B3),
                    height: 45,
                    width: MediaQuery.of(context).size.width / 9,
                    child: Center(
                      child: ListTile(
                        // selected: selectedIndex == 1,
                        iconColor: Colors.white,
                        title: const Text("ADD TO ROLE",
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
                    constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width / 6,
                        maxHeight: 100),
                    child: TextField(
                      keyboardType: TextInputType.name,
                      cursorColor: Colors.black,
                      controller: emailController,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w400),
                      decoration: const InputDecoration(
                        fillColor: Color(0xFFD9D9D9),
                        filled: true,
                        focusColor: Colors.grey,
                        hintText: 'Email',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text("Save"),
                // style: ButtonStyle(
                //   backgroundColor: primaryColor,
                // ),
              ),
            ]),
          ),
        )
      ]),
    );
  }
}
