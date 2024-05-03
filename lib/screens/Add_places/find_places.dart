import 'package:ept_mate/screens/AddPlace.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../model/trip.dart';
import '../plan_type_screen/plan_type.dart';
import '../select_city/btn1.dart';

class planDetails extends StatefulWidget {
  static const String routeName = "add places";
  String? plus = "+add place";
  String? plus1 = "+add place";
  String? plus2 = "+add place";

  planDetails({required this.trip});


  Trip trip;


  @override
  State<planDetails> createState() => _planDetailsState();
}

class _planDetailsState extends State<planDetails> {

  @override
  Widget build(BuildContext context) {
    int? first = widget.trip.dayNums?[0];
    int? second = widget.trip.dayNums?[1];
    int? third = widget.trip.dayNums?[2];
    String? name1 = widget.trip.cityName?[0];
    String? name2 = widget.trip.cityName?[1];
    String? name3 = widget.trip.cityName?[2];
    DateTime? start = widget.trip.startDate;
    var date1 = start?.day;
    var date2 = date1! + first!;
    var date3 = date2! + second!;
    var date4 = date3! + third!;
    var place1 = widget.trip.placesID?[0];
    var place2 = widget.trip.placesID?[1];
    var place3 = widget.trip.placesID?[2];
    print(start);


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
                          Center(
                            child: Text("$name1",
                                style: TextStyle(
                                  fontSize: 15,
                                )),
                          ),
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
                            Text("$name2",
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
                          Text("$name3",
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
                          border: Border.all(width: 1.5, color: Colors.black)))
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
                      child: Text("$name1",
                          style: TextStyle(fontSize: 25, color: Colors.white)),
                    ),
                    SizedBox(
                      width: 90.w,
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
                    "from ($date1) to ($date2) ",
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
                    onTap: () async {
                      var selectedData = await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  AddPlace(placeID: '$place1')));
                      setState(() {
                        // Update the state with the selected data received from AddPlace screen
                        // Assuming selectedData is of type String
                        if (selectedData != null) {
                          setState(() {
                            widget.plus = selectedData.toString() ;
                            print(widget.plus);
                          });
                        }
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 13),
                      child: Center(
                          child: Text(
                            "${widget.plus}",
                            style:
                            TextStyle(fontSize: 15, color: Color(0xff89C9FF)),
                          )),
                      height: 33.h,
                      width: 159.w,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              width: 1.5.w, color: Color(0xff89C9FF))),
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
                      child: Text("$name2",
                          style: TextStyle(fontSize: 25, color: Colors.white)),
                    ),
                    SizedBox(
                      width: 110.w,
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
                    "from ($date2) to ($date3) ",
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
                    onTap: () async {
                      var selectedData = await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  AddPlace(placeID: '$place2')));
                      setState(() {
                        // Update the state with the selected data received from AddPlace screen
                        // Assuming selectedData is of type String
                        if (selectedData != null) {
                          setState(() {
                            widget.plus1 = selectedData.toString() ;
                            print(widget.plus1);
                          });
                        }
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 13),
                      child: Center(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          AddPlace(placeID: '$place2')));
                            },
                            child: Text(
                              "${widget.plus1}",
                              style:
                              TextStyle(fontSize: 15, color: Color(0xff89C9FF)),
                            ),
                          )),
                      height: 33.h,
                      width: 159.w,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              width: 1.5.w, color: Color(0xff89C9FF))),
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
                      child: Text("$name3",
                          style: TextStyle(fontSize: 25, color: Colors.white)),
                    ),
                    SizedBox(
                      width: 90.w,
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
                    "from ($date3) to ($date4) ",
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
                    onTap: () {},
                    child: Container(
                      margin: EdgeInsets.only(left: 13),
                      child: Center(
                          child: InkWell(

                            onTap: () async {
                              var selectedData = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          AddPlace(placeID: '$place3')));
                              setState(() {
                                // Update the state with the selected data received from AddPlace screen
                                // Assuming selectedData is of type String
                                if (selectedData != null) {
                                  setState(() {
                                    widget.plus2 = selectedData.toString() ;
                                    print(widget.plus2);
                                  });
                                }
                              });
                            },
                            child: Text(
                              "${widget.plus2}",
                              style:
                              TextStyle(fontSize: 15, color: Color(0xff89C9FF)),
                            ),
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
            SizedBox(
              height: 20.h,
            ),
            Row(
              children: [
                Btn1(Color(0xFF89C9FF), Colors.white, "Back", () {
                  Navigator.pop(context);
                }),
                Spacer(),
                Btn1(Color(0xFF89C9FF), Colors.white, "Save", () {
                  Navigator.pushNamed(context, PlanType.routeName);
                }),
              ],
            )
          ],
        ),
      ),
    );
  }
}