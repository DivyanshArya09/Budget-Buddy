import 'dart:async';

import 'package:cipherx_expense_tracker_app/auth/services/local/local_data_sources.dart';
import 'package:cipherx_expense_tracker_app/home/models/transaction_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeRemoteDataSources {
  final LocalDataSource authLocalDataSource;
  HomeRemoteDataSources({
    required this.authLocalDataSource,
  });
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  //! this function fetches income, account balance and expense
  Future<AccountModel> getAccountDetails() async {
    final user = await authLocalDataSource.getUser();

    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot = await firestore
          .collection('users')
          .doc(user.uid)
          .collection('account')
          .get();

      AccountModel accountDetails =
          AccountModel.fromJson(querySnapshot.docs.first.data());
      return accountDetails;
    } catch (e) {
      throw Exception(e);
    }
  }

  //! this function fetches transactions
  Future<List<TransactionModel>> getTransactions() async {
    try {
      final user = await authLocalDataSource.getUser();
      QuerySnapshot<Map<String, dynamic>> querySnapshot = await firestore
          .collection('users')
          .doc(user.uid)
          .collection('transactions')
          .orderBy('date', descending: true)
          .get();
      List<TransactionModel> dataList = [];

      print('------------------------------->${querySnapshot.docs.length}');

      for (int i = 0; i < querySnapshot.docs.length; i++) {
        print(
            '-------------------------------->${querySnapshot.docs[i].data()}');
        dataList.add(TransactionModel.fromJson(querySnapshot.docs[i].data()));
      }

      return dataList;
    } catch (e) {
      throw Exception(e);
    }
  }

  //! this function adds income and expense
  Future<void> addIncome(Map<dynamic, dynamic> map) async {
    int amount = map['amount'];
    final user = await authLocalDataSource.getUser();

    firestore
        .collection('users')
        .doc(user.uid)
        .collection('account')
        .doc('accountDetails')
        .update({
      'total_income': FieldValue.increment(amount),
      'total_money': FieldValue.increment(amount),
      'total_expense': FieldValue.increment(0),
    });

    await addTransaction(map, user.uid);
  }

  //! this function adds income and expense
  Future<void> addExpense(Map<dynamic, dynamic> map) async {
    final user = await authLocalDataSource.getUser();
    int amount = map['amount'];
    firestore
        .collection('users')
        .doc(user.uid)
        .collection('account')
        .doc('accountDetails')
        .update({
      'total_income': FieldValue.increment(0),
      'total_money': FieldValue.increment(-amount),
      'total_expense': FieldValue.increment(amount),
    });

    await addTransaction(map, user.uid);
  }

  Future<void> addTransaction(
    Map<dynamic, dynamic> map,
    String uid,
  ) async {
    firestore.collection('users').doc(uid).collection('transactions').doc().set(
      {
        'amount': map['amount'],
        'wallet': map['wallet'],
        'category': map['category'],
        'description': map['description'],
        'date': map['date'],
        'type': map['type'],
      },
    );
  }
}
