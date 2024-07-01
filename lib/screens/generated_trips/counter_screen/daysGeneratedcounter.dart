

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../model/trip.dart';

import '../../days_counter/btn2.dart';
import '../../days_counter/days_container.dart';
import '../../home.dart';
import '../data_screen/dateGeneratedscreen.dart';

class DaysGeneratedCounter extends StatefulWidget {
  static const String routeName = "DaysGeneratedCounter";

  final List<String> countrySelected;
  final Trip trip;
  final int? catId;
  final int? cityId;

  DaysGeneratedCounter({
    Key? key,
    required this.countrySelected,
    required this.trip,
    this.catId,
    this.cityId,
  }) : super(key: key);

  @override
  State<DaysGeneratedCounter> createState() => _DaysCounterState();
}

class _DaysCounterState extends State<DaysGeneratedCounter> {
  // Reference to the shared data instance
  SharedDataCounter _sharedData = SharedDataCounter();

  @override
  void initState() {
    super.initState();
    // Initialize the daysValues list with zeros
    _sharedData.daysValues = List<int>.filled(widget.countrySelected.length, 0);
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
          ),
        ),
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
            Text(
              "How many days are you staying?",
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: 35,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              "Step 4",
              style: GoogleFonts.poppins(
                color: Colors.black38,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
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
                        "${_sharedData.daysValues[index]}",
                            () {
                          setState(() {
                            _sharedData.daysValues[index]++;
                          });
                        },
                            () {
                          setState(() {
                            if (_sharedData.daysValues[index] > 0) {
                              _sharedData.daysValues[index]--;
                            } else {
                              _sharedData.daysValues[index] = 0;
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
                Btn2(
                  Color(0xFF89C9FF),
                  Colors.white,
                  "Back",
                      () {
                    Navigator.pop(context);
                  },
                ),
                Spacer(),
                Btn2(
                  Colors.white,
                  Color(0xFF89C9FF),
                  "Continue",
                      () {
                    // Check if all daysValues are greater than zero
                    bool allDaysSelected = true;
                    for (int days in _sharedData.daysValues) {
                      if (days <= 0) {
                        allDaysSelected = false;
                        break;
                      }
                    }
                    if (allDaysSelected) {
                      widget.trip.dayNums = _sharedData.daysValues;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DateGeneratedScreen(trip: widget.trip),
                        ),
                      );
                    } else {
                      // Show a snackbar or dialog to prompt user to select days for all countries
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Number of days can not be 0',
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
                    }
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}


// shared_data.dart

class SharedDataCounter {
  List<int> daysValues = [];

  // Singleton instance
  static final SharedDataCounter _instance = SharedDataCounter._internal();

  factory SharedDataCounter() {
    return _instance;
  }

  SharedDataCounter._internal();
}

