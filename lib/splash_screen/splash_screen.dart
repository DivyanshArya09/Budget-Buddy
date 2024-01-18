import 'package:cipherx_expense_tracker_app/auth_gate/auth_gate.dart';
import 'package:cipherx_expense_tracker_app/utils/colors_contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const AuthGate(),
          ),
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.splashScreenColor,
      body: Stack(
        children: [
          Positioned(
            bottom: 829.h - 912.h,
            child: SizedBox(
              height: 300.h,
              width: 300.w,
              child: const Image(
                fit: BoxFit.fill,
                image: AssetImage('assets/images/recordcirclebottomright.png'),
              ),
            ),
          ),
          Positioned(
            top: -1.94.h,
            // left: -10,
            right: 0,
            child: SizedBox(
              height: 300.h,
              width: 300.w,
              child: const Image(
                fit: BoxFit.fill,
                image: AssetImage('assets/images/recordcircletopleft.png'),
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  height: 98.63.h,
                  width: 98.68.w,
                  image: const AssetImage('assets/images/Vector.png'),
                ),
                Text(
                  'CipherX',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.brunoAceSc(
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 36.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 736.h,
            left: 127.w,
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'By\n',
                style: GoogleFonts.cambay(
                  textStyle: TextStyle(
                    // height: 24.43,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w400,
                    color: const Color.fromARGB(255, 255, 255, 255)
                        .withOpacity(0.54),
                  ),
                ),
                children: [
                  TextSpan(
                    text: 'Open Source',
                    style: GoogleFonts.cambay(
                      textStyle: TextStyle(
                        // height: 24.43.h,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color.fromARGB(255, 255, 255, 255)
                            .withOpacity(0.54),
                      ),
                    ),
                  ),
                  TextSpan(
                    text: ' Community',
                    style: GoogleFonts.cambay(
                      textStyle: TextStyle(
                        // height: 24.43.h,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color.fromRGBO(248, 164, 1, 1),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
