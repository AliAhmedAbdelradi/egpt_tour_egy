import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      body: Stack(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Container(
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
              margin: EdgeInsets.only(top: 46.h, left: 205.w),
              width: 12.w,
              height: 12.h,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white,width: 1.w),
                  color: Colors.red, borderRadius: BorderRadius.circular(60)),
            ),
          )
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
