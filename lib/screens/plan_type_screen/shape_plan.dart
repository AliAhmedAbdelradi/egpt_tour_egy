
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ShapePlan extends StatelessWidget {
  ShapePlan(this.img,this.txt, this.tab, {super.key});
  String img;
  String txt;
  Function tab;

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [

        Image(image: AssetImage(img)),
        Container(
            margin: EdgeInsets.only(top: 15,left: 20),
            child: Text(txt, style: GoogleFonts.poppins(color: Colors.white,fontSize: 25,fontWeight: FontWeight.w600),)),
        Container(
          width: 245.w,
          height: 35.h,
          margin: EdgeInsets.only(top: 90.h,left: 30.w),
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