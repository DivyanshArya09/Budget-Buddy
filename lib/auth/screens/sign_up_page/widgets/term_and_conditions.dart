import 'package:cipherx_expense_tracker_app/auth/providers/check_box_toggler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Consumer<CheckBoxToggler>(builder: (context, ref, child) {
        return Checkbox(
          value: ref.isChecked,
          onChanged: (value) {
            ref.toggleCheckBox();
          },
        );
      }),
      const SizedBox(
        width: 10,
      ),
      SizedBox(
        width: MediaQuery.of(context).size.width / 1.5,
        child: RichText(
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          text: TextSpan(
            text: 'By signing up, you agree to the',
            style: GoogleFonts.inter(
                textStyle: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.black)),
            children: [
              TextSpan(
                text: ' Terms of Service and Privacy Policy',
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color.fromRGBO(127, 61, 255, 1),
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    ]);
  }
}
