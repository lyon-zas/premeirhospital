import 'dart:math';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../provider/user_provider.dart';
import '../utils/utils.dart';
import 'storage_method.dart';

class FirestoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final StorageMethods _storageMethods = StorageMethods();

  Future<void> addPatient(
      String dOb,
      String email,
      String firstname,
      String lastname,
      String gender,
      String phone,
      BuildContext context) async {
    final user = Provider.of<UserProvider>(context, listen: false);

    try {
      await _firestore.collection('Patients').doc().set({
        'Date of birth': dOb,
        'Email': email,
        'First Name': firstname,
        'Gender': gender,
        'Last Name': lastname,
        'Patient id': "PH${Random().nextInt(1000)}",
        'Phone Number': phone,
        'status': "active",
        'Date of Creation':
            DateFormat('dd/MM/yyyy HH:mm:ss').format(DateTime.now())
      });
    } on FirebaseException catch (e) {
      showSnackBar(context, e.message!);
    }
  }

  Future<void> addVendor(
      String companyName,
      String contactPerson,
      String phone,
      String email,
      String website,
      String category,
      BuildContext context) async {
    final user = Provider.of<UserProvider>(context, listen: false);

    try {
      await _firestore.collection('Vendor_Management').doc().set({
        'Company Name': companyName,
        'Contact Person': contactPerson,
        'Phone Number': phone,
        'Email': email,
        'Website': website,
        'Category': category
      });
    } on FirebaseException catch (e) {
      showSnackBar(context, e.message!);
    }
  }

  Future<void> addAppoinment(
      String date,
      // String aptNo,
      String doctor,
      String patientId,
      String slot,
      String phone,
      String paymentmode,
      String appoinmentType,
      BuildContext context) async {
    final user = Provider.of<UserProvider>(context, listen: false);

    try {
      await _firestore.collection('Appointments').doc().set({
        'Appt Date': date,
        'Apt No': '112',
        'Doctor': doctor,
        'Patient ID': patientId,
        'Source': "admin web",
        'Phone': phone,
        'status': "pending",
        'slot': slot,
        'paymentmode': paymentmode,
        'appoinmentType': appoinmentType
      });
    } on FirebaseException catch (e) {
      showSnackBar(context, e.message!);
    }
  }
}

// DateTime.now(),