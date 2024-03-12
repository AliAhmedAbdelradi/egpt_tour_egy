

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../plan_type_screen/plan_type.dart';
import '../select_city/btn1.dart';
import 'categ_ride.dart';

class RideRiquest extends StatelessWidget {
  static const String routeName = "ride";

  const RideRiquest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  PlanType.routeName,
                      (route) => false,
                );
              },
              icon: Icon(
                Icons.cancel_outlined,
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
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Ride request",
                  style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 35,
                      fontWeight: FontWeight.w600)),
              SizedBox(
                height: 35.h,
              ),
              Row(
                children: [
                  Text("Return to same Location",
                      style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w600)),
                  Spacer(),
                  Icon(
                    Icons.location_on,
                    color: Colors.blue,
                  )
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Divider(
                color: Colors.black12,
              ),
              SizedBox(
                height: 15.h,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.car_repair),
                  SizedBox(
                    width: 15.h,
                  ),
                  Text("Pickup Location",
                      style: GoogleFonts.poppins(
                          color: Colors.black87,
                          fontSize: 15,
                          fontWeight: FontWeight.w600)),
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
              Divider(
                color: Colors.black12,
              ),
              SizedBox(
                height: 15.h,
              ),
              CateRide(
                  "Mini Bus",
                  "assets/images/mdi_car-sports-utility-vehicle.png",
                  "73",
                  "5 - 45 km/h"),
              SizedBox(
                height: 15.h,
              ),
              CateRide("Limousin", "assets/images/mdi_car-sports.png", "18",
                  "5 - 80 km/h"),
              SizedBox(
                height: 35.h,
              ),
              CateRide("Car", "assets/images/mdi_car-limousine.png", "27",
                  "5 - 80 km/h"),


              SizedBox(height: 50.h,),
              Row(
                children: [
                  Btn1(Color(0xFF89C9FF), Colors.white, "Back", () {
                    Navigator.pop(context);
                  }),
                  Spacer(),
                  Btn1(Colors.white, Color(0xFF89C9FF), "Request Offer", () {

                  }),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
