import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../api_manager/api_manager.dart';

class PlaceFloorRoomStatues extends StatefulWidget {
  const PlaceFloorRoomStatues({super.key});

  @override
  State<PlaceFloorRoomStatues> createState() => _DetailsFloorState();
}

class _DetailsFloorState extends State<PlaceFloorRoomStatues> {
  final future = ApiManger();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManger.getPlaceFloorRoomStatues(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text("error"));
        }

        final cate = snapshot.data?.data ?? [];

        return ListView.builder(
          scrollDirection: Axis.vertical,

          itemBuilder: (context, index) {

          return  Dialog(
            child: SizedBox(
              height: 600.h,
              child: SingleChildScrollView(
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
                    Image.network(cate[index].imageLink ?? ""),
                    Text("period : ${cate[index].period}"??"",style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                        color: Colors.black),
                    ),
                    Text("dynasty : ${cate[index].dynasty}"??"",style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                        color: Colors.black),
                    ),
                    Text("height : ${cate[index].height}"??"",style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                        color: Colors.black),
                    ),
                    Text("placeOfDiscovery : ${cate[index].placeOfDiscovery}"??"",style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                        color: Colors.black),
                    ),
                    Text("material : ${cate[index].material}"??"",style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
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


}
