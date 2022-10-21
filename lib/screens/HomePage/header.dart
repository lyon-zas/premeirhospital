import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../controllers/controller.dart';
import '../../firebase_resources/auth_method.dart';
import '../../responsive.dart';
import '../../utils/colors.dart';
import '../Auth/login_screen.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(100);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryColor,
      child: Row(
        children: [
          if (!Responsive.isDesktop(context))
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: context.read<MenuController>().controlMenu,
            ),
          if (!Responsive.isMobile(context))
            Image.asset(
              "assets/logo.png",
              height: 130,
              width: 161,
            ),
          if (!Responsive.isMobile(context))
            Spacer(flex: Responsive.isDesktop(context) ? 2 : 1),
          const ProfileCard()
        ],
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthMethods _authMethods = AuthMethods();
    Future<void> _showAlertDialog() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            // <-- SEE HERE
            title: const Center(child: Text('Log Out')),

            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[
                  Text('Are you sure want to log out?'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('No'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text('Yes'),
                onPressed: () async {
                  _authMethods.logout();
                  await Navigator.pushReplacementNamed(
                      context, LoginScreen.routeName);
                },
              ),
            ],
          );
        },
      );
    }

    return Container(
      alignment: Alignment.bottomCenter,
      margin: const EdgeInsets.only(left: 16),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 4,
      ),
      child: Row(
        children: [
          if (!Responsive.isMobile(context))
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Text("Welcome Admin",
                  style: GoogleFonts.rubik(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w400)),
            ),
          if (!Responsive.isMobile(context))
            Column(
              children: [
                CustomPopupMenu(
                  // ignore: sort_child_properties_last
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30.0,
                      vertical: 8.0,
                    ),
                    child: CircleAvatar(
                      radius: 30,
                      child: Image.asset(
                        "assets/image 52.png",
                        height: 50,
                      ),
                    ),
                  ),
                  menuBuilder: () => ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Container(
                      color: Colors.white,
                      child: IntrinsicWidth(
                        stepWidth: 50,
                        stepHeight: 50,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Admin Japhet",
                                          style: GoogleFonts.rubik(
                                              color: Colors.black,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w700)),
                                      Text("Super Admin",
                                          style: GoogleFonts.rubik(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400)),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      CircleAvatar(
                                        radius: 30,
                                        child: Center(
                                          child: Image.asset(
                                            "assets/image 52.png",
                                            height: 60,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      InkWell(
                                        onTap: _showAlertDialog,
                                        child: Text("Log out",
                                            style: GoogleFonts.rubik(
                                              color: Colors.black,
                                              fontSize: 13,
                                            )),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const Divider(
                                color: Color.fromARGB(255, 22, 21, 21),
                                thickness: 2,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Row(
                                        children: const [
                                          Icon(Icons.account_box),
                                          Text("My Account")
                                        ],
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Row(
                                        children: const [
                                          Icon(Icons.settings),
                                          Text("Settings")
                                        ],
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Row(
                                        children: const [
                                          Icon(Icons.key),
                                          Text("Change password")
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  pressType: PressType.singleClick,
                  verticalMargin: -10,
                  // controller: _controller,
                  barrierColor: Colors.black54,
                  horizontalMargin: 0.0,
                  arrowColor: Colors.white,
                  showArrow: true,
                ),

                // CircleAvatar(
                //   radius: 30,
                //   child: Image.asset(
                //     "assets/image 52.png",
                //     height: 50,
                //   ),
                // ),
                InkWell(
                  onTap: _showAlertDialog,
                  child: Text("Log out",
                      style: GoogleFonts.rubik(
                        color: Colors.white,
                        fontSize: 10,
                      )),
                ),
              ],
            ),
          if (Responsive.isMobile(context))
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Text("Welcome, Admin",
                  style: GoogleFonts.rubik(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w400)),
            ),
        ],
      ),
    );
  }

// --- Button Widget --- //
}

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: "Search",
        fillColor: secondaryColor,
        filled: true,
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        suffixIcon: InkWell(
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.all(16 * 0.75),
            margin: const EdgeInsets.symmetric(horizontal: 16 / 2),
            decoration: const BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: SvgPicture.asset("assets/icons/Search.svg"),
          ),
        ),
      ),
    );
  }
}
