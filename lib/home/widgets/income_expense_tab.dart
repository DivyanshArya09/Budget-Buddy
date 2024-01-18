import 'package:cipherx_expense_tracker_app/home/widgets/tab_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class IncomeExpensesTab extends StatelessWidget {
  final String image, title, amount;
  final VoidCallback onTap;
  final Color color;
  const IncomeExpensesTab(
      {super.key,
      required this.image,
      required this.onTap,
      required this.title,
      required this.amount,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        // padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: color,
        ),
        height: 85,
        width: 170.w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              height: 48,
              width: 48.w,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(255, 246, 229, 1),
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Image(
                height: 32.h,
                width: 32.w,
                image: AssetImage(image),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 16.h),
                Text(
                  title,
                  style: GoogleFonts.inter(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color.fromRGBO(255, 246, 229, 1),
                  ),
                ),
                Text(
                  '₹$amount',
                  style: GoogleFonts.inter(
                    textStyle: TextStyle(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w600,
                      color: const Color.fromRGBO(255, 246, 229, 1),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
