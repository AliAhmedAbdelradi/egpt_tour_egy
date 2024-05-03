import 'package:ept_mate/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ImageCateg extends StatelessWidget {
  ImageCateg(this.image,this.txt, {super.key});
  String txt;
  String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 140.w,
            height: 107.h,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: Image(image: AssetImage(image))),

          Container(

            child: Text(txt,style: TextStyle(fontSize: 16),)),

      ],
    );
  }
}
