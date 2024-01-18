import 'package:flutter/material.dart';

class PassWordToggler with ChangeNotifier {
  bool obscureText = true;

  void toggleObscureText() {
    obscureText = !obscureText;
    notifyListeners();
  }
}
