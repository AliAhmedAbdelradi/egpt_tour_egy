import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../select_city/btn1.dart';
import 'room12/detailsFloor2.dart';
import 'room3/detalis_floor.dart';

class InteractiveMap extends StatefulWidget {
  static const String routeName = "interactive";

  @override
  State<InteractiveMap> createState() => _InteractiveMapState();
}

class _InteractiveMapState extends State<InteractiveMap> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Stack(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Container(
                    margin: EdgeInsets.only(top: 30.h),
                    height: 600.h,
                    width: 700.w,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/map.jpeg"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {});
                      showDetalis();
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 35.h, left: 205.w),
                      width: 13.w,
                      height: 13.h,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.red, width: 4.5.w),
                          color: Colors.white, borderRadius: BorderRadius.circular(60)),
                    ),
                  ),
                  SizedBox(height: 55.h,),
                  InkWell(
                    onTap: () {
                      setState(() {});
                      showDetalisFloor();
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 35.h, left: 110.w),
                      width: 13.w,
                      height: 13.h,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.red, width: 4.5.w),
                          color: Colors.white, borderRadius: BorderRadius.circular(60)),
                    ),
                  ),
                ],
              )

            ],
          ),


        ],
      ),
    );
  }

  void showDetalis() {
    showDialog(
      context: context,
      builder: (context) {
        return DetailsFloor();
      },
    );
  }
  void showDetalisFloor() {
    showDialog(
      context: context,
      builder: (context) {
        return DetailsFloor2();
      },
    );
  }
}
