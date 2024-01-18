import 'package:flutter/material.dart';

class WalletDropDownProvider with ChangeNotifier {
  int value = 0;
  void changeValue(int values) {
    value = values;
    notifyListeners();
  }
}
