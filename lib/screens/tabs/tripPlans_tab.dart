
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constant/constant.dart';
import '../customize_screen/create_trip/create_trip_screen.dart';
import '../fastTrip/FastTrip.dart';
import '../plan_type_screen/shape_plan.dart';
import '../readyTrips/readytrip.dart';
import '../request_ride/categ_ride.dart';


class TripPlansTab extends StatelessWidget {
  static const String routeName = "tripPlans";
  const TripPlansTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
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
              SizedBox(
                height: 20.h,
              ),
              TextButton(onPressed: (


                  ){
                Navigator.pushNamed(context, FastTrip.routeName);
              }, child: Text("are you need fast trip?",style: TextStyle(color: primaryColor,fontWeight: FontWeight.bold,fontSize: 19),))
            ],
          ),
        ),
      ),
    );
  }
}
