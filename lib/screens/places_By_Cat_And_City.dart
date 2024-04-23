import 'package:ept_mate/api_manager/api_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Places_By_cat_And_City extends StatefulWidget {
  static String routeName = 'Places_By_cat_And_City';
  String cityID;
  String CategoryID;

  Places_By_cat_And_City({required this.CategoryID, required this.cityID});


  @override
  State<Places_By_cat_And_City> createState() => _Places_By_cat_And_CityState();
}

class _Places_By_cat_And_CityState extends State<Places_By_cat_And_City> {
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
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.w)),
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
            if (snapshot == null) {
              return Center(child: Text("No Data Entry"));
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
                              image:
                              NetworkImage(category[index].imageLink ?? ""),
                              fit: BoxFit.cover,
                              opacity: 0.7)),
                      child: Column(
                        children: [
                          Container(
                              alignment: Alignment.topRight,
                              child: Icon(
                                Icons.favorite_border,
                                color: Colors.white,
                              )

                          ),
                          Spacer(),
                          Container(
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                category[index].name ?? "",
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Colors.white),
                              )),
                        ],
                      ),
                    ),
                    SizedBox(width: 12,),

                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "${category[index].description ?? ""}",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                          fontSize: 20),
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
        ));
  }
}
