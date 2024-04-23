import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../api_manager/api_manager.dart';
import '../plan_type_screen/plan_type.dart';
import 'btn1.dart';
import 'package:ept_mate/screens/days_counter/days_counter.dart';

class SelectCity extends StatefulWidget {
  static String routeName = "select city";
  final String CategoryId;

  SelectCity({required this.CategoryId});

  @override
  State<SelectCity> createState() => _SelectCityState();
}

class _SelectCityState extends State<SelectCity> {
  List<String> selectedCountries = []; // List to store selected countries

  // Fetching state
  bool isDataLoading = false;

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
                  // Displaying categories
                  Column(
                    children: List.generate(categories.length, (index) {
                      final category = categories[index];
                      return InkWell(
                        onTap: () {
                          setState(() {
                            if (selectedCountries.contains(category.name)) {
                              selectedCountries.remove(category.name);
                            } else {
                              selectedCountries.add(category.name??"");
                            }
                          });
                        },
                        child: Row(
                          children: [
                            Container(
                              height: 71.h,
                              width: 260.w,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(width: 0, color: Colors.black),
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Image.network(category.imageLink ?? ""),
                                  ),
                                  SizedBox(width: 20.w),
                                  Text(
                                    category.name ?? "",
                                    style: TextStyle(fontSize: 20, color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 30.w),
                            Visibility(
                              visible: selectedCountries.contains(category.name),
                              child: Icon(
                                Icons.done_all,
                                size: 20,
                                color: Colors.green,
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => DaysCounter(
                                countrySelected: selectedCountries,

                                // Pass selected countries
                              ),
                            ),
                          );
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
