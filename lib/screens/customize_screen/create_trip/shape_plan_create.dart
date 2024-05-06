import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';


class ShapePlanCreate extends StatelessWidget {
  ShapePlanCreate(this.img,this.txt,this.txt1 ,this.tab, {super.key});
  String img;
  String txt;
  String txt1;
  Function tab;

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [

        Image(image: AssetImage(img)),
        Container(
            margin: EdgeInsets.only(top: 15.h,left: 20.w),
            child: Text(txt, style: GoogleFonts.poppins(color: Colors.white,fontSize: 25,fontWeight: FontWeight.w600),)),
        Container(
            margin: EdgeInsets.only(top: 100.h,left: 45.w),
            child: Text(txt1, style: GoogleFonts.poppins(color: Colors.white,fontSize: 12,fontWeight: FontWeight.w600),)),
        Container(
          width: 240.w,
          height: 33.h,
          margin: EdgeInsets.only(top: 135.h,left: 36.w),
          child: ElevatedButton(
              style: ButtonStyle(
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),

                  backgroundColor:
                  MaterialStatePropertyAll(Colors.white)),
              onPressed: () {},
              child: InkWell(
                onTap: () {
                  tab();
                },
                child: Row(
                  children: [
                    SizedBox(
                      width: 30.w,
                    ),
                    Icon(
                      Icons.add,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    Text(
                        txt,
                        style: GoogleFonts.poppins(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w600)
                    ),
                  ],
                ),
              )),
        )
      ],
    );
  }
}
