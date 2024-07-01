import 'package:ept_mate/model/AddOrRemoveFavourites.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../api_manager/api_manager.dart';
import '../details_place/place_detail.dart';
class FavouriteScreen extends StatefulWidget {
  static const String routeName = "favourite";

  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _favouriteScreenState();
}

class _favouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("My Favourites",style:  GoogleFonts.poppins(
          fontWeight: FontWeight.bold,
          fontSize: 20, // Adjusted font size
          color: Colors.black, // Adjusted text color for better readability
        ),),
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
        future: ApiManager.getFavourite(),
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
            shrinkWrap: true,
            padding: const EdgeInsets.all(16),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => PlaceDicrip(PlaceId: category[index].id.toString()),
                    ),
                  );
                },
                child: Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  color: Colors.white70,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 150.w,
                            height: 100.h,
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
                                  child: Icon(
                                    Icons.favorite,
                                    color: Colors.redAccent,
                                  ),
                                ),
                                Spacer(),
                                Container(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                      category[index].name ?? "",
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12, // Adjusted font size
                                        color: Colors.white, // Adjusted text color for better readability
                                      )),
                                )],
                            ),
                          ),
                          SizedBox(width: 10.w), // Add some spacing between the image and text
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  category[index].description ?? "",
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13, // Adjusted font size
                                    color: Colors.black, // Adjusted text color for better readability
                                  ),
                                  overflow: TextOverflow.clip, // Handle overflow
                                  maxLines: 7, // Maximum number of lines to display
                                ),
                                MaterialButton(
                                  onPressed: ()
                                  {
                                    setState(() {
                                      ApiManager.DelFavourite(favId: category[index].id.toString() );
                                    });  // add | remove

                                  },
                                  child: Text("Remove"),
                                  textColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25)
                                  ),
                                  color: Colors.red,
                                )



                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
            itemCount: category.length,
          );
        },
      ),
    );
  }
}