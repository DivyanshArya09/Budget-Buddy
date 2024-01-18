import 'package:cipherx_expense_tracker_app/auth/services/local/local_data_sources.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class AuthGateProvider with ChangeNotifier {
  final localDataSource = GetIt.I.get<LocalDataSource>();
  bool isFirstTime = false;
  bool isLoading = false;

  Future<bool> setFirstTime() async {
    isLoading = true;
    notifyListeners();
    isFirstTime = await localDataSource.isNewUser();
    notifyListeners();
    isLoading = false;
    return isFirstTime;
    // notifyListeners();
  }
}
