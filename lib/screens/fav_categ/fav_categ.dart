import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavCateg extends StatelessWidget {

  FavCateg(this.txt1,this.txt2,this.txt3,this.txt4, {super.key});
  String txt1;
  String txt2;
  String txt3;
  String txt4;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 356.w,
      height: 131.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft:  Radius.circular(20),
              bottomRight: Radius.circular(20)),
          color: Colors.white,
          border: Border.all(
            color: Colors.black,
          )),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 10.w),
            child: Row(children: [
              Container(
                margin: EdgeInsets.only(left: 10.w),
                child: Column(
                  children: [
                    Text(
                       txt1,
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      txt2,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                       txt3,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ]),
          ),
          SizedBox(height: 16.h,),
          Container(
            margin: EdgeInsets.only(top: 16.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Icon(
                  Icons.location_on,
                  color: Colors.grey,
                ),
                Text(
                  txt4,
                  style: TextStyle(fontSize: 18),
                ),
                Spacer(

                ),
                Icon(
                  Icons.favorite,
                  color: Colors.red,
                  weight: 33,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
