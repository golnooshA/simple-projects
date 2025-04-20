import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class CounterModel extends ChangeNotifier {
  int _count = 0;

  int get count => _count;

  CounterModel() {
    _loadCount();
  }

  void _loadCount() async {
    final prefs = await SharedPreferences.getInstance();
    _count = prefs.getInt('counter') ?? 0;
    notifyListeners();
  }

  void _saveCount() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('counter', _count);
  }

  void increment() {
    _count++;
    _saveCount();
    notifyListeners();
  }

  void decrement() {
    _count--;
    _saveCount();
    notifyListeners();
  }
}