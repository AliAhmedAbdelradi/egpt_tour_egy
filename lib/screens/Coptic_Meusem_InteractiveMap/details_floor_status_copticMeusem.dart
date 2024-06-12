import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../api_manager/api_manager.dart';

class DetailsFloorStatusCopticMeusem extends StatefulWidget {
  const DetailsFloorStatusCopticMeusem({super.key});

  @override
  State<DetailsFloorStatusCopticMeusem> createState() => _DetailsFloorStatusState();
}

class _DetailsFloorStatusState extends State<DetailsFloorStatusCopticMeusem> {
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
                    cate[3].name ?? "",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Image.network(cate[3].imageLink ?? ""),
                  Text(
                    "description: ${cate[3].description}",
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
