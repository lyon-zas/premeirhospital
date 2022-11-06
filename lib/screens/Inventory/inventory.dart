import 'package:flutter/material.dart';
import 'package:premierhospitaladmin/screens/Inventory/approvals.dart';
import 'package:premierhospitaladmin/screens/Inventory/bedspace_management.dart';
import 'package:premierhospitaladmin/screens/Inventory/medical_equipment.dart';
import 'package:premierhospitaladmin/screens/Inventory/procurment.dart';
import 'package:premierhospitaladmin/screens/Inventory/stock_tracking.dart';
import 'package:premierhospitaladmin/screens/Inventory/vendor_management.dart';

import '../../utils/colors.dart';

class Inventory extends StatefulWidget {
  const Inventory({super.key});

  @override
  State<Inventory> createState() => _InventoryState();
}

class _InventoryState extends State<Inventory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(children: [
            Card(
              color: const Color(0xFFD9D9D9),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          color: primaryColor,
                          height: 45,
                          width: MediaQuery.of(context).size.width / 7.5,
                          child: Center(
                            child: ListTile(
                              // selected: selectedIndex == 1,
                              iconColor: Colors.white,
                              title: const Text("STOCK TRACKING",
                                  style: TextStyle(
                                    color: Colors.white,
                                  )),
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        const StockTracking()));
                              },
                            ),
                          ),
                        ),
                        Container(
                          color: primaryColor,
                          height: 45,
                          width: MediaQuery.of(context).size.width / 7.5,
                          child: Center(
                            child: ListTile(
                              // selected: selectedIndex == 1,
                              iconColor: Colors.white,
                              title: const Text("BEDSPACE",
                                  style: TextStyle(
                                    color: Colors.white,
                                  )),
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        const BedspaceManagement()));
                              },
                            ),
                          ),
                        ),
                        Container(
                          color: primaryColor,
                          height: 45,
                          width: MediaQuery.of(context).size.width / 7.5,
                          child: Center(
                            child: ListTile(
                              // selected: selectedIndex == 1,
                              iconColor: Colors.white,
                              title: const Text("MEDICAL EQUIPMENT",
                                  style: TextStyle(
                                    color: Colors.white,
                                  )),
                              onTap: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const MedicalEquipment())),
                            ),
                          ),
                        ),
                        Container(
                          color: primaryColor,
                          height: 45,
                          width: MediaQuery.of(context).size.width / 7.5,
                          child: Center(
                            child: ListTile(
                              // selected: selectedIndex == 1,
                              iconColor: Colors.white,
                              title: const Text("VENDOR MANAGEMENT",
                                  style: TextStyle(
                                    color: Colors.white,
                                  )),
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        const VendorManagement()));
                              },
                            ),
                          ),
                        ),
                        Container(
                          color: primaryColor,
                          height: 45,
                          width: MediaQuery.of(context).size.width / 7.5,
                          child: Center(
                            child: ListTile(
                              // selected: selectedIndex == 1,
                              iconColor: Colors.white,
                              title: const Text("PROCUREMENT",
                                  style: TextStyle(
                                    color: Colors.white,
                                  )),
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => const Procument()));
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
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
                              title: const Text("MEDICATION SUPPLY",
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
                              title: const Text("APPROVALS",
                                  style: TextStyle(
                                    color: Colors.white,
                                  )),
                              onTap: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) => const Approvals())),
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
                              title: const Text("POLICY DOCUMENTS",
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
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
                width: MediaQuery.of(context).size.width / 1.2,
                child: Image.asset("assets/inventory.png"))
          ]),
        ),
      )),
    );
  }
}
