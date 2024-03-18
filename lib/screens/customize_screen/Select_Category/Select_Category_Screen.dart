import 'package:ept_mate/api_manager/api_manager.dart';
import 'package:ept_mate/screens/select_city/Select_City_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../plan_type_screen/plan_type.dart';
import '../../select_city/btn1.dart';


class SelectCategory extends StatefulWidget {
  const SelectCategory({super.key});

  static const String routeName = "select category";

  @override
  State<SelectCategory> createState() => _SelectCategoryState();
}

class _SelectCategoryState extends State<SelectCategory> {
  bool isvisible = false;
  bool asvisible = false;
  bool ssvisible = false;
  bool fsvisible = false;

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
        body: FutureBuilder(
          future: ApiManger.getCategory(),
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
                      InkWell(
                        onTap: () {
                          setState(() {
                            isvisible=!isvisible;
                          });

                        },
                        child: Container(
                          height: 71.h,
                          width: 260.w,
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
                                width: 20.w,
                              ),
                              Text(
                                cate[0].name ?? "",
                                style: TextStyle(fontSize: 20, color: Colors.black),
                              ),
                              Spacer(),


                            ],

                          ),
                        ),

                      ),
                      SizedBox(
                        width: 30.w,
                      ),
                      Visibility(
                          visible: isvisible,
                          child: Icon(
                            Icons.done_all,
                            size: 20,
                            color: Colors.green,
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            asvisible=!asvisible;
                          });

                        },
                        child: Container(
                          height: 71.h,
                          width: 265.w  ,
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
                                width: 20.w,
                              ),
                              Text(
                                cate[1].name ?? "",
                                style: TextStyle(fontSize: 20, color: Colors.black),
                              ),
                              Spacer(),


                            ],

                          ),
                        ),

                      ),
                      SizedBox(
                        width: 30.w,
                      ),
                      Visibility(
                          visible: asvisible,
                          child: Icon(
                            Icons.done_all,
                            size: 20,
                            color: Colors.green,
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            ssvisible=!ssvisible;
                          });

                        },
                        child: Container(
                          height: 71.h,
                          width: 265.w,
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
                                width: 20.w,
                              ),
                              Text(
                                cate[2].name ?? "",
                                style: TextStyle(fontSize: 20, color: Colors.black),
                              ),
                              Spacer(),


                            ],

                          ),
                        ),

                      ),
                      SizedBox(
                        width: 30.w,
                      ),
                      Visibility(
                          visible: ssvisible,
                          child: Icon(
                            Icons.done_all,
                            size: 20,
                            color: Colors.green,
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            fsvisible=!fsvisible;
                          });

                        },
                        child: Container(
                          height: 71.h,
                          width: 265.w,
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
                                width: 20.w,
                              ),
                              Text(
                                cate[3].name ?? "",
                                style: TextStyle(fontSize: 20, color: Colors.black),
                              ),
                              Spacer(),


                            ],

                          ),
                        ),

                      ),
                      SizedBox(
                        width: 30.w,
                      ),
                      Visibility(
                          visible: fsvisible,
                          child: Icon(
                            Icons.done_all,
                            size: 20,
                            color: Colors.green,
                          )),
                    ],
                  ),
                  SizedBox(height: 40.h,),
                  Row(
                    children: [
                      Btn1(Color(0xFF89C9FF), Colors.white, "Back", () {
                        Navigator.pop(context);
                      }),
                      Spacer(),
                      Btn1(Colors.white, Color(0xFF89C9FF), "Continue", () {
                        Navigator.pushNamed(context, SelectCity.routeName);
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
