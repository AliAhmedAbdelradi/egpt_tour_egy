

import 'package:ept_mate/model/trip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roundcheckbox/roundcheckbox.dart';
import '../../../api_manager/api_manager.dart';
import '../../home.dart';
import '../../plan_type_screen/plan_type.dart';
import '../../select_city/Select_City_Screen.dart';
import '../../select_city/btn1.dart';

class SelectCategory extends StatefulWidget {
  static const String routeName = "select category";
  String CategoryId;

  SelectCategory({required this.CategoryId});

  @override
  State<SelectCategory> createState() {
    return _SelectCategoryState();
  }
}

class _SelectCategoryState extends State<SelectCategory> {
  Trip trip=Trip();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, HomeScreen.routeName);
              },
              icon: const Icon(
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
        body: FutureBuilder(
          future: ApiManager.getCategory(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(child: Text("error"));
            }
            final cate = snapshot.data?.data ?? [];

            return Padding(
              padding: const EdgeInsets.all(13),
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
                  Row(
                    children: [
                      Container(
                        height: 71.h,
                        width: 300.w,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(width: 0, color: Colors.black)),
                        child: Row(
                          children: [
                            Padding(
                                padding: const EdgeInsets.all(10),
                                child: Image.network(cate[0].imageLink ?? "")),
                            SizedBox(
                              width: 15.w,
                            ),
                            Text(
                              cate[0].name ?? "",
                              style:
                              TextStyle(fontSize: 18, color: Colors.black),
                            ),
                            Spacer(),
                          ],
                        ),
                      ),
                      const SizedBox(width: 5),
                      InkWell(
                        child: RoundCheckBox(
                          size: 25,
                          onTap: (selected) {},
                          border: Border.all(
                            width: 1,
                          ),
                          uncheckedWidget:
                          Icon(Icons.close, color: Colors.white),
                        ),
                        onTap: () {
                          trip.typeID?.add(cate[0].id??0);
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(  children: [
                    Container(
                      height: 71.h,
                      width: 300.w,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 0, color: Colors.black)),
                      child: Row(
                        children: [
                          Padding(
                              padding: const EdgeInsets.all(10),
                              child: Image.network(cate[1].imageLink ?? "")),
                          SizedBox(
                            width: 15.w,
                          ),
                          Text(
                            cate[1].name ?? "",
                            style:
                            TextStyle(fontSize: 18, color: Colors.black),
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
                    const SizedBox(width: 5),
                    InkWell(
                      child: RoundCheckBox(
                        size: 25,
                        onTap: (selected) {},
                        border: Border.all(
                          width: 1,
                        ),
                        uncheckedWidget:
                        Icon(Icons.close, color: Colors.white),
                      ),
                      onTap: () {
                        trip.typeID?.add(cate[1].id??0);
                      },
                    )
                  ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 71.h,
                        width: 300.w,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(width: 0, color: Colors.black)),
                        child: Row(
                          children: [
                            Padding(
                                padding: const EdgeInsets.all(10),
                                child: Image.network(cate[2].imageLink ?? "")),
                            SizedBox(
                              width: 15.w,
                            ),
                            Text(
                              cate[2].name ?? "",
                              style: const TextStyle(
                                  fontSize: 20, color: Colors.black),
                            ),
                            const Spacer(),
                          ],
                        ),
                      ),
                      const SizedBox(width: 5),
                      InkWell(
                        child: RoundCheckBox(
                          size: 25,
                          onTap: (selected) {},
                          border: Border.all(
                            width: 1,
                          ),
                          uncheckedWidget:
                          const Icon(Icons.close, color: Colors.white),
                        ),
                        onTap: () {
                          trip.typeID?.add(cate[2].id??0);
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 71.h,
                        width: 300.w,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(width: 0, color: Colors.black)),
                        child: Row(
                          children: [
                            Padding(
                                padding: const EdgeInsets.all(10),
                                child: Image.network(cate[3].imageLink ?? "")),
                            SizedBox(
                              width: 4.w,
                            ),
                            Text(
                              cate[3].name ?? "",
                              style:
                              TextStyle(fontSize: 20, color: Colors.black),
                            ),
                            Spacer(),
                          ],
                        ),
                      ),
                      const SizedBox(width: 5),
                      InkWell(
                        child: RoundCheckBox(
                          size: 25,
                          onTap: (selected) {},
                          border: Border.all(
                            width: 1,
                          ),
                          uncheckedWidget:
                          Icon(Icons.close, color: Colors.white),
                        ),
                        onTap: () {
                          trip.typeID?.add(cate[3].id??0);
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  Row(
                    children: [
                      Btn1(Color(0xFF89C9FF), Colors.white, "Back", () {
                        Navigator.pop(context);
                      }),
                      Spacer(),
                      Btn1(Colors.white, Color(0xFF89C9FF), "Continue ", () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) =>
                                    SelectCity(trip:trip)));
                      }),
                    ],
                  )
                ],
              ),
            );
          },
        ));
  }
}