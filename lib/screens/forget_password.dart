
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constant/constant.dart';
import '../widgets/forget_password_form.dart';

class ForgetPasswordScreen extends StatelessWidget {
  static String routeName = 'forgetPasswordScreen';

  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                'assets/images/forget_password.gif',
                height: 300.h,
                width: double.infinity.w,
              ),
              SizedBox(height: 10.h),
              Text(
                textAlign: TextAlign.center,
                'Forget your password?',
                style: GoogleFonts.radioCanada(
                    fontWeight: FontWeight.bold,
                    fontSize: 22.sp,
                    color: primaryColor),
              ),
              SizedBox(height: 10.h),
              const ForgetPasswordForm()
            ],
          ),
        ),
      ),
    );
  }
}
