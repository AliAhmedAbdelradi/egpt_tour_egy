import 'package:ept_mate/constant/constant.dart';
import 'package:ept_mate/screens/plan_type_screen/shape_plan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../customize_screen/create_trip/create_trip_screen.dart';
import '../home.dart';
import '../readyTrips/readytrip.dart';
class PlanType extends StatelessWidget {
  static const String routeName = "plan";
  const PlanType({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                HomeScreen.routeName,
                (route) => false,
              );
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 30,
            )),
        actions: [
          ImageIcon(
            AssetImage("assets/images/logo.png"),
            color: Colors.black,
            size: 50,
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Trip Plans ",
                style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 35,
                    fontWeight: FontWeight.w600)),
            Text("Choose Type",
                style: GoogleFonts.poppins(
                    color: Colors.black38,
                    fontSize: 15,
                    fontWeight: FontWeight.w600)),
            SizedBox(
              height: 30.h,
            ),
            ShapePlan("assets/images/3.png", "Customize", () {
              Navigator.pushNamed(context, CreateTrip.routeName);
            }),
            SizedBox(
              height: 20.h,
            ),
            ShapePlan("assets/images/2.png", "Generate", () {}),
            SizedBox(
              height: 20.h,
            ),
            ShapePlan("assets/images/Rectangle 5.png", "Ready made", () {
              Navigator.pushNamed(context, Readymade.routeName);
            }),


          ],
        ),
      ),
    );
  }
}
