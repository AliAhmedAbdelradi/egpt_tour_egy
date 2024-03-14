


import 'package:ept_mate/api_manager/api_manager.dart';
import 'package:ept_mate/screens/places/place_cat.dart';
import 'package:ept_mate/screens/places/place_shape.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Add_places/find_places.dart';
import '../plan_type_screen/plan_type.dart';
import '../select_city/btn1.dart';

class PlaceDet extends StatefulWidget {
  static const String routeName = "dis";

  const PlaceDet({super.key});

  @override
  State<PlaceDet> createState() => _PlaceDetState();
}

class _PlaceDetState extends State<PlaceDet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
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
      body: FutureBuilder(future: ApiManger.getPlaces(), builder: (context, snapshot) {
        if(snapshot.connectionState==ConnectionState.waiting){
          return Center(child: CircularProgressIndicator());
        }
        if(snapshot.hasError){
          return Center(child: Text(snapshot.error.toString()));

        }


        final cate = snapshot.data?.data??[];

        return   SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image(
                image: AssetImage("assets/images/tower.png"),
                width: 328.w,
                height: 370.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(cate[0].name??"",
                      style: GoogleFonts.poppins(
                          fontSize: 25,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                  Container(
                      margin: EdgeInsets.only(left: 90), child: Text(cate[0].rate.toString()+".0"??"")),
                  Icon(
                    Icons.star,
                    color: Colors.black87,
                    size: 12,
                  )
                ],
              ),
              SizedBox(height: 15.h),
              Center(
                child: Container(
                    margin: EdgeInsets.only(left: 10.w),
                    child: Text(
                        cate[0].description??"",
                        style: GoogleFonts.poppins(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.w300))),
              ),

            ],
          ),
        );
      },)
    );
  }
}
