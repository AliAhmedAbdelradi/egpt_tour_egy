import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ShapePlan extends StatelessWidget {
  final String img;
  final String txt;
  final Function tab;

  ShapePlan(this.img, this.txt, this.tab, {super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image(image: AssetImage(img)),
        Container(
          margin: EdgeInsets.only(top: 15.h, left: 20.w),
          child: Text(
            txt,
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 25.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Container(
          width: 245.w,
          height: 35.h,
          margin: EdgeInsets.only(top: 90.h, left: 30.w),
          child: ElevatedButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
              backgroundColor: MaterialStateProperty.all(Colors.white),
            ),
            onPressed: () {
              tab();
            },
            child: Row(
              children: [
                SizedBox(
                  width: 20.w,
                ),
                Icon(
                  Icons.add,
                  color: Colors.black,
                ),
                SizedBox(
                  width: 30.w,
                ),
                Text(
                  txt,
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
