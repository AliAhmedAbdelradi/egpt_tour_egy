import 'package:ept_mate/model/Generated.dart';
import 'package:ept_mate/screens/AddPlace.dart';
import 'package:ept_mate/screens/home.dart';
import 'package:ept_mate/screens/tabs/tripPlans_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../api_manager/api_manager.dart';
import '../../../model/trip.dart';
import '../../select_city/btn1.dart';
import '../counter_screen/daysGeneratedcounter.dart';
import '../name_screen/shareData.dart';
import '../selectCategory_screen/SelectCategory_screen.dart';
import '../selectCity_screen/SelectCityGenerated_Screen.dart';

class AddGeneratedScreen extends StatefulWidget {
  static const String routeName = "AddGeneratedScreen";

  final Trip trip;

  AddGeneratedScreen({super.key, required this.trip});

  @override
  State<AddGeneratedScreen> createState() => _PlanDetailsState();
}

class _PlanDetailsState extends State<AddGeneratedScreen> {
  List<List<String>> places = [];
  String tripName = SharedData().tripName;
  List<int> selectedCityIds = SharedDataCity.selectedCityIds;
 // List<int> daysValues = SharedDataCounter().daysValues;



  @override
  void initState() {
    super.initState();
    places = List.generate(widget.trip.dayNums!.length, (index) => []);
  }

  @override
  Widget build(BuildContext context) {
    print(SharedDataCounter().daysValues);

    DateTime? start = widget.trip.startDate;
    var dates = List.generate(widget.trip.dayNums!.length + 1, (index) {
      return start!.add(Duration(
          days: widget.trip.dayNums!.sublist(0, index).fold(0, (a, b) => a + b)));
    });

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                HomeScreen.routeName,
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
      body: FutureBuilder(
        future: ApiManager.getGeneratedTrips(categoryIDs:SelectedCategoryIds.ids,cityIDs:selectedCityIds ,durations:SharedDataCounter().daysValues ,name:tripName
          ),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text("no data entered"));
          }

          final category = snapshot.data?.data??[];




          return ListView(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            children: [
              ...List.generate(widget.trip.dayNums!.length, (index) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(17),
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("${category[index].cityName}",
                                  style: GoogleFonts.poppins(
                                      fontSize: 25,
                                      color: Colors.white,
                                      fontWeight: FontWeight.normal)),
                            ),
                            Spacer(),
                            Text("${widget.trip.dayNums![index]} days",
                                style: GoogleFonts.poppins(
                                    fontSize: 25,
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal)),
                          ],
                        ),
                        height: 77.h,
                        width: 360.w,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image:
                                 NetworkImage(category[index].cityImage??""),
                                // This should be dynamic
                                fit: BoxFit.fill,
                                opacity: .9),
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                                width: 1.5.w, color: Colors.transparent)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.calendar_month),
                          SizedBox(width: 10.w),
                          Text(
                            "from (${dates[index].day}) to (${dates[index + 1].day}) ",
                            style: GoogleFonts.poppins(
                                color: Colors.black87, fontSize: 25),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          ...List.generate(
                            places[index].length,
                                (placeIndex) {
                              return Row(
                                children: [

                                  Container(
                                    margin: EdgeInsets.only(left: 13.w),
                                    height: 40.h,
                                    width: 130.w,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              "${places[index][placeIndex]}"),
                                          fit: BoxFit.cover,
                                          opacity: 0.7),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        places[index].removeAt(placeIndex);
                                      });
                                    },
                                    icon: Icon(Icons.delete),
                                    color: Colors.red,
                                  )
                                ],
                              );
                            },
                          ).toList(),
                          InkWell(
                            onTap: () async {
                              var selectedData = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AddPlace(
                                          placeID:
                                          '${widget.trip.placesID![index]}')));
                              if (selectedData != null) {
                                setState(() {
                                  places[index].add(selectedData);
                                  places[index] = places[index].toSet().toList();
                                });
                              }
                            },
                            child: Container(
                              child: Center(
                                  child: Text(
                                    "+Add place",
                                    style: GoogleFonts.poppins(
                                        fontSize: 15,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500),
                                  )),
                              height: 27.h,
                              width: 120.w,
                              decoration: BoxDecoration(
                                color: Color(0xff89C9FF),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }),
              SizedBox(height: 70.h,),

              Row(
                children: [
                  Btn1(Color(0xFF89C9FF), Colors.white, "Back", () {
                    Navigator.pop(context);
                  }),
                  Spacer(),
                  Btn1(Colors.white, Color(0xff89C9FF), "Save", () {
                    Navigator.pushNamed(context, TripPlansTab.routeName);
                  }),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
