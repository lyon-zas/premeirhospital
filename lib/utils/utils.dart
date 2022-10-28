import 'dart:convert';
import 'dart:html';

import 'package:flutter/material.dart';
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


