import 'todo_list.dart';
import 'package:flutter/material.dart';
import 'calculator.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const CalculatorView(),
    ),
  );
}
