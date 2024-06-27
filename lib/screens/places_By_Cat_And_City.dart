import 'package:ept_mate/api_manager/api_manager.dart';
import 'package:ept_mate/screens/InteractiveMap/interactive_map.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constant/constant.dart';
import 'details_place/place_detail.dart';


class Places_By_cat_And_City extends StatefulWidget {
  static String routeName = 'Places_By_cat_And_City';
  String cityID;
  String CategoryID;

  Places_By_cat_And_City({required this.CategoryID, required this.cityID});

  @override
  State<Places_By_cat_And_City> createState() => _Places_By_cat_And_CityState();
}

class _Places_By_cat_And_CityState extends State<Places_By_cat_And_City> {
  bool _isFavorited = false;
  void _toggleFavorite() {
      setState(() {

      });
      _isFavorited = !_isFavorited;

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          margin: EdgeInsets.only(top: 10),
          width: 200.w,
          height: 50.h,
          padding: const EdgeInsets.all(10),
          child: TextFormField(
            decoration: InputDecoration(
              contentPadding: EdgeInsetsDirectional.symmetric(
                  vertical: 13.h, horizontal: 10.w),
              suffixIcon: Icon(
                Icons.search,
                size: 20,
              ),
              hintText: "Search",
              hintStyle: const TextStyle(color: Colors.grey, fontSize: 15),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(50.w)),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue),
                borderRadius: BorderRadius.circular(50.w),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(50.w),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.red),
                borderRadius: BorderRadius.circular(50.w),
              ),
            ),
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            size: 30,
          ),
          color: Colors.black,
        ),
        actions: [
          Image(
            image: const AssetImage("assets/images/logo.png"),
            width: 60.w,
            height: 55.h,
          )
        ],
      ),
      body: FutureBuilder(
        future: ApiManager.getPlaceById(
            categoryId: widget.CategoryID, cityId: widget.cityID),
        builder: (context, snapshot) {
          print(snapshot.data?.data);
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text("no data entered"));
          }

          final category = snapshot.data?.data ?? [];

          return ListView.separated(
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
                        image: NetworkImage(category[index].imageLink ?? ""),
                        fit: BoxFit.cover,
                        opacity: 0.7,
                      ),
                    ),
                    child: Column(


                      children: [
                        Container(
                          alignment: Alignment.topRight,
                          child: InkWell(
                            onTap: () {
                              ApiManager.addAndRemoveFromFavourite(placeId: category[index].id.toString());
                            },
                            child: IconButton(onPressed: _toggleFavorite,icon: Icon(
                              Icons.favorite_border,
                              color: _isFavorited ? Colors.red : Colors.grey,
                            ),)
                          ),
                        ),
                        Spacer(),
                        Container(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            category[index].name ?? "",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 12.w,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Column(
                    children: [
                      Text(
                        "description : ${category[index].description}",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),

                     InkWell(
                       onTap: () {
                         Navigator.push(context, MaterialPageRoute(builder: (_)=> PlaceDicrip( PlaceId: category[index].id.toString(),)));
                       },
                       child: Column(
                         children: [
                           Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                               Text("See More",style:GoogleFonts.poppins(
                                   fontWeight: FontWeight.normal,
                                   color:primaryColor  ,
                                   fontSize: 22),),
                               Icon(Icons.navigate_next,color: primaryColor,size: 22,)
                             ],
                           ),

                         ],
                       ),
                     ),

                ],
              );
            },
            separatorBuilder: (context, index) {
              return Divider(
                thickness: 2,
                color: Colors.black,
              );
            },
            itemCount: category.length,
          );
        },
      ),
    );
  }
}
