import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../api_manager/api_manager.dart';
import 'PlaceFloorRoomStatues.dart';

class DetailsFloor extends StatefulWidget {
  DetailsFloor({super.key});

  @override
  State<DetailsFloor> createState() => _DetailsFloorState();
}

class _DetailsFloorState extends State<DetailsFloor> {
  final future = ApiManger();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManger.getFloorDetails(),
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
                        cate[0].name ?? "",
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
                          Image.network(cate[0].imageLink ?? ""),
                          InkWell(
                            onTap: () {
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
        return PlaceFloorRoomStatues();
      },
    );
  }
}
