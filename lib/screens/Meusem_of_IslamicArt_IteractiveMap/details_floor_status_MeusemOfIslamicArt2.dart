import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../api_manager/api_manager.dart';
import '../../constant/constant.dart';

class DetailsFloorStatusMeusemOfIslamicArt2 extends StatefulWidget {
  const DetailsFloorStatusMeusemOfIslamicArt2({super.key});
  static const String routeName = "DetailsFloorStatusMeusemOfIslamicArt2";
  @override
  State<DetailsFloorStatusMeusemOfIslamicArt2> createState() => _DetailsFloorStatusState();
}

class _DetailsFloorStatusState extends State<DetailsFloorStatusMeusemOfIslamicArt2> {
  FlutterTts flutterTts = FlutterTts();
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
        actions: [
          ImageIcon(
            AssetImage("assets/images/logo.png"),
            color: Colors.black,
            size: 50.w,
          )
        ],
      ),
      body: FutureBuilder(
        future: ApiManager.getPlaceFloorRoomStatues(roomId: 14),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }

          final data = snapshot.data?.data ?? [];
          print(data);

          return Stack(

            children: [
              Center(
                child: Container(
                  width: double.infinity.w,
                  height: 300.h,
                  margin: EdgeInsets.only(bottom: 300.h),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                            data[3].imageLink ?? "",

                          ),fit: BoxFit.cover)),

                ),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Card(
                    margin: EdgeInsets.only(top:240.h),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(height: 20.h),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Text(
                              data[3].name ?? "",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 24.sp,
                                color: Colors.black,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(height: 20.h),
                          Divider(),
                          Text("description",style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.sp,
                            color: Colors.black,
                          ),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () =>
                                    _speak(data[3].description ?? ""),
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
                                    stop(data[3].description ?? "");
                                  },
                                  icon: Icon(Icons.pause,
                                      size: 30.w, color: primaryColor))
                            ],
                          ),
                          _buildInfoText("", data[3].description),

                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }

  Widget _buildInfoText(String title, String? value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$title",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              fontSize: 18.sp,
              color: Colors.black,
            ),
          ),
          Expanded(
            child: Text(
              textAlign: TextAlign.left,
              value ?? "N/A",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.normal,
                fontSize: 18.sp,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }



}
