import 'package:ept_mate/constant/constant.dart';
import 'package:ept_mate/model/PlaceDetailsByPlaceId.dart';
import 'package:ept_mate/screens/details_place/placeImages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../api_manager/api_manager.dart';
import '../InteractiveMap/interactive_map.dart';
import '../plan_type_screen/plan_type.dart';
import '../select_city/btn1.dart';
import 'detail_shape.dart';

class PlaceDicrip extends StatefulWidget {
  static const String routeName = "Dicrip";
  String PlaceId;

  PlaceDicrip({required this.PlaceId});

  @override
  State<PlaceDicrip> createState() => _PlaceDicripState();
}

class _PlaceDicripState extends State<PlaceDicrip> {
  PlaceDetailsByPlaceId list = PlaceDetailsByPlaceId();

  _launchMaps(double latitude, double longitude) async {
    // Construct the URL with the latitude and longitude
    final url =
        'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';

    // Check if the URL can be launched
    if (await canLaunch(url)) {
      // Launch the URL
      await launch(url);
    } else {
      // Handle the case where the URL cannot be launched
      throw 'Could not launch $url';
    }
  }

  void _launchURL() async {
    const url = 'https://www.easwaaq.com/nmec/tickets';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 30,
            )),
        actions: [
          ImageIcon(
            AssetImage("assets/images/logo.png"),
            color: Colors.black,
            size: 50,
          )
        ],
      ),
      body: FutureBuilder(
        future: ApiManager.getPlaceDetailsPlaceId(
          placeId: widget.PlaceId,
        ),
        builder: (context, snapshot) {
          print(snapshot.data?.data);
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text("no data entered"));
          }

          final category = snapshot.data?.data ?? [];

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemBuilder: (context, index) {
              return SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    PlaceImagesCarousel(
                        placeImages: category[index].placeImages ?? []),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                child: Text(
                              category[index].placeName ?? "",
                              style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold),
                            )),
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {});
                            _launchMaps(category[index].latitude ?? 0,
                                category[index].longitude ?? 0);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.location_on,
                                weight: 20.w,
                                color: Colors.red,
                              ),
                              Text(
                                "Location",
                                style: GoogleFonts.poppins(
                                    fontSize: 18,
                                    color: primaryColor,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          height: 20.h,
                          indent: 10.w,
                          endIndent: 10.w,
                          color: Colors.black,
                          thickness: 1,
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                Column(
                                  children: [
                                    Text("Open Time",
                                        style: GoogleFonts.poppins(
                                            fontSize: 17,
                                            color: primaryColor,
                                            fontWeight: FontWeight.w500)),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.watch_later_outlined,
                                          color: Colors.black54,
                                          size: 17,
                                        ),
                                        Text(
                                          "${category[index].openTime?.substring(0, 5)} AM",
                                          style: GoogleFonts.poppins(fontSize: 14),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                Spacer(),
                                Column(
                                  children: [
                                    Text("Close Time",
                                        style: GoogleFonts.poppins(
                                            fontSize: 17,
                                            color: primaryColor,
                                            fontWeight: FontWeight.w500)),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.watch_later_outlined,
                                          color: Colors.black54,
                                          size: 17,
                                        ),
                                        Text(
                                          "${category[index].closeTime?.substring(0, 5)} PM",
                                          style: GoogleFonts.poppins(fontSize: 14),
                                        )
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(height: 20.h,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.book_online,
                                  weight: 20.w,
                                  color: Colors.orange,
                                ),
                                Text(
                                  "Book Your Tickets Now!",
                                  style: GoogleFonts.poppins(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500),
                                ),




                              ],

                            ),
                            InkWell(
                              onTap: () {
                                _launchURL();
                              },
                              child: Text(
                                "Click here",
                                style: GoogleFonts.poppins(
                                    fontSize: 18,
                                    color:  primaryColor,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                        Divider(
                          height: 30.h,
                          indent: 10.w,
                          endIndent: 10.w,
                          color: Colors.black,
                          thickness: 1,
                        ),
                        Text(
                          category[index].detailedDescription ?? "",
                          style: GoogleFonts.poppins(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                              fixedSize:
                                  MaterialStatePropertyAll(Size(210, 10)),
                              backgroundColor:
                                  MaterialStatePropertyAll(primaryColor),
                              shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(20)))),
                          onPressed: () {
                            Navigator.pushNamed(
                                context, InteractiveMap.routeName);
                          },
                          child: Text(
                            'Go To Interactive Map >>',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
            itemCount: category.length,
          );
        },
      ),
    );
  }
}
