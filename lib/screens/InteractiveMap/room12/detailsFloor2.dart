import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../api_manager/api_manager.dart';

import 'PlaceFloorRoomStatues2.dart';

class DetailsFloor2 extends StatefulWidget {
  const DetailsFloor2({super.key});

  @override
  State<DetailsFloor2> createState() => _DetailsFloorState();
}

class _DetailsFloorState extends State<DetailsFloor2> {
  final future = ApiManager();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getFloorDetails(floorId: 9),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text("error"));
        }

        final cate = snapshot.data?.data ?? [];

        return ListView.builder(
          itemBuilder: (context, index) {
            return Center(
              child: Dialog(
                child: SizedBox(
                  height: 300.h,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        cate[index].name ?? "",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.black),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Stack(
                        children: [
                          Image.network(cate[index].imageLink ?? ""),
                          InkWell(
                            onTap: () {
                              setState(() {

                              });
                              showStatues();
                            },
                            child: Center(
                              child: Container(
                                margin: EdgeInsets.only(top: 50.h),
                                width: 10.w,
                                height: 10.h,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.white, width: 1),
                                    color: Colors.redAccent,
                                    borderRadius: BorderRadius.circular(60)),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        "Room ${cate[index].number}",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 24,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          itemCount: cate.length,
        );
      },
    );
  }
  void showStatues() {
    showDialog(
      context: context,
      builder: (context) {
        return PlaceFloorRoomStatues2();
      },
    );
  }


}