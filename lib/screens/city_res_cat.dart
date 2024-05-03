import 'package:ept_mate/api_manager/api_manager.dart';
import 'package:ept_mate/screens/places_By_Cat_And_City.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CityResCat extends StatefulWidget {
  static const String routeName = "cityres";
  String categoryId;
  CityResCat ({ required this.categoryId});

  @override
  State<CityResCat> createState() => _CityResCatState();
}

class _CityResCatState extends State<CityResCat> {
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
        body: Padding(
          padding: EdgeInsets.only(top: 40.h),
          child: FutureBuilder(
            future: ApiManager.getCity(),
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
                itemBuilder: (context, index) {
                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (_)=> Places_By_cat_And_City(cityID: cate[index].id.toString(),CategoryID: widget.categoryId,)));
                          },
                          child: Container(
                            width: 250.w,
                            height: 160.h,
                            padding: EdgeInsets.all(20),

                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                    image:
                                    NetworkImage(cate[index].imageLink ?? ""),
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
                                      cate[index].name ?? "",
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: Colors.white),
                                    )),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20,)
                      ],
                    ),
                  );
                },
                itemCount: cate.length,
              );
            },
          ),
        ));
  }
}
