import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ConnectedWithRow extends StatelessWidget {
  const ConnectedWithRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
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
      ],
    );
  }
}
