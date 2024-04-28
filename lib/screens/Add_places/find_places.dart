
import 'package:ept_mate/screens/days_counter/days_counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../model/trip.dart';
import '../plan_type_screen/plan_type.dart';
import '../request_ride/ride_request.dart';
import '../select_city/btn1.dart';

class Add_places extends StatefulWidget {
  static const String routeName = "add places";
   Add_places( {required this.trip});
  Trip trip;

  @override
  State<Add_places> createState() => _Add_placesState();
}

class _Add_placesState extends State<Add_places> {



  @override
  Widget build(BuildContext context) {
    int? first= widget.trip.dayNums?[0];
    int? second= widget.trip.dayNums?[1];
    int? third= widget.trip.dayNums?[2];


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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("$first",
                              style: TextStyle(
                                  fontSize: 20, color: Color(0xff89C9FF))),
                          Text("days",
                              style: TextStyle(
                                  fontSize: 20, color: Color(0xff89C9FF))),
                          Text("cairo",
                              style: TextStyle(
                                fontSize: 15,
                              )),
                        ],
                      ),
                      height: 80.h,
                      width: 84.w,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 1.5, color: Colors.black))),
                  SizedBox(
                    width: 40.w,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("$second",
                                style: TextStyle(
                                    fontSize: 20, color: Color(0xff89C9FF))),
                            Text("days",
                                style: TextStyle(
                                    fontSize: 20, color: Color(0xff89C9FF))),
                            Text("Luxor",
                                style: TextStyle(
                                  fontSize: 15,
                                )),
                          ],
                        ),
                        height: 80.h,
                        width: 84.w,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border:
                                Border.all(width: 1.5, color: Colors.black))),
                  ),
                  SizedBox(
                    width: 30.w,
                  ),
                  Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("$third",
                              style: TextStyle(
                                  fontSize: 20, color: Color(0xff89C9FF))),
                          Text("day",
                              style: TextStyle(
                                  fontSize: 20, color: Color(0xff89C9FF))),
                          Text("Aswan",
                              style: TextStyle(
                                fontSize: 15,
                              )),
                        ],
                      ),
                      height: 80.h,
                      width: 84.w,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border:
                              Border.all(width: 1.5, color: Colors.black)))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Cairo",
                          style: TextStyle(fontSize: 25, color: Colors.white)),
                    ),
                    SizedBox(
                      width: 180.w,
                    ),
                    Text("$first days",
                        style: TextStyle(fontSize: 25, color: Colors.white)),
                  ],
                ),
                height: 77.h,
                width: 360.w,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/Aswan_place.png"),
                        fit: BoxFit.fill),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(width: 1.5.w, color: Colors.black)),
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
                    "day 1",
                    style: TextStyle(color: Colors.black87, fontSize: 25),
                  )
                ],
              ),

            ),


            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {

                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 13),
                      child: Center(
                          child: Text(
                        "+ Add place",
                        style:
                            TextStyle(fontSize: 15, color: Color(0xff89C9FF)),
                      )),
                      height: 33.h,
                      width: 159.w,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border:
                              Border.all(width: 1.5.w, color: Color(0xff89C9FF))),
                    ),
                  )
                ],
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
                    "day 2",
                    style: TextStyle(color: Colors.black87, fontSize: 25),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      //  Navigator.pushNamed(context, places.routeName);
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 13),
                      child: Center(
                          child: Text(
                        "+ Add place",
                        style:
                            TextStyle(fontSize: 15, color: Color(0xff89C9FF)),
                      )),
                      height: 33.h,
                      width: 159.w,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border:
                              Border.all(width: 1.5, color: Color(0xff89C9FF))),
                    ),
                  )
                ],
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
                    "day 3",
                    style: TextStyle(color: Colors.black87, fontSize: 25),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      //Navigator.pushNamed(context, places.routeName);
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 13),
                      child: Center(
                          child: Text(
                        "+ Add place",
                        style:
                            TextStyle(fontSize: 15, color: Color(0xff89C9FF)),
                      )),
                      height: 33.h,
                      width: 159.w,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border:
                              Border.all(width: 1.5.w, color: Color(0xff89C9FF))),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Sharm El Sheikh",
                          style: TextStyle(fontSize: 25, color: Colors.white)),
                    ),
                    SizedBox(
                      width: 55.w,
                    ),
                    Text("$second days",
                        style: TextStyle(fontSize: 25, color: Colors.white)),
                  ],
                ),
                height: 77.h,
                width: 360.w,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/Luxor_place.png"),
                        fit: BoxFit.fill),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(width: 1.5.w, color: Colors.black)),
              ),
              //luxor 2days
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.calendar_month),
                  SizedBox(width: 10.w),
                  Text(
                    "day 1",
                    style: TextStyle(color: Colors.black87, fontSize: 25),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      //Navigator.pushNamed(context, places.routeName);
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 13),
                      child: Center(
                          child: Text(
                        "+ Add place",
                        style:
                            TextStyle(fontSize: 15, color: Color(0xff89C9FF)),
                      )),
                      height: 33.h,
                      width: 159.w,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border:
                              Border.all(width: 1.5.w, color: Color(0xff89C9FF))),
                    ),
                  )
                ],
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
                    "day 2",
                    style: TextStyle(color: Colors.black87, fontSize: 25),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      // Navigator.pushNamed(context, places.routeName);
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 13),
                      child: Center(
                          child: Text(
                        "+ Add place",
                        style:
                            TextStyle(fontSize: 15, color: Color(0xff89C9FF)),
                      )),
                      height: 33.h,
                      width: 159.w,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border:
                              Border.all(width: 1.5, color: Color(0xff89C9FF))),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Hurghada",
                          style: TextStyle(fontSize: 25, color: Colors.white)),
                    ),
                    SizedBox(
                      width: 150.w,
                    ),
                    Text("$third days",
                        style: TextStyle(fontSize: 25, color: Colors.white)),
                  ],
                ),
                height: 77.h,
                width: 360.w,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/Aswan_place1.png"),
                        fit: BoxFit.fill),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(width: 1.5, color: Colors.black)),
              ),
              //luxor 2days
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.calendar_month),
                  SizedBox(width: 10.w),
                  Text(
                    "day 1",
                    style: TextStyle(color: Colors.black87, fontSize: 25),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      // Navigator.pushNamed(context, places.routeName);
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 13),
                      child: Center(
                          child: Text(
                        "+ Add place",
                        style:
                            TextStyle(fontSize: 15, color: Color(0xff89C9FF)),
                      )),
                      height: 33.h,
                      width: 159.w,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border:
                              Border.all(width: 1.5, color: Color(0xff89C9FF))),
                    ),
                  )
                ],
              ),
            ),
             SizedBox(height: 20.h,),

            Row(
              children: [
                Btn1(Color(0xFF89C9FF), Colors.white, "Back", () {
                  Navigator.pop(context);
                }),
                Spacer(),
                InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, RideRiquest.routeName);
                    },
                    child: Text("Request Ride?",style: TextStyle(color: Color(0xff89C9FF), fontSize: 20),)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
