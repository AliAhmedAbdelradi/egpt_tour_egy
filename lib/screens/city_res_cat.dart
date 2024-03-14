import 'package:ept_mate/api_manager/api_manager.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';


class CityResCat extends StatelessWidget {
  static const String routeName = "cityres";

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
          padding: const EdgeInsets.all(30),
          child: FutureBuilder(
            future: ApiManger.getData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Center(child: Text(snapshot.error.toString()));
              }

              final cate = snapshot.data?.data ?? [];

              return ListView.separated(
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Row(
                        children: [
                          Container(
                              width: 130.w,
                              height: 90.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20)),
                              child: Image.network(cate[index].imageLink ?? "")),
                          Spacer(),
                          Text(
                            cate[index].name ?? "",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.normal, color: Colors.black, fontSize: 20),
                          ),
                        ],
                      ),
                      Center(
                        child: Text(
                          cate[index].description ?? "",
                          style: GoogleFonts.poppins(),
                        ),
                      ),




                    ],
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    thickness: 2,
                  );
                },
                itemCount: cate.length,
              );
            },
          ),
        ));
  }
}
