import 'package:cipherx_expense_tracker_app/home/pages/expense_page.dart';
import 'package:cipherx_expense_tracker_app/home/pages/income_page.dart';
import 'package:cipherx_expense_tracker_app/home/providers/home_provider.dart';
import 'package:cipherx_expense_tracker_app/home/widgets/balance.dart';
import 'package:cipherx_expense_tracker_app/home/widgets/header.dart';
import 'package:cipherx_expense_tracker_app/home/widgets/income_expense_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AccountOverview extends StatelessWidget {
  final String accountBalance, income, expenses;
  const AccountOverview(
      {super.key,
      required this.accountBalance,
      required this.income,
      required this.expenses});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      height: 312,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color.fromRGBO(255, 246, 229, 1),
            Color.fromRGBO(248, 237, 216, 0),
          ],
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(32.r),
          bottomRight: Radius.circular(32.r),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Header(),
          AccountBalance(
            accountBalance: accountBalance,
          ),
          SizedBox(height: 27.h),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IncomeExpensesTab(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const IncomePage()));
                  },
                  image: 'assets/images/income.png',
                  title: 'Income',
                  amount: income,
                  color: const Color.fromRGBO(0, 168, 107, 1),
                ),
                // SizedBox(width: 16.w),
                IncomeExpensesTab(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ExpensePage()));
                  },
                  image: 'assets/images/expense.png',
                  title: 'Expense',
                  amount: expenses,
                  color: const Color.fromRGBO(253, 60, 74, 1),
                ),
              ])
        ],
      ),
    );
  }
}
