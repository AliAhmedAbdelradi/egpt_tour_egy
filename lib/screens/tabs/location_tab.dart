import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../request_ride/categ_ride.dart';


class LocationTab extends StatelessWidget {
  static const String routeName = "location";
  const LocationTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(25),
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
                Icon(Icons.location_on,color:Colors.blue ,)
              ],
            ),

            SizedBox(
              height: 20.h,
            ),
            Divider(color: Colors.black12,),
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
            Divider(color: Colors.black12,),
            SizedBox(
              height: 15.h,
            ),
            CateRide(
                "Mini Bus",
                "assets/images/mdi_car-sports-utility-vehicle.png","73","5 - 45 km/h"
            ),
            SizedBox(
              height: 15.h,
            ),
            CateRide(
                "Limousin",
                "assets/images/mdi_car-sports.png","18","5 - 80 km/h"
            ),
            SizedBox(
              height: 35.h,
            ),
            CateRide(
                "Car",
                "assets/images/mdi_car-limousine.png","27","5 - 80 km/h"
            ),
            SizedBox(
              height: 35.h,
            ),


            ElevatedButton(
                style: ButtonStyle(minimumSize: MaterialStatePropertyAll(Size(100, 30)),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(
                          color: Colors.white,
                          width: 0,
                        ))),
                    backgroundColor:
                    MaterialStatePropertyAll(Color(0xFF89C9FF))),
                onPressed: () {

                },
                child: Text(
                  "Request Offer",
                  style: GoogleFonts.poppins(color: Colors.white,fontSize: 18),
                ))
          ],
        ),
      ),
    );
  }
}
