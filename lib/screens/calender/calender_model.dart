import 'package:flutter/material.dart';
import 'package:premierhospitaladmin/utils/colors.dart';

class Event {
  final String title;
  final String description;
  final DateTime from;
  final DateTime to;
  final Color backgrounndColor;
  final bool isAllDay;

  Event(
      {required this.title,
      required this.description,
      required this.from,
      required this.to,
      this.backgrounndColor = primaryColor,
      this.isAllDay = false});
}
