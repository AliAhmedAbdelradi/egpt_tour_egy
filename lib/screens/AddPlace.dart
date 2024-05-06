import 'package:ept_mate/api_manager/api_manager.dart';
import 'package:ept_mate/model/trip.dart';
import 'package:ept_mate/screens/InteractiveMap/interactive_map.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AddPlace extends StatefulWidget {
  static String routeName = 'AddPlace';
  String placeID;
  late String selectedData;


  AddPlace({required this.placeID});


  @override
  State<AddPlace> createState() => _Places_By_cat_And_CityState();
}

class _Places_By_cat_And_CityState extends State<AddPlace> {


  void _passBackSelectedData(String data) {
    Navigator.pop(context, data);

    print(data);// Pass back data to previous screen
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
          future: ApiManager.getplaceByCityId(
              cityId: widget.placeID),
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
                return GestureDetector(
                  onTap: () {
                    _passBackSelectedData(category[index].name ?? "");
                  },
                  child: Column(
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
                                )

                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 12,),


                    ],
                  ),
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