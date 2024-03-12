

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../plan_type_screen/plan_type.dart';
import '../select_city/btn1.dart';
import 'detail_shape.dart';

class PlaceDicrip extends StatelessWidget {
  static const String routeName = "Dicrip";

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
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              detail_shape("assets/images/pyramids_details.png"),
              SizedBox(
                height: 10,
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          margin: EdgeInsets.only(left: 42),
                          child: Text(
                            "pyramids",
                            style: TextStyle(fontSize: 18, color: Colors.black87),
                          )),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 38),
                    child: Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Colors.redAccent,
                        ),
                        Text(
                          "Cairo",
                          style: TextStyle(fontSize: 14),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Divider(
                    height: 2,
                    indent: 40,
                    endIndent: 40,
                    color: Colors.black,
                    thickness: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          margin: EdgeInsets.only(left: 42),
                          child: Text(
                            "Start",
                            style: TextStyle(fontSize: 18, color: Colors.black87),
                          )),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 38),
                    child: Row(
                      children: [
                        Icon(Icons.watch_later_outlined, color: Colors.black54),
                        Text(
                          "10.00 AM",
                          style: TextStyle(fontSize: 14),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Divider(
                    height: 2,
                    indent: 40,
                    endIndent: 40,
                    color: Colors.black,
                    thickness: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          margin: EdgeInsets.only(left: 42),
                          child: Text(
                            "End",
                            style: TextStyle(fontSize: 18, color: Colors.black87),
                          )),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 38),
                    child: Row(
                      children: [
                        Icon(Icons.watch_later_outlined, color: Colors.black54),
                        Text(
                          "7.00 PM",
                          style: TextStyle(fontSize: 14),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Divider(
                    height: 2,
                    indent: 40,
                    endIndent: 40,
                    color: Colors.black,
                    thickness: 1,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.location_on,
                          weight: 20,
                        ),
                        Text(
                          "Location",
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        )
                      ],
                    ),
                    height: 33.h,
                    width: 140.w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 1.5, color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Divider(
                    height: 2,
                    indent: 40,
                    endIndent: 40,
                    color: Colors.black,
                    thickness: 1,
                  ),
                  SizedBox(
                    height: 13,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "place Activity",
                          style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, color: Colors.black),
                        )
                      ],
                    ),
                    height: 90.h,
                    width: 281.w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(width: 1.5, color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    height: 13,
                  ),
                  Divider(
                    height: 2,
                    indent: 40,
                    endIndent: 40,
                    color: Colors.black,
                    thickness: 1,
                  ),
                  Text("The Egyptian pyramids",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  Text("are ancient masonry",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  Text("structures located in",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  Text("Egypt",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                ],
          
              ),
              SizedBox(height: 15.h,),

              Btn1(Color(0xFF89C9FF), Colors.white, "Back", () {
                Navigator.pop(context);
              })
            ],
          ),
        ),
      ),
    );
  }
}
