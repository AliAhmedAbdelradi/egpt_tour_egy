
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../days_counter/days_counter.dart';
import '../plan_type_screen/plan_type.dart';
import 'btn1.dart';
import 'city_image.dart';

class SelectCity extends StatelessWidget {
  const SelectCity({super.key});
  static const String routeName = "select city";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.popAndPushNamed(context, PlanType.routeName);
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
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("where are you going ?",
                style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 35,
                    fontWeight: FontWeight.w600)),
            SizedBox(
              height: 10.h,
            ),
            Text("Step 3",
                style: GoogleFonts.poppins(
                    color: Colors.black38,
                    fontSize: 15,
                    fontWeight: FontWeight.w600)),
            SizedBox(
              height: 30.h,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CityImg(
                      "Giza               ",
                      "assets/images/giza.png",
                      
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    CityImg(
                      "Cairo",
                      "assets/images/cairo.png",
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    CityImg(
                      "Luxor",
                      "assets/images/Luxor.png",
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    CityImg(
                      "Aswan",
                      "assets/images/Aswan.png",
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    CityImg(
                      "Hurghada",
                      "assets/images/Hurghada.png",
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                  ],
                ),
              ),
            ),
           
            Row(
              children: [
                Btn1(Color(0xFF89C9FF), Colors.white, "Back", () {
                  Navigator.pop(context);
                }),
                Spacer(),
                Btn1(Colors.white, Color(0xFF89C9FF), "Continue", () {
                  Navigator.pushNamed(context, DaysCounter.routeName);
                }),
              ],
            )
          ],
        ),
      ),
    );
  }
}
