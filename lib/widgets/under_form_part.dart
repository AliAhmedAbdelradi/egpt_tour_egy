import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constant/constant.dart';

class UnderFormPart extends StatelessWidget {
  const UnderFormPart(
      {super.key,
      this.onTap,
      required this.textPart1,
      required this.textPart2});

  final void Function()? onTap;
  final String textPart1;
  final String textPart2;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
                child: Divider(
              thickness: 2,
              color: Colors.black,
              endIndent: 2.w,
              indent: 20.w,
            )),
            Text(
              'Or connected With',
              style: GoogleFonts.radioCanada(
                  fontWeight: FontWeight.bold, fontSize: 18.sp),
            ),
            Expanded(
                child: Divider(
              thickness: 2,
              color: Colors.black,
              endIndent: 20.w,
              indent: 2.w,
            )),
            SizedBox(height: 10.h),
            InkWell(
                child: Image.asset('assets/images/google_logo.png',
                    height: 24.h, width: 24.w)),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  textPart1,
                  style: GoogleFonts.radioCanada(
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold),
                ),
                InkWell(
                  onTap: () {
                    onTap;
                  },
                  child: Text(
                    textPart2,
                    style: GoogleFonts.radioCanada(
                        color: primaryColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
