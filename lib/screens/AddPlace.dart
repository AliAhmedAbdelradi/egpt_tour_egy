import 'package:ept_mate/api_manager/api_manager.dart';
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


  void _passBackSelectedData(String data, int id) {
    // Create a Map to pass both data and id
    Map<String, dynamic> result = {
      'data': data,
      'id': id,
    };

    // Pass the result Map back to the previous screen
    Navigator.pop(context, result);

    print(result); // Print the Map containing data and id
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

            final category = snapshot.data?.data ?? [];





            return ListView.builder(
              padding: const EdgeInsets.all(16),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    _passBackSelectedData(category[index].imageLink ?? "", category[index].id ?? 0);

                  },
                  child: Column(
                    children: [
                      Container(
                        width: 240.w,
                        height: 140.h,
                        padding: EdgeInsets.all(20),

                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                image:
                                NetworkImage(category[index].imageLink ?? ""),
                                fit: BoxFit.cover,
                                opacity: 0.7)),
                        child: Column(
                          children: [


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
                      SizedBox(height: 12.w,),


                    ],
                  ),
                );
              },

              itemCount: category.length,

            );
          },
        ));
  }
}