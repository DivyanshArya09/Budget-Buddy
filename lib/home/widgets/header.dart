import 'package:cipherx_expense_tracker_app/utils/colors_contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 32,
            width: 32,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                // color: ColorConstants.splashScreenColor,
                borderRadius: const BorderRadius.all(Radius.circular(100)),
                border: Border.all(
                  color: ColorConstants.splashScreenColor,
                  width: 2,
                )),
            child: Icon(
              Icons.person,
              size: 30.h,
              color: Colors.white,
            ),
          ),
          Text(
            'October',
            style:
                GoogleFonts.inter(fontSize: 14.sp, fontWeight: FontWeight.w500),
          ),
          Padding(
            padding: const EdgeInsets.all(2),
            child: Image(
                height: 32.h,
                width: 32.h,
                image: const AssetImage('assets/images/notification.png')),
          )
        ],
      ),
    );
  }
}
