import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpWithGoogleButton extends StatelessWidget {
  final VoidCallback onTap;
  const SignUpWithGoogleButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 56.h,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: const Color.fromRGBO(241, 241, 250, 1),
            width: 1,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              height: 32.h,
              width: 32.w,
              image: const AssetImage('assets/images/google.png'),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              'Sign Up with Google',
              style: GoogleFonts.inter(
                textStyle: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: const Color.fromRGBO(33, 35, 37, 1),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
