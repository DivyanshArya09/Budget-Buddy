import 'package:cipherx_expense_tracker_app/auth/services/local/local_data_sources.dart';
import 'package:cipherx_expense_tracker_app/home/models/transaction_model.dart';
import 'package:cipherx_expense_tracker_app/home/services/remote/home_remote_data_sources.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class HomeProvider with ChangeNotifier {
  HomeRemoteDataSources homeRemoteDataSources =
      GetIt.I.get<HomeRemoteDataSources>();
  LocalDataSource localDataSource = GetIt.I.get<LocalDataSource>();

  String accountBalance = '', income = '', expenses = '';

  bool isLoading = false;

  bool error = false;

  bool success = false;

  void successFalse() {
    success = false;
    error = false;
    notifyListeners();
  }

  Future<bool> addIncome(Map<String, dynamic> map) async {
    isLoading = true;
    notifyListeners();
    try {
      await homeRemoteDataSources.addIncome(map).then((value) {
        success = true;
        isLoading = false;
        notifyListeners();
      });
      return success;
    } catch (e) {
      error = true;
      isLoading = false;
      notifyListeners();
      return false;
    }
  }

  Future<bool> addExpenses(Map<String, dynamic> map) async {
    isLoading = true;
    notifyListeners();
    try {
      await homeRemoteDataSources.addExpense(map).then((value) {
        success = true;
        isLoading = false;
        error = true;
        notifyListeners();
      });
      return success;
    } catch (e) {
      error = true;
      isLoading = false;
      notifyListeners();
      return error;
    }
  }
}
