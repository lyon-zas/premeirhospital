import 'dart:convert';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

void showSnackBar(BuildContext context, String content) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(content),
    ),
  );
}

openUrl(String url, BuildContext context) async {
  if (await canLaunch(url)) {
    await launch(url);
  }
}

 String toDates(DateTime dateTime){
  final date = DateFormat.yMMMEd().format(dateTime);
  return '$date';
}

String toTime(DateTime dateTime){
  final time = DateFormat.Hm().format(dateTime);
  return '$time';
}

