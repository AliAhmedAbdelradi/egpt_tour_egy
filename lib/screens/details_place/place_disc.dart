

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../places/place_cat.dart';
import '../places/place_shape.dart';

class PlaceDic extends StatelessWidget {
  static const String routeName = "dic";
  const PlaceDic({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.cancel_outlined,
              color: Colors.black,
              size: 30,
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            InkWell(
              onTap: (){
                // Navigator.pushNamed(context, place_details.routeName);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [place_shape("assets/images/pyramids_place.png")],
              ),
            ),
            PlaceCat("pyramids", "5.0",),
            SizedBox(height: 15.h,),
            InkWell(
              onTap: (){},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [place_shape("assets/images/cairo_tower_place.png")],
              ),
            ),
            PlaceCat(" cairo tower", "5.0",),
            SizedBox(height: 15.h,),
            InkWell(
              onTap: (){},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [place_shape("assets/images/EMC_place.png")],
              ),
            ),
            PlaceCat("Egyptian museum cairo", "5.0",),

          ],
        ),
      ),
    );
  }
}
