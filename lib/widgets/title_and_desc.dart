import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleAndDescription extends StatelessWidget {
  const TitleAndDescription(
      {super.key, required this.title, required this.desc});

  final String title;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          textAlign: TextAlign.center,
          title,
          style: GoogleFonts.radioCanada(
              fontWeight: FontWeight.bold, fontSize: 25.sp),
        ),
        Text(
          textAlign: TextAlign.center,
          desc,
          style: GoogleFonts.radioCanada(fontSize: 15.sp, color: Colors.grey),
        ),
      ],
    );
  }
}
