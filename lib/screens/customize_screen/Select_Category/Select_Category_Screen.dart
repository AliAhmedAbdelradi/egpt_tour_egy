import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../date_screen/date_screen.dart';
import '../../days_counter/days_counter.dart';
import '../../plan_type_screen/plan_type.dart';
import '../../select_city/Select_City_Screen.dart';
import 'btn.dart';
import 'categ_image.dart';

class SelectCategory extends StatelessWidget {
  const SelectCategory({super.key});

  static const String routeName = "select category";

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
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Select Tourism Category ",
                style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 35,
                    fontWeight: FontWeight.w600)),
            SizedBox(
              height: 10.h,
            ),
            Text("Step 2",
                style: GoogleFonts.poppins(
                    color: Colors.black38,
                    fontSize: 15,
                    fontWeight: FontWeight.w600)),
            SizedBox(
              height: 30.h,
            ),
            CategImg(
              "Medical",
              "assets/images/cate_img1.png",
            ),
            SizedBox(
              height: 30.h,
            ),
            CategImg(
              "Religious",
              "assets/images/categ_img2.png",
            ),
            SizedBox(
              height: 30.h,
            ),
            CategImg(
              "Cultural",
              "assets/images/categ_img3.png",
            ),
            SizedBox(
              height: 30.h,
            ),
            CategImg(
              "Leisure",
              "assets/images/categ_img4.png",
            ),
            SizedBox(
              height: 50.h,
            ),
            Row(
              children: [
                Btn(Color(0xFF89C9FF),Colors.white,"Back",(){
                  Navigator.pop(context);
                }),
                Spacer(),
                Btn(Colors.white,Color(0xFF89C9FF),"Continue",(){
                Navigator.pushNamed(context, SelectCity.routeName);
                }),

              ],
            )
          ],
        ),
      ),
    );
  }
}
