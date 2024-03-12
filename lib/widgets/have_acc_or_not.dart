import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constant/constant.dart';

class HaveAccountOrNot extends StatelessWidget {
  const HaveAccountOrNot({
    super.key,
    required this.questionText,
    required this.goToPage,
    required this.onTap,
  });

  final String questionText;
  final String goToPage;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          questionText,
          style: GoogleFonts.radioCanada(
              color: Colors.black,
              fontSize: 16.sp,
              fontWeight: FontWeight.bold),
        ),
        InkWell(
          onTap: onTap,
          child: Text(
            goToPage,
            style: GoogleFonts.radioCanada(
                color: primaryColor,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
