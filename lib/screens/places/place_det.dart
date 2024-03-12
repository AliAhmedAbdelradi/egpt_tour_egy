


import 'package:ept_mate/screens/places/place_cat.dart';
import 'package:ept_mate/screens/places/place_shape.dart';
import 'package:flutter/material.dart';

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, Add_places.routeName,);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [place_shape("assets/images/pyramids_place.png")],
              ),
            ),
            PlaceCat(
              "pyramids",
              "5.0",
            ),
            SizedBox(
              height: 15,
            ),
            InkWell(
              onTap: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [place_shape("assets/images/cairo_tower_place.png")],
              ),
            ),
            PlaceCat(
              " cairo tower",
              "5.0",
            ),
            SizedBox(
              height: 15,
            ),
            InkWell(
              onTap: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [place_shape("assets/images/EMC_place.png")],
              ),
            ),
            PlaceCat(
              "Egyptian museum cairo",
              "5.0",
            ),
            Btn1(Color(0xFF89C9FF), Colors.white, "Back", () {
              Navigator.pop(context);
            })
          ],
        ),
      ),
    );
  }
}
