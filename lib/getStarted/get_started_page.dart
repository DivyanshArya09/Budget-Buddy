import 'package:cipherx_expense_tracker_app/auth/screens/sign_up_page/sign_up_page.dart';
import 'package:cipherx_expense_tracker_app/getStarted/widgets/content.dart';
import 'package:cipherx_expense_tracker_app/utils/colors_contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.splashScreenColor,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            //! bottom right circle image
            Positioned(
              bottom: 829.h - 893.h,
              child: SizedBox(
                height: 300.h,
                width: 300.w,
                child: const Image(
                  fit: BoxFit.fill,
                  image:
                      AssetImage('assets/images/recordcirclebottomright.png'),
                ),
              ),
            ),

            //! top left circle image
            Positioned(
              top: -14.88.h,
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

            //! cipherX logo
            Positioned(
              top: 47.56.h,
              left: 10,
              child: SizedBox(
                height: 90.11.h,
                width: 90.14.w,
                child: const Image(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/Vector.png'),
                ),
              ),
            ),

            //! content with getting started button
            Positioned(
              top: 604.h,
              child: Content(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignUpPage(),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
