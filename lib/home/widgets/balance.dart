import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountBalance extends StatelessWidget {
  final String accountBalance;
  const AccountBalance({super.key, required this.accountBalance});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Account Balance',
          style: GoogleFonts.inter(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: const Color.fromRGBO(145, 145, 159, 1),
          ),
        ),
        Text('₹ $accountBalance',
            style: GoogleFonts.inter(
              textStyle: TextStyle(
                fontSize: 40.sp,
                fontWeight: FontWeight.w600,
                color: const Color.fromRGBO(22, 23, 25, 1),
              ),
            ))
      ],
    );
  }
}
