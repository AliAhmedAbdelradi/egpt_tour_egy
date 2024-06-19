import 'package:ept_mate/screens/Coptic_Meusem_InteractiveMap/details_floor_status_copticMeusem.dart';
import 'package:ept_mate/screens/Coptic_Meusem_InteractiveMap/details_floor_status_copticMeusem1.dart';
import 'package:ept_mate/screens/Coptic_Meusem_InteractiveMap/details_floor_status_copticMeusem2.dart';
import 'package:ept_mate/screens/abo_sample_interactiveMap/details_floor_status.dart';
import 'package:ept_mate/screens/abo_sample_interactiveMap/details_floor_status1.dart';
import 'package:ept_mate/screens/abo_sample_interactiveMap/details_floor_status2.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../select_city/btn1.dart';

class InteractiveMapCopticMeusem extends StatefulWidget {
  static const String routeName = "InteractiveMapCopticMeusem";

  const InteractiveMapCopticMeusem({super.key});

  @override
  State<InteractiveMapCopticMeusem> createState() =>
      _InteractiveMapAboSampleState();
}

class _InteractiveMapAboSampleState extends State<InteractiveMapCopticMeusem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/copticMeusem_interactiveMap.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(

        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            //SizedBox(height: 400.h,),
            Row(

              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      showDetalis1();
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: 90.h,left: 80.w),
                    width: 18.w,
                    height: 18.h,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.red, width: 5.w),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(60)),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      showDetalis2();
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: 255.h,left: 20.w),
                    width: 18.w,
                    height: 18.h,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.red, width: 5.w),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(60)),
                  ),
                ),

                InkWell(
                  onTap: () {
                    setState(() {
                      showDetalis();
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: 5.h,left: 115.w),
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

          ],
        ),
      ),
    );
  }

  void showDetalis() {
    showDialog(
      context: context,
      builder: (context) {
        return DetailsFloorStatusCopticMeusem();
      },
    );
  }

  void showDetalis1() {
    showDialog(
      context: context,
      builder: (context) {
        return DetailsFloorStatusCopticMeusem1();
      },
    );
  }

  void showDetalis2() {
    showDialog(
      context: context,
      builder: (context) {
        return DetailsFloorStatusCopticMeusem2();
      },
    );
  }
}
