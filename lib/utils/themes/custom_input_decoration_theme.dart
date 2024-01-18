import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomInputDecorationTheme {
  static InputDecorationTheme lightTheme = InputDecorationTheme(
    hintStyle: GoogleFonts.inter(
        textStyle: TextStyle(
      color: const Color.fromRGBO(145, 145, 159, 1),
      fontSize: 16.sp,
      fontWeight: FontWeight.w400,
    )),
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    disabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(
        color: Color.fromRGBO(241, 241, 250, 1),
        width: 1,
      ),
    ),
    // focusedBorder: ,
    border: const OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(16.0),
      ),
    ),
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(
        color: Color.fromRGBO(241, 241, 250, 1),
        width: 1,
      ),
    ),
    enabledBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(16.0),
      ),
      borderSide: BorderSide(
        color: Color.fromRGBO(241, 241, 250, 1),
        width: 1,
      ),
    ),
    suffixIconColor: const Color.fromRGBO(145, 145, 159, 1),
  );
}
