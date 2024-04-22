



import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../fav_categ/fav_categ.dart';

class FavouriteScreen extends StatefulWidget {
  static const String routeName = "favourite";

  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _favouriteScreenState();
}

class _favouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    return  ScreenUtilInit(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            leading: InkWell( onTap: () {
              Navigator.pop(context);
            },
                child: const Icon(Icons.arrow_back, color: Colors.black87, size: 30)),
            leadingWidth: 30.w,
            actions: [const Image(image: AssetImage("assets/images/logo.png"))],
          ),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: ListView(
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin:   EdgeInsets.only(left: 2.w),
                          child:  Column(
                            children: [
                              Text(
                                "Experience",
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 4.h,
                              ),
                              Text(
                                "3 favourite",
                                style:
                                    TextStyle(fontSize: 15, color: Colors.black87),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                     SizedBox(
                      height: 20.h,
                    ),
                     Container(
                         decoration: BoxDecoration(shape: BoxShape.rectangle ),

                         child: Image(image: AssetImage("assets/images/Rectangle 1.png"), )),
                    FavCateg(
                      "Jifton Island",
                      "is the first nature reserve in the Red Sea",
                      "and is one of the most important natural \n                     habitats of seagulls",
                      "Hurghada",
                    ),
                     SizedBox(height: 10.h,),
                    const Image(image: AssetImage("assets/images/Rectangle 2.png")),
                    FavCateg(
                      "River nile",
                      "It's the longest river on Earth There's more",
                      "than one Nile People spent centuries\n searching for its source habitats of seagulls",
                      "cairo",
                    ),
                     SizedBox(height: 10.h,),
                    const Image(image: AssetImage("assets/images/Rectangle 3.png")),
                    FavCateg(
                      "Pyramids",
                      "They were built to honor certain Pharaohs ",
                      " of the fourth ruling dynasty of Egypt \n                     habitats of seagulls",
                      "Giza",
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );

  }
}
