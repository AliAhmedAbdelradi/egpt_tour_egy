import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../api_manager/api_manager.dart';

class PlaceFloorRoomStatues extends StatefulWidget {

  static const String routeName = "PlaceFloorRoomStatues";
  @override
  State<PlaceFloorRoomStatues> createState() => _DetailsFloorState();
}

class _DetailsFloorState extends State<PlaceFloorRoomStatues> {
  PageController _pageController = PageController();

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
        future: ApiManager.getPlaceFloorRoomStatues(roomId: 1),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }

          final data = snapshot.data?.data ?? [];
          print(data);

          return PageView.builder(
            controller: _pageController,
            itemCount: data.length,
            itemBuilder: (context, index) {
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
                            data[index].imageLink ?? "",

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
                                  data[index].name ?? "",
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
                              _buildInfoText("Period", data[index].period),
                              Divider(),
                              _buildInfoText("Dynasty", data[index].dynasty),
                              Divider(),
                              _buildInfoText("Height", data[index].height),
                              Divider(),
                              _buildInfoText("Place of Discovery",
                                  data[index].placeOfDiscovery),
                              Divider(),
                              _buildInfoText("Material", data[index].material),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              );
            },
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
            "$title: ",
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

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
