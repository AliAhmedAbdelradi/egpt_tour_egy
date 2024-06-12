import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../api_manager/api_manager.dart';

class DetailsFloorStatusCopticMeusem1 extends StatefulWidget {
  const DetailsFloorStatusCopticMeusem1({super.key});

  @override
  State<DetailsFloorStatusCopticMeusem1> createState() => _DetailsFloorStatusState();
}

class _DetailsFloorStatusState extends State<DetailsFloorStatusCopticMeusem1> {
  @override
  Widget build(BuildContext context) {
    return  FutureBuilder(
      future: ApiManager.getPlaceFloorRoomStatues(roomId: 15),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text("error"));
        }

        final cate = snapshot.data?.data ?? [];

        return Dialog(
          child: SizedBox(
            height: 400.h,
            child: SingleChildScrollView(
              child: Column(
                children: [

                  SizedBox(height: 20.h),
                  Text(
                    cate[0].name ?? "",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Image.network(cate[0].imageLink ?? ""),
                  Text(
                    "description: ${cate[0].description}",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 20.sp,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
