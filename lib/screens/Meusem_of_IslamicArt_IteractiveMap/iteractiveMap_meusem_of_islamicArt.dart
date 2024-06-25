import 'package:ept_mate/screens/Coptic_Meusem_InteractiveMap/details_floor_status_copticMeusem.dart';
import 'package:ept_mate/screens/Coptic_Meusem_InteractiveMap/details_floor_status_copticMeusem1.dart';
import 'package:ept_mate/screens/Coptic_Meusem_InteractiveMap/details_floor_status_copticMeusem2.dart';
import 'package:ept_mate/screens/Meusem_of_IslamicArt_IteractiveMap/details_floor_status_MeusemOfIslamicArt.dart';
import 'package:ept_mate/screens/Meusem_of_IslamicArt_IteractiveMap/details_floor_status_MeusemOfIslamicArt1.dart';
import 'package:ept_mate/screens/Meusem_of_IslamicArt_IteractiveMap/details_floor_status_MeusemOfIslamicArt2.dart';
import 'package:ept_mate/screens/abo_sample_interactiveMap/details_floor_status.dart';
import 'package:ept_mate/screens/abo_sample_interactiveMap/details_floor_status1.dart';
import 'package:ept_mate/screens/abo_sample_interactiveMap/details_floor_status2.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../select_city/btn1.dart';

class InteractiveMapMeusemOfIslamicArt extends StatefulWidget {
  static const String routeName = "InteractiveMapMeusemOfIslamicArt";

  const InteractiveMapMeusemOfIslamicArt({super.key});

  @override
  State<InteractiveMapMeusemOfIslamicArt> createState() =>
      _InteractiveMapAboSampleState();
}

class _InteractiveMapAboSampleState extends State<InteractiveMapMeusemOfIslamicArt> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/mapkcal2.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 220.h,),
            InkWell(
              onTap: () {
                setState(() {
                  showDetalis2();
                });
              },
              child: Container(
                 margin: EdgeInsets.only(left: 93.w),
                width: 18.w,
                height: 18.h,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.red, width: 5.w),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(60)),
              ),
            ),
            SizedBox(height: 25.h,),
            InkWell(
              onTap: () {
                setState(() {
                  showDetalis1();
                });
              },
              child: Container(
                margin: EdgeInsets.only(left: 105.w,bottom: 20.h),
                width: 18.w,
                height: 18.h,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.red, width: 5.w),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(60)),
              ),
            ),
            SizedBox(height: 25.h,),

            InkWell(
              onTap: () {
                setState(() {
                  showDetalis();
                });
              },
              child: Container(
                margin: EdgeInsets.only(left: 133.w,top: 35.h),
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
     Navigator.pushNamed(context, DetailsFloorStatusMeusemOfIslamicArt.routeName);
  }

  void showDetalis1() {
    Navigator.pushNamed(context, DetailsFloorStatusMeusemOfIslamicArt1.routeName);
  }

  void showDetalis2() {
    Navigator.pushNamed(context, DetailsFloorStatusMeusemOfIslamicArt2.routeName);
  }
}
