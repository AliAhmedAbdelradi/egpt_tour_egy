import 'package:ept_mate/screens/abo_sample_interactiveMap/details_floor_status.dart';
import 'package:ept_mate/screens/abo_sample_interactiveMap/details_floor_status1.dart';
import 'package:ept_mate/screens/abo_sample_interactiveMap/details_floor_status2.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../select_city/btn1.dart';

class InteractiveMapAboSample extends StatefulWidget {
  static const String routeName = "InteractiveMapAboSample";

  @override
  State<InteractiveMapAboSample> createState() =>
      _InteractiveMapAboSampleState();
}

class _InteractiveMapAboSampleState extends State<InteractiveMapAboSample> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/abo_sample_interactiveMap.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Align(
              heightFactor: 29.9.h,
              widthFactor: 19.w,
              child: InkWell(
                onTap: () {
                  setState(() {
                    showDetalis2();
                  });
                },
                child: Container(
                  width: 14.w,
                  height: 14.h,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.red, width: 4.5.w),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(60)),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  showDetalis1();
                });
              },
              child: Container(
                margin: EdgeInsets.only(right: 135.w, top: 25.w),
                width: 14.w,
                height: 14.h,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.red, width: 4.5.w),
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
                margin: EdgeInsets.only(top: 113.h, right: 76.w),
                width: 14.w,
                height: 14.h,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.red, width: 4.5.w),
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
        return DetailsFloorStatus();
      },
    );
  }

  void showDetalis1() {
    showDialog(
      context: context,
      builder: (context) {
        return DetailsFloorStatus1();
      },
    );
  }

  void showDetalis2() {
    showDialog(
      context: context,
      builder: (context) {
        return DetailsFloorStatus2();
      },
    );
  }
}
