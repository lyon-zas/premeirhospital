import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:premierhospitaladmin/provider/user_provider.dart';
import 'package:premierhospitaladmin/screens/Auth/forgot_password.dart';
import 'package:premierhospitaladmin/screens/Auth/login_screen.dart';
import 'package:premierhospitaladmin/screens/Auth/resetlink.dart';
import 'package:premierhospitaladmin/screens/appointment/add_appointment.dart';
import 'package:premierhospitaladmin/screens/patient/app_patient.dart';
import 'package:premierhospitaladmin/utils/colors.dart';
import 'package:provider/provider.dart';

import 'firebase_resources/auth_method.dart';
import 'screens/HomePage/home_screen.dart';
import 'utils/loading_indicator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBZrAqQghVjmYa8iHxK5rXMkuBUYt9ZPUo",
            authDomain: "premierhospitaladmin.firebaseapp.com",
            databaseURL:
                "https://premierhospitaladmin-default-rtdb.firebaseio.com",
            projectId: "premierhospitaladmin",
            storageBucket: "premierhospitaladmin.appspot.com",
            messagingSenderId: "735485010603",
            appId: "1:735485010603:web:25935d60ddc4bfe1ec0dee",
            measurementId: "G-6JZZ47MNVG"));
  } else {
    await Firebase.initializeApp();
  }
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (_) => UserProvider(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Premier Hospital Admin',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: backgroundColor,
          appBarTheme: AppBarTheme.of(context).copyWith(
            backgroundColor: backgroundColor,
            elevation: 0,
            titleTextStyle: const TextStyle(
              color: primaryColor,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
            iconTheme: const IconThemeData(
              color: primaryColor,
            ),
          )),
      routes: {
        // OnboardingScreen.routeName: (context) => const OnboardingScreen(),
        LoginScreen.routeName: (context) => const LoginScreen(),
        ForgotPassword.routeName: (context) => const ForgotPassword(),
        ResetLink.routeName: (context) => const ResetLink(),
        AddPatient.routeName: (context) => const AddPatient(),
        HomePage.routeName: (context) => const HomePage(),
        AddAppointment.routeName: (context) => const AddAppointment()
      },
      home: FutureBuilder(
        future: AuthMethods()
            .getCurrentUser(FirebaseAuth.instance.currentUser != null
                ? FirebaseAuth.instance.currentUser!.uid
                : null)
            .then((value) {
          if (value != null) {
            var model;
            Provider.of<UserProvider>(context, listen: false).setUser(
              model.User.fromMap(value),
            );
          }
          return value;
        }),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingIndicator();
          }

          if (snapshot.hasData) {
            return const HomePage();
          }
          return const LoginScreen();
        },
      ),
    );
  }
}
