import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../select_city/btn1.dart';
import 'detalis_floor.dart';

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
              InkWell(
                onTap: () {
                  setState(() {});
                  showDetalis();
                },
                child: Container(
                  margin: EdgeInsets.only(top: 35.h, left: 205.w),
                  width: 12.w,
                  height: 12.h,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white,width: 1.w),
                      color: Colors.red, borderRadius: BorderRadius.circular(60)),
                ),
              )

            ],
          ),

          Btn1(
            Color(0xFF89C9FF),
            Colors.white,
            "Back",
                () {
              Navigator.pop(context);
            },
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
}
