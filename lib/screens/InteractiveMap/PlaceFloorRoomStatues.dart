import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../api_manager/api_manager.dart';

class PlaceFloorRoomStatues extends StatefulWidget {
  @override
  State<PlaceFloorRoomStatues> createState() => _DetailsFloorState();
}

class _DetailsFloorState extends State<PlaceFloorRoomStatues> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getPlaceFloorRoomStatues(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text("Error: ${snapshot.error}"));
        }

        final data = snapshot.data?.data ?? [];

        return ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: data.length,
          itemBuilder: (context, index) {
            final item = data[index];

            return Dialog(
              child: SizedBox(
                height: 600.h,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 20.h),
                      Text(
                        item.name ?? "",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Image.network(item.imageLink ?? ""),
                      Text(
                        "Period: ${item.period}",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 20.sp,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "Dynasty: ${item.dynasty}",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 20.sp,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "Height: ${item.height}",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 20.sp,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "Place of Discovery: ${item.placeOfDiscovery}",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 20.sp,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "Material: ${item.material}",
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
      },
    );
  }
}
