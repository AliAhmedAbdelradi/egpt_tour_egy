import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../customize_screen/create_trip/shape_plan_create.dart';
import '../name_screen/name_generated_screen.dart';

class CreateGenerated extends StatelessWidget {
  const CreateGenerated({super.key});
  static const String routeName = "CreateGenerated";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 30.w,
            )),
        actions: [
          ImageIcon(
            AssetImage("assets/images/logo.png"),
            color: Colors.black,
            size: 50.w,
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("My Trips ",
                style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 35.sp,
                    fontWeight: FontWeight.w600)),
            Text("Your trip to egypt starts here",
                style: GoogleFonts.poppins(
                    color: Colors.black38,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600)),


            SizedBox(
              height: 20.h,
            ),
            ShapePlanCreate("assets/images/create_trip.png", "Create  A  Trip",
                "Create a fully customized day-by-day itherary \n and discover the hidden gems of egypt",
                    () {
                  Navigator.pushNamed(context, CreateNameOfGeneratedTrip.routeName);
                }),
            SizedBox(
              height: 35.h,
            ),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, CreateNameOfGeneratedTrip.routeName);

                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.add,
                        size: 21.w,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        "Create Trip",
                        style: TextStyle(color: Color(0xFF89C9FF), fontSize: 18.sp),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  width: 40.w,
                ),
                Text(
                  "|",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w100,
                      fontSize: 20.sp),
                ),
                SizedBox(
                  width: 25.w,
                ),
                Icon(
                  Icons.watch_later_outlined,
                  size: 21.w,
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  "View History",
                  style: TextStyle(color: Color(0xFF89C9FF), fontSize: 18.sp),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
