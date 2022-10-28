import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
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
        'Patient id': "ph${1003}",
        'Phone Number': phone,
        'status': "active",
        'Date of Creation': DateTime.now()
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

  Future<void> updateViewCount(String id, bool isIncrease) async {
    try {
      await _firestore.collection('livestream').doc(id).update({
        'viewers': FieldValue.increment(isIncrease ? 1 : -1),
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> endLiveStream(String channelId) async {
    try {
      QuerySnapshot snap = await _firestore
          .collection('livestream')
          .doc(channelId)
          .collection('comments')
          .get();

      for (int i = 0; i < snap.docs.length; i++) {
        await _firestore
            .collection('livestream')
            .doc(channelId)
            .collection('comments')
            .doc(
              ((snap.docs[i].data()! as dynamic)['commentId']),
            )
            .delete();
      }
      await _firestore.collection('livestream').doc(channelId).delete();
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}

// DateTime.now(),