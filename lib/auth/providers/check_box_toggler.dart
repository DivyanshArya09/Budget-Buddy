import 'package:flutter/material.dart';

class CheckBoxToggler with ChangeNotifier {
  bool isChecked = false;

  void toggleCheckBox() {
    isChecked = !isChecked;
    notifyListeners();
  }
}
