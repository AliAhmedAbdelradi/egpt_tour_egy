import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../api_manager/api_manager.dart';

class NumOfPlaceReadyTrip extends StatelessWidget {



  static const String routeName = "NumOfPlaceReadyTrip";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Container(
            alignment: Alignment.bottomCenter,
            child: Text("places",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.normal,
                    fontSize: 23,
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
            future: ApiManager.getReady(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Center(child: Text(snapshot.error.toString()));
              }

              final cate = snapshot.data?.data ?? [];

              return ListView.builder(
                scrollDirection: Axis.vertical,

                padding: const EdgeInsets.all(16),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        width: 250.w,
                        height: 160.h,
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                            image: NetworkImage(cate[index].imageLink ?? ""),
                            fit: BoxFit.cover,
                            opacity: 0.7,
                          ),
                        ),
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.topRight,
                              child: Text(
                                "${cate[index].dayNumber} Days",
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
                                cate[index].placeName ?? "",
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
                      SizedBox(height: 10.h,)


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
