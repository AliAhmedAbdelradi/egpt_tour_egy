import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../api_manager/api_manager.dart';

class PlaceFloorRoomStatues2 extends StatefulWidget {
  @override
  State<PlaceFloorRoomStatues2> createState() => _DetailsFloorState();
}

class _DetailsFloorState extends State<PlaceFloorRoomStatues2> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getPlaceFloorRoomStatues(roomId: 9),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text("Error: ${snapshot.error}"));
        }

        final data = snapshot.data?.data ?? [];
        print(data);

        return ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: data.length,
          itemBuilder: (context, index) {


            return Dialog(
              child: SizedBox(
                height: 600.h,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 20.h),
                      Text(
                        data[index].name ?? "",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Image.network(data[index].imageLink ?? ""),
                      Text(
                        "Period: ${data[index].period}",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 20.sp,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "Dynasty: ${data[index].dynasty}",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 20.sp,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "Height: ${data[index].height}",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 20.sp,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "Place of Discovery: ${data[index].placeOfDiscovery}",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 20.sp,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "Material: ${data[index].material}",
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
