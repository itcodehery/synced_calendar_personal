import 'dart:math';

import 'package:flutter/material.dart';

enum EventStatus {
  pending,
  completed,
}

const colors = [
  Colors.redAccent,
  Colors.greenAccent,
  Colors.tealAccent,
  Colors.purpleAccent,
  Colors.orangeAccent,
  Colors.blueAccent,
  Colors.pinkAccent,
  Colors.amberAccent,
];

class Event {
  int id = Random.secure().nextInt(10000);
  final String title;
  final String description;
  final DateTime date;
  EventStatus status = EventStatus.pending;
  final Color color;

  Event({
    required this.title,
    required this.description,
    required this.date,
    required this.color,
  });
}
