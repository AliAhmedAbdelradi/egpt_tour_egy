import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'image_categ.dart';

class LeisureCateg extends StatelessWidget {
  static const String routeName = "Leisure";

  const LeisureCateg({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {

            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            size: 30,
          ),
          color: Colors.black,
        ),
        actions: [
          Image(
            image: AssetImage("assets/images/logo.png"),
            width: 60.w,
            height: 55.h,
          )
        ],
      ),
      body: Column(
        children: [
          Center(
              child: Text(
                "Leisure",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.normal, color: Colors.black, fontSize: 25),
              )),
          Container(
            width: 312.w,
            height: 66.h,
            padding: const EdgeInsets.all(10),
            child:  TextFormField(
              decoration: InputDecoration(
                contentPadding: EdgeInsetsDirectional.symmetric(
                    vertical: 13.h, horizontal: 10.w),
                suffixIcon: Icon(Icons.search),
                hintText: "Search",
                hintStyle: const TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.w)),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                  borderRadius: BorderRadius.circular(50.w),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(50.w),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.circular(50.w),
                ),
              ),
            ),
          ),

          Expanded(
            child: GridView.count(
              primary: false,
              padding: const EdgeInsets.all(30),
              crossAxisSpacing: 20,
              mainAxisSpacing: 50,
              crossAxisCount: 2,

              children: <Widget>[
                ImageCateg("assets/images/ca_iro.png","Cairo" ),
                ImageCateg("assets/images/sham1.png","Sharm Elsheikh" ),
                ImageCateg("assets/images/alexx.png","Alexandria" ),
                ImageCateg("assets/images/horghada.png","Hurghada"),
                ImageCateg("assets/images/dahab.png","Dahab"),



              ],
            ),
          )
        ],
      ),
    );
  }
}
