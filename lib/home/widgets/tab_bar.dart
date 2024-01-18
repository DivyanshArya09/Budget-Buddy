import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class PeriodTabBar extends StatelessWidget {
  const PeriodTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            style: ButtonStyle(
              // height: MaterialStateProperty.all(40.h),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.r),
              )),
              padding: MaterialStateProperty.all(
                EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
              ),
              backgroundColor: MaterialStateProperty.all(
                const Color.fromRGBO(252, 238, 212, 1),
              ),
            ),
            onPressed: () {},
            child: Text(
              'today',
              style: GoogleFonts.inter(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: const Color.fromRGBO(252, 172, 18, 1),
              ),
            ),
          ),
          _tabItem('Week'),
          _tabItem('Month'),
          _tabItem('Year'),
        ],
      ),
    );
  }

  Widget _tabItem(String time) {
    return TextButton(
      onPressed: () {},
      child: Text(
        time,
        style: GoogleFonts.inter(
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          color: const Color.fromRGBO(145, 145, 159, 1),
        ),
      ),
    );
  }
}
