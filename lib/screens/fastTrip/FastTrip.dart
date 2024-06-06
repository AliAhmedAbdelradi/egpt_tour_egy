import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../api_manager/api_manager.dart';
import '../readyTrips/number of places.dart';
import 'number of placesFastTrip.dart';

class FastTrip extends StatefulWidget {

  static const String routeName = "fast";

  const FastTrip({super.key});

  @override
  State<FastTrip> createState() => _FastTripState();
}

class _FastTripState extends State<FastTrip> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Container(
            alignment: Alignment.bottomCenter,
            child: Text("Fast Trips",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.normal,
                    fontSize: 22,
                    color: Colors.black)),
            margin: EdgeInsets.only(top: 10.h),
            padding: EdgeInsets.all(10),
          ),
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
              height: 60.h,
            )
          ],
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 40.h),
          child: FutureBuilder(
            future: ApiManager.getFastTrip(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Center(child: Text(snapshot.error.toString()));
              }

              final cate = snapshot.data?.data ?? [];

              return ListView.separated(
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 20.h,
                  );
                },
                scrollDirection: Axis.vertical,
                padding: const EdgeInsets.all(16),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (_)=> NumOfPlaceFastTrip( id: cate[index].id??0)));
                        },
                        child:Container(
                          width: 250.w,
                          height: 160.h,
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                              image:  AssetImage("assets/images/Rectangle 5.png"),
                              fit: BoxFit.cover,
                              opacity: 0.9,
                            ),
                          ),
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.topRight,
                                child:Text(
                                  "${cate[index].duration} Days",
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Spacer(),
                              Container(
                                alignment: Alignment.bottomLeft,
                                child: Text(
                                  cate[index].name ?? "",
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
                itemCount: cate.length,
              );
            },
          ),
        ));
  }
}
