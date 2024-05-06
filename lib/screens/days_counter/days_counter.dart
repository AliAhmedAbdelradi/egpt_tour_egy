import 'package:ept_mate/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../model/CustomizePlaces.dart';
import '../../model/trip.dart';
import '../date_screen/date_screen.dart';
import '../plan_type_screen/plan_type.dart';

import 'btn2.dart';
import 'days_container.dart';

class DaysCounter extends StatefulWidget {
  static const String routeName = "DaysCounter";

  DaysCounter({
    super.key,
    required this.countrySelected,
    required this.trip,
    this.cityId,
    this.catId,
  });

  final List<String> countrySelected;
  Trip trip;

  int? catId;
  int? cityId;

  @override
  State<DaysCounter> createState() => _DaysCounterState();
}

class _DaysCounterState extends State<DaysCounter> {
  int valueG = 0;
  int valueC = 0;
  int valueA = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.popAndPushNamed(context, HomeScreen.routeName);
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
            Text("How many days are you staying?",
                style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 35,
                    fontWeight: FontWeight.w600)),
            SizedBox(
              height: 10.h,
            ),
            Text("Step 4",
                style: GoogleFonts.poppins(
                    color: Colors.black38,
                    fontSize: 15,
                    fontWeight: FontWeight.w600)),
            SizedBox(
              height: 10.h,
            ),


            Expanded(
              child: Column(
                children: [
                  contain("${widget.countrySelected[0]??""}", "$valueG", () {
                    setState(() {});
                    valueG++;
                  }, () {
                    setState(() {
                      if (valueG > 0) {
                        valueG--;
                      } else {
                        valueG = 0;
                      }
                    });
                  }),
                  SizedBox(
                    height: 20.h,
                  ),
                  contain("${widget.countrySelected[1]??""}", "$valueC", () {
                    setState(() {});
                    valueC++;
                  }, () {
                    setState(() {
                      if (valueC > 0) {
                        valueC--;
                      } else {
                        valueC = 0;
                      }
                    });
                  }),
                  SizedBox(
                    height: 20.h,
                  ),
                  contain("${widget.countrySelected[2]??""}", "$valueA", () {
                    setState(() {});
                    valueA++;
                  }, () {
                    setState(() {
                      if (valueA > 0) {
                        valueA--;
                      } else {
                        valueA = 0;
                      }
                    });
                  }),
                ],
              ),
            ),
            Row(
              children: [
                Btn2(Color(0xFF89C9FF), Colors.white, "Back", () {
                  Navigator.pop(context);
                }),
                Spacer(),
                Btn2(Colors.white, Color(0xFF89C9FF), "Continue", () {
                  widget.trip.dayNums=[valueG,valueC,valueA];
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>DateScreen(trip: widget.trip,)));
                }),
              ],
            )
          ],
        ),
      ),
    );
  }
}