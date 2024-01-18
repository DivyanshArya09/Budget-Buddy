import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class AccountModel extends Equatable {
  final String totalIncome;
  final String totalExpense;
  final String totalMoney;

  const AccountModel({
    required this.totalIncome,
    required this.totalExpense,
    required this.totalMoney,
  });

  factory AccountModel.fromJson(Map<String, dynamic> json) {
    return AccountModel(
      totalIncome: json['total_income'].toString(),
      totalExpense: json['total_expense'].toString(),
      totalMoney: json['total_money'].toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'total_income': totalIncome,
      'total_expense': totalExpense,
      'total_money': totalMoney,
    };
  }

  @override
  List<Object?> get props => [totalIncome, totalExpense, totalMoney];
}

class TransactionModel extends Equatable {
  final String category;
  final String description;
  final String amount;
  final DateTime date;
  final String wallet;
  final String type;
  const TransactionModel({
    required this.type,
    required this.category,
    required this.description,
    required this.amount,
    required this.date,
    required this.wallet,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      type: json['type'],
      category: json['category'],
      description: json['description'],
      amount: json['amount'].toString(),
      date: (json['date'] as Timestamp).toDate(),
      wallet: json['wallet'],
    );

    // toJson()
  }

  Map<String, dynamic> toJson() {
    return {
      'category': category,
      'description': description,
      'amount': amount,
      'date': date,
      'wallet': wallet,
      'type': type
    };
  }

  @override
  List<Object?> get props =>
      [category, description, amount, date, wallet, type];
}
