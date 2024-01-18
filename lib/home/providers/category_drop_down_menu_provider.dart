import 'package:flutter/material.dart';

class CategoryDropDownProvider with ChangeNotifier {
  List<String> category = [
    'Food',
    'Travel',
    'Subscription',
  ];
  int value = 0;
  void changeValue(int values) {
    value = values;
    notifyListeners();
  }
}
