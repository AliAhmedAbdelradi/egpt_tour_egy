
import 'package:ept_mate/screens/sing_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constant/constant.dart';
import '../widgets/dot_widget.dart';

class OnBoarding extends StatefulWidget {
  static String routeName = 'onBoarding';

  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(
          'assets/images/logo.png',
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: PageView.builder(
              onPageChanged: (value) {
                currentIndex = value;
                setState(() {});
              },
              itemCount: content.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Image.asset(
                      content[currentIndex].image,
                      height: 300.h,
                      width: double.infinity.w,
                    ),
                    Text(
                      content[currentIndex].title,
                      style: GoogleFonts.radioCanada(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xff89C9FF)),
                    ),
                    Center(
                      child: Text(
                          textAlign: TextAlign.center,
                          content[currentIndex].desc,
                          style: GoogleFonts.radioCanada(
                            fontSize: 18.sp,
                            color: Colors.black,
                          )),
                    ),
                  ],
                );
              },
            ),
          ),
          DotsWidget(currentIndex: currentIndex),
          Padding(
            padding: const EdgeInsets.all(50).w,
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  currentIndex != content.length - 1
                      ? currentIndex++
                      : Navigator.pushReplacementNamed(
                          context, SingUp.routeName);
                });
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor, foregroundColor: Colors.white),
              child: Text(
                currentIndex == 0
                    ? 'Lets get started'
                    : currentIndex == 1
                        ? 'Continue'
                        : 'Create Account',
                style: GoogleFonts.radioCanada(
                  fontSize: 24.sp,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
