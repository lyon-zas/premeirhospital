import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:premierhospitaladmin/utils/colors.dart';

class AddPatient extends StatefulWidget {
  static const routeName = "/addpatient";
  const AddPatient({super.key});

  @override
  State<AddPatient> createState() => _AddPatientState();
}

class _AddPatientState extends State<AddPatient> {
  final _formKey = GlobalKey<FormBuilderState>();
  final _emailFieldKey = GlobalKey<FormBuilderFieldState>();
  final _phonenumberkey = GlobalKey<FormBuilderFieldState>();
  final _firstName = GlobalKey<FormBuilderFieldState>();
  final _lastName = GlobalKey<FormBuilderFieldState>();
  List<String> genderOptions = ['Male', 'Female', 'Other'];
  late String _emailError;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text("Registration",
            style: GoogleFonts.rubik(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w400)),
        centerTitle: false,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Card(
              child: FormBuilder(
                key: _formKey,
                child: Column(
                  children: [
                  ])
              ),
            ),
          ),
        ],
      ),
    );
  }
}
