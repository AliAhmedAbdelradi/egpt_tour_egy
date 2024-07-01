import 'package:ept_mate/model/trip.dart';
import 'package:ept_mate/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

import 'package:ept_mate/screens/days_counter/days_counter.dart';
import '../../../api_manager/api_manager.dart';
import '../../select_city/btn1.dart';
import '../counter_screen/daysGeneratedcounter.dart';


class SelectCityGenerated extends StatefulWidget {
  static String routeName = "SelectCityGenerated";
  final Trip trip;

  SelectCityGenerated({required this.trip});

  @override
  State<SelectCityGenerated> createState() => _SelectCityState();
}

class _SelectCityState extends State<SelectCityGenerated> {
  List<String> selectedCountries = [];
  List<int> selectedIDS = [];
  bool isDataLoading = false;

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
      body: FutureBuilder(
        future: ApiManager.getCity(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text("Error"));
          }
          final categories = snapshot.data?.data ?? [];

          return Padding(
            padding: EdgeInsets.all(13),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Where are you going?",
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 35,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    "Step 3",
                    style: GoogleFonts.poppins(
                      color: Colors.black38,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 30.h),
                  SingleChildScrollView(
                    child: Column(
                      children: List.generate(categories.length, (index) {
                        final city = categories[index];
                        return Row(
                          children: [
                            Container(
                              height: 71.h,
                              width: 300.w,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(width: 0, color: Colors.black),
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Image.network(
                                      city.imageLink ?? "",
                                      width: 100.w,
                                      height: 90.w,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(width: 20.w),
                                  Text(
                                    city.name ?? "",
                                    style: GoogleFonts.poppins(
                                        fontSize: 17,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 5.w),
                            InkWell(
                              child: RoundCheckBox(
                                size: 25,
                                onTap: (selected) {

                                    if (selectedCountries.contains(city.name)) {
                                      selectedCountries.remove(city.name);
                                      selectedIDS.remove(city.id);
                                    } else {
                                      selectedCountries.add(city.name ?? "");
                                      selectedIDS.add(city.id ?? 0);
                                      widget.trip.cityName = selectedCountries;
                                      SharedDataCity.selectedCityIds = selectedIDS; // Update shared data
                                    }

                                },
                                border: Border.all(
                                  width: 1,
                                ),
                                uncheckedWidget: Icon(Icons.close, color: Colors.white),
                              ),
                            ),
                          ],
                        );
                      }),
                    ),
                  ),
                  SizedBox(height: 40.h),
                  Row(
                    children: [
                      Btn1(
                        Color(0xFF89C9FF),
                        Colors.white,
                        "Back",
                            () {
                          Navigator.pop(context);
                        },
                      ),
                      Spacer(),
                      Btn1(
                        Colors.white,
                        Color(0xFF89C9FF),
                        "Continue",
                            () {
                          if (selectedCountries.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Please choose city to continue.',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                    fontSize: 15,
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                duration: Duration(seconds: 2),
                              ),
                            );
                          } else {
                            widget.trip.placesID = selectedIDS;
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => DaysGeneratedCounter(
                                  countrySelected: selectedCountries,
                                  trip: widget.trip,
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
        },
      ),
    );
  }
}

class SharedDataCity {
  static List<int> selectedCityIds = [];
}
