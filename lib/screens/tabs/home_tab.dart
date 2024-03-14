

import 'package:ept_mate/api_manager/api_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../categories/cultural/Religious_categ.dart';
import '../categories/cultural/cultural_categ.dart';
import '../categories/cultural/leisure_categ.dart';
import '../categories/cultural/medical_categ.dart';
import '../city_res_cat.dart';
import '../tourism_res_cat.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManger.getCategory(), builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Center(child: CircularProgressIndicator());
      }
      if (snapshot.hasError) {
        return Center(child: Text(snapshot.error.toString()));
      }


      final cate = snapshot.data?.data ?? [];
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
                child: Image(
                    image: AssetImage("assets/images/pyramids.png"))),
            SizedBox(
              height: 7.h,
            ),
            Text(cate[0].name ?? "",
                style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 15),),
            SizedBox(
              height: 7.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, CityResCat.routeName);
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
                      Navigator.pushNamed(context, CityResCat.routeName);
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  cate[1].name ?? "",
                  style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                Text(
                  cate[2].name ?? "",
                  style:GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ],
            ),
            SizedBox(
              height: 7.h,
            ),
            Center(
                child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, CityResCat.routeName);
                    },
                    child: const Image(
                        image: AssetImage("assets/images/Medical.png")))),
            SizedBox(
              height: 7.h,
            ),
            Text(
              cate[3].name ?? "",
              style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 15),
            )
          ]),
        ),
      );
    },);
  }
}


