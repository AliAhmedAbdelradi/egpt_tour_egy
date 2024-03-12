

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../categories/cultural/Religious_categ.dart';
import '../categories/cultural/cultural_categ.dart';
import '../categories/cultural/leisure_categ.dart';
import '../categories/cultural/medical_categ.dart';
import '../city_res_cat.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(30),
        child:
        Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text("Find Your category",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold)),
          const SizedBox(
            height: 10,
          ),
          InkWell(
              onTap: () {
                 Navigator.pushNamed(context, CityResCat.routeName);
              },
              child: const Image(
                  image: AssetImage("assets/images/pyramids.png"))),
          SizedBox(
            height: 7.h,
          ),
          const Text("Cultural",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold)),
          SizedBox(
            height: 7.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, LeisureCateg.routeName);
                  },
                  child: const Image(
                      image: AssetImage("assets/images/Leisure.png")),
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                      Navigator.pushNamed(context, ReligiousCateg.routeName);
                  },
                  child: const Image(
                      image: AssetImage("assets/images/Religion.png")),
                ),
              )
            ],
          ),
          SizedBox(
            height: 7.h,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Leisure",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "Religion",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: 7.h,
          ),
          Center(
              child: InkWell(
                  onTap: () {
                     Navigator.pushNamed(context, MedicalCateg.routeName);
                  },
                  child: const Image(
                      image: AssetImage("assets/images/Medical.png")))),
          SizedBox(
            height: 7.h,
          ),
          const Text(
            "Medical",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          )
        ]),
      ),
    );
  }
}
