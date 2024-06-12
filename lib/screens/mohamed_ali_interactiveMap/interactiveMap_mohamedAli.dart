
import 'package:ept_mate/screens/abo_sample_interactiveMap/details_floor_status.dart';
import 'package:ept_mate/screens/abo_sample_interactiveMap/details_floor_status1.dart';
import 'package:ept_mate/screens/abo_sample_interactiveMap/details_floor_status2.dart';
import 'package:ept_mate/screens/mohamed_ali_interactiveMap/details_floor_status_mohamedAli1.dart';
import 'package:ept_mate/screens/mohamed_ali_interactiveMap/details_floor_status_mohamedAli2.dart';
import 'package:ept_mate/screens/mohamed_ali_interactiveMap/details_floor_status_mohamedAli3.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../select_city/btn1.dart';
import 'details_floor_status_mohamedAli.dart';

class InteractiveMapMohamedAli extends StatefulWidget {
  static const String routeName = "InteractiveMapMohamedAli";

  @override
  State<InteractiveMapMohamedAli> createState() =>
      _InteractiveMapAboSampleState();
}

class _InteractiveMapAboSampleState extends State<InteractiveMapMohamedAli> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(image: DecorationImage(image: AssetImage(
        "assets/images/interactiveMap_mohamed_ali2.png"),fit: BoxFit.fill,),),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.end,

          children: [

            Align(
              heightFactor: 11.9.h,
              widthFactor:24.w ,
              child: InkWell(
                onTap: () {
                setState(() {
                  showDetalis3();
                });
                },
                child: Container(
               margin: EdgeInsets.only(left: 10.w),
                  width: 18.w,
                  height: 18.h,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.red, width: 5.w),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100)),
                ),
              ),
            ),


            InkWell(
              onTap: () {
                setState(() {
                  showDetalis2();
                });
              },
              child: Container(
         margin: EdgeInsets.only(right: 190.w,top: 138.h),
                width: 18.w,
                height: 18.h,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.yellow, width: 4.w),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100)),
              ),
            ),

            InkWell(
              onTap: () {
             setState(() {
               showDetalis1();
             });
              },
              child: Container(
         margin: EdgeInsets.only(top: 84.h,right: 190.w),
                width: 18.w,
                height: 18.h,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.yellow, width: 4.w),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100),),
              ),
            ),
            InkWell(
              onTap: () {
             setState(() {
               showDetalis();
             });
              },
              child: Container(
         margin: EdgeInsets.only(top: 126.h,right: 162.w),
                width: 18.w,
                height: 18.h,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.red, width: 5.w),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(60)),
              ),
            ),

          ],
        ),
      ),
    );
  }
  void showDetalis() {
    showDialog(
      context: context,
      builder: (context) {
        return DetailsFloorStatusMohamedAli();
      },
    );
  }
  void showDetalis1() {
    showDialog(
      context: context,
      builder: (context) {
        return DetailsFloorStatusMohamedAli1();
      },
    );
  }
  void showDetalis2() {
    showDialog(
      context: context,
      builder: (context) {
        return DetailsFloorStatusMohamedAli2();
      },
    );
  }
  void showDetalis3() {
    showDialog(
      context: context,
      builder: (context) {
        return DetailsFloorStatusMohamedAli3();
      },
    );
  }



}
