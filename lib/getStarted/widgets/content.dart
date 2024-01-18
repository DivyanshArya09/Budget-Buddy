import 'package:cipherx_expense_tracker_app/getStarted/widgets/get_started_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Content extends StatelessWidget {
  final VoidCallback onPressed;
  const Content({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text(
                    'Welcome to',
                    style: GoogleFonts.aBeeZee(
                      textStyle: TextStyle(
                        fontSize: 40.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Text(
                    'CipherX',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.brunoAceSc(
                      textStyle: TextStyle(
                        fontSize: 40.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 10.w,
              ),
              GetStartedButton(onPressed: onPressed),
            ],
          ),
          Text(
            'The best way to track your expenses.',
            style: GoogleFonts.aBeeZee(
              textStyle: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
