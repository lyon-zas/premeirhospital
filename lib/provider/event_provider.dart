import 'package:flutter/material.dart';

import '../screens/calender/calender_model.dart';

class EventProvider extends ChangeNotifier {
  final List<Event> _events = [];
  List<Event> get events => _events;

  void addEvents(Event event) {
    _events.add(event);
    notifyListeners();
  }
}
