import 'package:ept_mate/screens/Amanda_tempel_interactiveMap/details_floor_status_Amanda.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../select_city/btn1.dart';

class InteractiveMapAmanda extends StatefulWidget {
  static const String routeName = "InteractiveMapAmanda";

  @override
  State<InteractiveMapAmanda> createState() => _InteractiveMapAboSampleState();
}

class _InteractiveMapAboSampleState extends State<InteractiveMapAmanda> {
  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/Amanda_tempel_interactiveMap.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: InkWell(
            onTap: () {
              setState(() {
                showDetalis();
              });
            },
            child: Container(
              margin: EdgeInsets.only(top: 115.h),
              width: 18.w,
              height: 18.h,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.red, width: 5.w),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(60)),
            ),
          ),
        ),
      ),
    );
  }

  void showDetalis() {
     Navigator.pushNamed(context, DetailsFloorStatusAmanda.routeName);
  }
}
