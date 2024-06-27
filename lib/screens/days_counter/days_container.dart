
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class contain extends StatefulWidget {
  String txt;
  String x;
  Function sub;
  Function add;
  contain(this.txt,this.x, this.add,this.sub, {super.key});

  @override
  State<contain> createState() => _containState();

}

class _containState extends State<contain> {



  @override
  Widget build(BuildContext context) {

    return Container(
      child: Row(
        children: [
          SizedBox(width: 20.w,),
          Text(widget.txt,style: GoogleFonts.poppins(
              fontSize: 17.sp,
              color:Colors.black,
              fontWeight: FontWeight.bold)),
          Spacer(),
          InkWell(
            onTap: (){
              widget.sub();
            },
              child: Container(
                  margin: EdgeInsets.only(bottom: 15.h),
                  child: Icon(Icons.minimize))),
          SizedBox(width: 13.w,),
          Text("${widget.x}",style: GoogleFonts.poppins(
              fontSize: 17.sp,
              color:Colors.black,
              fontWeight: FontWeight.bold),),
          SizedBox(width: 13.w,),
          InkWell(
              onTap: (){
                widget.add();
              },

              child: Icon(Icons.add))


        ],
      ),
        height: 71.h,
        width: 348.w,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 0.w, color: Colors.black)));
  }

}
