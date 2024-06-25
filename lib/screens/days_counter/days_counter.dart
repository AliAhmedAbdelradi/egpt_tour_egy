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
  // Create a list to hold the values for each country
  List<int> daysValues = [];

  @override
  void initState() {
    super.initState();
    // Initialize the daysValues list with zeros
    daysValues = List<int>.filled(widget.countrySelected.length, 0);
  }

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
              child: ListView.builder(
                itemCount: widget.countrySelected.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      contain(
                        "${widget.countrySelected[index] ?? ""}",
                        "${daysValues[index]}",
                            () {
                          setState(() {
                            daysValues[index]++;
                          });
                        },
                            () {
                          setState(() {
                            if (daysValues[index] > 0) {
                              daysValues[index]--;
                            } else {
                              daysValues[index] = 0;
                            }
                          });
                        },
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                    ],
                  );
                },
              ),
            ),
            Row(
              children: [
                Btn2(Color(0xFF89C9FF), Colors.white, "Back", () {
                  Navigator.pop(context);
                }),
                Spacer(),
                Btn2(Colors.white, Color(0xFF89C9FF), "Continue", () {
                  widget.trip.dayNums = daysValues;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DateScreen(trip: widget.trip),
                    ),
                  );
                }),
              ],
            )
          ],
        ),
      ),
    );
  }
}
