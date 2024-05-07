import 'package:ept_mate/model/GetReadyMateById.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../api_manager/api_manager.dart';
import '../details_place/placeImages.dart';

class NumOfPlaceReadyTrip extends StatelessWidget {
  final int id;

  NumOfPlaceReadyTrip({Key? key, required this.id}) : super(key: key);

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
          future: ApiManager.getReadyMateById(id: id),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            }

            return ListView.separated(
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 30.h,
                );
              },
              scrollDirection: Axis.vertical,
              padding: const EdgeInsets.all(16),
              itemBuilder: (context, index) {
                final data = snapshot.data?.data;
                if (data != null && index < data.length) {
                  final details = data[index].details;
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      for (var detail in details ?? [])
                        SingleChildScrollView(
                          child: Column(
                            children: [
                              Text("${detail.cityName}",
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.black,
                                  )),
                              Container(
                                width: double.infinity.w,
                                height: 150.h,
                                padding: EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                    image: NetworkImage(detail.imageLink),
                                    fit: BoxFit.cover,
                                    opacity: 0.7,
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                        alignment: Alignment.topRight,
                                        child: Text("Day ${detail.dayNum}",
                                            style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                              color: Colors.white,
                                            ))),
                                    Spacer(),
                                    Container(
                                      alignment: Alignment.bottomLeft,
                                      child: Text(
                                        detail.name,
                                        style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 30.h,
                              )
                            ],
                          ),
                        ),
                    ],
                  );
                } else {
                  return SizedBox.shrink(); // Placeholder widget
                }
              },
              itemCount: snapshot.data?.data.length ?? 0,
            );
          },
        ),
      ),
    );
  }
}
