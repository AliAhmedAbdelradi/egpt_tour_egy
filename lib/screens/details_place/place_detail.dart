import 'package:ept_mate/constant/constant.dart';
import 'package:ept_mate/model/PlaceDetailsByPlaceId.dart';
import 'package:ept_mate/screens/details_place/placeImages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_tts/flutter_tts.dart';
import '../../api_manager/api_manager.dart';
import '../Amanda_tempel_interactiveMap/interactiveMap_AmandaTemple.dart';
import '../Coptic_Meusem_InteractiveMap/interactiveMap_copticMeusem.dart';
import '../InteractiveMap/interactive_map.dart';
import '../Meusem_of_IslamicArt_IteractiveMap/iteractiveMap_meusem_of_islamicArt.dart';
import '../abo_sample_interactiveMap/interactiveMap_aboSample.dart';
import '../mohamed_ali_interactiveMap/interactiveMap_mohamedAli.dart';

class PlaceDicrip extends StatefulWidget {
  static const String routeName = "Dicrip";
  final String PlaceId;

  PlaceDicrip({required this.PlaceId});

  @override
  State<PlaceDicrip> createState() => _PlaceDicripState();
}

class _PlaceDicripState extends State<PlaceDicrip> {
  PlaceDetailsByPlaceId list = PlaceDetailsByPlaceId();
  FlutterTts flutterTts = FlutterTts();

  Future<void> _launchMaps(double latitude, double longitude) async {
    final url =
        'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> _launchURL() async {
    const url = 'https://egyptianmuseumcairo.eg/ticket-opening-hours/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> _speak(String text) async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setPitch(1.0);
    await flutterTts.speak(text);
  }

  Future<void> stop(String text) async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setPitch(1.0);
    await flutterTts.speak(text);
    await flutterTts.stop();
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
              size: 30.w,
            )),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.0.w),
            child: ImageIcon(
              AssetImage("assets/images/logo.png"),
              color: Colors.black,
              size: 50.w,
            ),
          )
        ],
      ),
      body: FutureBuilder(
        future: ApiManager.getPlaceDetailsPlaceId(placeId: widget.PlaceId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text("No data entered"));
          }

          final category = snapshot.data?.data ?? [];

          return ListView.builder(
            itemBuilder: (context, index) {
              final place = category[index];
              return Stack(
                children: [
                  PlaceImagesCarousel(placeImages: place.placeImages ?? []),
                  Padding(
                    padding: const EdgeInsets.all(4),
                    child: Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      margin: EdgeInsets.only(top: 150.h),
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.all(16.0.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                place.placeName ?? "",
                                style: TextStyle(
                                    fontSize: 25.sp,
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                              SizedBox(height: 10.h),
                              InkWell(
                                onTap: () {
                                  _launchMaps(
                                      place.latitude ?? 0, place.longitude ?? 0);
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.location_on,
                                        size: 20.w, color: Colors.red),
                                    Text(
                                      "Location",
                                      style: GoogleFonts.poppins(
                                          fontSize: 18.sp,
                                          color: primaryColor,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              Divider(
                                  height: 20.h,
                                  color: Colors.black,
                                  thickness: 1),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Text("Open Time",
                                          style: GoogleFonts.poppins(
                                              fontSize: 17.sp,
                                              color: primaryColor,
                                              fontWeight: FontWeight.bold)),
                                      Row(
                                        children: [
                                          Icon(Icons.watch_later_outlined,
                                              color: Colors.black54, size: 17.sp),
                                          Text(
                                            "${place.openTime?.substring(0, 5)} AM",
                                            style: GoogleFonts.poppins(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text("Close Time",
                                          style: GoogleFonts.poppins(
                                              fontSize: 17.sp,
                                              color: primaryColor,
                                              fontWeight: FontWeight.bold)),
                                      Row(
                                        children: [
                                          Icon(Icons.watch_later_outlined,
                                              color: Colors.black54, size: 17.w),
                                          Text(
                                            "${place.closeTime?.substring(0, 5)} PM",
                                            style: GoogleFonts.poppins(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 10.h),
                              if (place.placeId == 2)
                                Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.book_online,
                                            size: 20.w, color: Colors.orange),
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
                                      onTap: _launchURL,
                                      child: Text(
                                        "Click here",
                                        style: GoogleFonts.poppins(
                                            fontSize: 18,
                                            color: primaryColor,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ],
                                ),
                              Divider(
                                  height: 30.h,
                                  color: Colors.black,
                                  thickness: 1),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () =>
                                        _speak(place.detailedDescription ?? ""),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(30)),
                                      child: Row(
                                        children: [
                                          Icon(Icons.keyboard_voice_outlined,
                                              size: 30.w, color: primaryColor),
                                        ],
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        stop(place.detailedDescription ?? "");
                                      },
                                      icon: Icon(Icons.pause,
                                          size: 30.w, color: primaryColor))
                                ],
                              ),
                              SizedBox(height: 10.h),
                              Text(
                                place.detailedDescription ?? "",
                                style: GoogleFonts.poppins(
                                    fontSize: 17.sp, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 20.h),
                              _buildInteractiveMapButton(place),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
            itemCount: category.length,
          );
        },
      ),
    );
  }

  Widget _buildInteractiveMapButton(place) {
    String? routeName;
    switch (place.placeId) {
      case 2:
        routeName = InteractiveMap.routeName;
        break;
      case 76:
        routeName = InteractiveMapAboSample.routeName;
        break;
      case 16:
        routeName = InteractiveMapMohamedAli.routeName;
        break;
      case 48:
        routeName = InteractiveMapAmanda.routeName;
        break;
      case 78:
        routeName = InteractiveMapCopticMeusem.routeName;
        break;
      case 77:
        routeName = InteractiveMapMeusemOfIslamicArt.routeName;
        break;
      default:
        return SizedBox.shrink();
    }

    return Center(
        child: ElevatedButton(
        style
            : ButtonStyle(
          fixedSize: MaterialStateProperty.all(Size(100, 30)),
          backgroundColor: MaterialStateProperty.all(Colors.white),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)))),
      onPressed: () {
        Navigator.pushNamed(context, routeName!);
      },
      child: Image.asset(
        "assets/images/icon_Interactive_Map.png",
        fit: BoxFit.fill,
        height: 100,
        width: 150,
      ),
    ));
  }
}
