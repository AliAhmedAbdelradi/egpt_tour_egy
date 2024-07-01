import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

import '../../../api_manager/api_manager.dart';
import '../../home.dart';
import '../../plan_type_screen/plan_type.dart';
import '../../select_city/Select_City_Screen.dart';
import '../../select_city/btn1.dart';
import '../../../model/trip.dart';
import '../selectCity_screen/SelectCityGenerated_Screen.dart';

class SelectCategoryGenerated extends StatefulWidget {
  static const String routeName = "SelectCategoryGenerated";
  final String CategoryId;

  SelectCategoryGenerated({required this.CategoryId});

  @override
  State<SelectCategoryGenerated> createState() => _SelectCategoryState();
}

class _SelectCategoryState extends State<SelectCategoryGenerated> {
  Trip trip = Trip();
  List<bool> categorySelected = [false, false, false, false]; // Track category selection
  List<int> selectedIDS = []; // List to store selected countries ids

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.popAndPushNamed(context, HomeScreen.routeName);
          },
          icon:   Icon(
            Icons.cancel_outlined,
            color: Colors.black,
            size: 30.w,
          ),
        ),
        actions: [
          ImageIcon(
            AssetImage("assets/images/logo.png"),
            color: Colors.black,
            size: 50.w,
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: FutureBuilder(
        future: ApiManager.getCategory(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text("Error"));
          }
          final cate = snapshot.data?.data ?? [];

          return Padding(
            padding: const EdgeInsets.all(13),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Select Tourism Category ",
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 35.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  "Step 2",
                  style: GoogleFonts.poppins(
                    color: Colors.black38,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 30.h),
                buildCategorySelection(cate[0], 0),
                SizedBox(height: 20.h),
                buildCategorySelection(cate[1], 1),
                SizedBox(height: 20.h),
                buildCategorySelection(cate[2], 2),
                SizedBox(height: 20.h),
                buildCategorySelection(cate[3], 3),
                SizedBox(height: 40.h),
                Spacer(),
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
                        // Check if at least one category is selected
                        bool anyCategorySelected =
                        categorySelected.any((selected) => selected);
                        if (anyCategorySelected) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => SelectCityGenerated(trip: trip),
                            ),
                          );
                        } else {
                          // Show SnackBar if no category is selected
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text( textAlign: TextAlign.center,
                                'Please! select category to continue.',style: GoogleFonts.poppins(
                                    fontSize: 15.sp,
                                    color:Colors.white,
                                    fontWeight: FontWeight.normal),),
                              duration: Duration(seconds: 2),
                            ),
                          );
                        }
                      },
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }

  // Inside _SelectCategoryState class

  Widget buildCategorySelection(dynamic category, int index) {
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
                child: Image.network(category.imageLink ?? ""),
              ),
              SizedBox(width: 15.w),
              Text(
                category.name ?? "",
                style: GoogleFonts.poppins(
                  fontSize: 17,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
            ],
          ),
        ),
        SizedBox(width: 5.w),

        InkWell(
          child: RoundCheckBox(
            size: 25.sp,
            onTap: (selected) {

                categorySelected[index] = selected!;
                if (selected) {
                  selectedIDS.add(category.id ?? 0);
                  SelectedCategoryIds.ids.add(category.id ?? 0); // Add to shared class
                } else {
                  selectedIDS.remove(category.id ?? 0);
                  SelectedCategoryIds.ids.remove(category.id ?? 0); // Remove from shared class
                }

            },
            isChecked: categorySelected[index],
            border: Border.all(width: 1.w),
            uncheckedWidget: Icon(Icons.close, color: Colors.white),
          ),
          onTap: () {},
        ),
      ],
    );
  }

}
class SelectedCategoryIds {
  static List<int> ids = []; // List to hold selected category IDs
}

