import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../api_manager/api_manager.dart';

class PlaceSearch extends SearchDelegate<String> {




  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return  null;
  }

  @override
  Widget buildResults(BuildContext context) {
    // Implement search results UI if needed
    return Container(
      child: FutureBuilder(
        future: ApiManager.getAllPlacess(),
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
              return Card(
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
                        SizedBox(width: 8.w), // Add some spacing between the image and text
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


                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
            itemCount: category.length,
          );
        },
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {


    return Center(
      child: Text('No results found for "$query"'),
    );
  }
}