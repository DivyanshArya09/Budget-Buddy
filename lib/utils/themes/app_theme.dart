import 'package:cipherx_expense_tracker_app/utils/themes/custom_input_decoration_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    scaffoldBackgroundColor: Colors.white,
    inputDecorationTheme: CustomInputDecorationTheme.lightTheme,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, 56.h),
        maximumSize: Size(double.infinity, 56.h),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
        ),
        backgroundColor: const Color.fromRGBO(127, 61, 255, 1),
        foregroundColor: Colors.white,
        elevation: 0,
        shadowColor: Colors.transparent,
        textStyle: GoogleFonts.inter(
          textStyle: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    ),
    checkboxTheme: CheckboxThemeData(
      splashRadius: 16,
      side: const BorderSide(
        color: Color.fromRGBO(127, 61, 255, 1),
        width: 2,
      ),
      checkColor: MaterialStateProperty.all(Colors.white),
    ),
  );
}
