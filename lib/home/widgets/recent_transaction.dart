import 'package:cipherx_expense_tracker_app/home/widgets/tab_bar.dart';
import 'package:cipherx_expense_tracker_app/home/widgets/transaction_card.dart';
import 'package:cipherx_expense_tracker_app/home/widgets/transaction_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class RecentTransactions extends StatelessWidget {
  const RecentTransactions({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const PeriodTabBar(),
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // crossAxisAlignment: CrossAxisAlignment.s,
            children: [
              Text(
                'Recent Transactions',
                style: GoogleFonts.inter(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: const Color.fromRGBO(41, 43, 45, 1),
                ),
              ),
              TextButton(
                onPressed: () {},
                style: ButtonStyle(
                  padding: MaterialStatePropertyAll(EdgeInsets.symmetric(
                    vertical: 8.h,
                    horizontal: 16.w,
                  )),
                  backgroundColor: MaterialStateProperty.all(
                    const Color.fromARGB(255, 204, 202, 206),
                  ),
                ),
                child: Text(
                  'See All',
                  style: GoogleFonts.inter(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color.fromRGBO(127, 61, 255, 1),
                  ),
                ),
              ),
            ],
          ),
          const TransactionList(),
        ],
      ),
    );
  }
}
