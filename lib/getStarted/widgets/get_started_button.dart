import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GetStartedButton extends StatelessWidget {
  final VoidCallback onPressed;
  const GetStartedButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 90.h,
        width: 90.h,
        decoration: BoxDecoration(
          color: const Color.fromRGBO(237, 225, 225, .75),
          borderRadius: BorderRadius.circular(50),
        ),
        padding: const EdgeInsets.all(10),
        child: Image(
          height: 48.53.h,
          width: 25.h,
          image: const AssetImage('assets/images/getStarted.png'),
        ),
      ),
    );
  }
}
