import 'package:flutter/material.dart';

class TodoData {
  String title;
  String timestamp;
  bool isHappy;
  Color color;

  TodoData({
    required this.title,
    required this.timestamp,
    required this.color,
    this.isHappy = false,
  });
}
