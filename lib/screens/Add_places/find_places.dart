import 'package:ept_mate/screens/AddPlace.dart';
import 'package:ept_mate/screens/home.dart';
import 'package:ept_mate/screens/tabs/tripPlans_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../model/trip.dart';
import '../select_city/btn1.dart';

class planDetails extends StatefulWidget {
  static const String routeName = "add places";

  planDetails({required this.trip});

  final Trip trip;

  @override
  State<planDetails> createState() => _planDetailsState();
}

class _planDetailsState extends State<planDetails> {
  List<List<String>> places = [];
  List<int> placesIDs = []; // List to store all place IDs

  @override
  void initState() {
    super.initState();
    // Initialize places list based on dayNums length
    places = List.generate(widget.trip.dayNums!.length, (index) => []);
  }

  Future<void> saveTrip() async {
    final url = 'https://egyptttourmate-001-site1.gtempurl.com/api/UserTrips/Add';
    final headers = {
      'accept': '*/*',
      'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1laWQiOiJiMzU1M2MyMy0wNTBiLTQyNTYtOTRiNC05NThiNDgxOWNlNzUiLCJVc2VySUQiOiJiMzU1M2MyMy0wNTBiLTQyNTYtOTRiNC05NThiNDgxOWNlNzUiLCJuYmYiOjE3MTk4MDU3MTQsImV4cCI6MTcxOTgxNjUxMywiaWF0IjoxNzE5ODA1NzE0LCJpc3MiOiJFR3lwdFRvdXJNYXRlQXBpIiwiYXVkIjoiU2VjdXJlQXBpVXNlciJ9.uiibTDaTSyNqMh257OCwTL_hVY9TkN4mHtytAaV1p0c',
      'Content-Type': 'application/json',
    };

    // Prepare the request body
    final body = jsonEncode({
      'nameOfTrip': widget.trip.nameOfTrip,
      'startDate': widget.trip.startDate!.toIso8601String(),
      'endDate': widget.trip.endDate!.toIso8601String(),
      'placesID': placesIDs,
      'dayNums': widget.trip.dayNums ?? [],
    });

    print('Request URL: $url');
    print('Request Headers: $headers');
    print('Request Body: $body');

    try {
      final response = await http.post(Uri.parse(url), headers: headers, body: body);

      print('Response Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');

      if (response.statusCode == 200) {
        // Successfully saved the trip
        Navigator.pushNamed(context, TripPlansTab.routeName);
      } else {
        // Handle other status codes or errors
        print('Failed to save trip: ${response.statusCode}');
        print('Response body: ${response.body}');
        // Handle error here, e.g., show a dialog or snackbar
      }
    } catch (e) {
      // Catch any exceptions that occur during the request
      print('Error saving trip: $e');
      // Handle error here, e.g., show a dialog or snackbar
    }
  }

  @override
  Widget build(BuildContext context) {
    DateTime? start = widget.trip.startDate;
    var dates = List.generate(widget.trip.dayNums!.length + 1, (index) {
      return start!.add(Duration(
          days: widget.trip.dayNums!.sublist(0, index).fold(0, (a, b) => a + b)));
    });

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              HomeScreen.routeName,
                  (route) => false,
            );
          },
          icon: Icon(
            Icons.cancel_outlined,
            color: Colors.black,
            size: 30,
          ),
        ),
        actions: [
          ImageIcon(
            AssetImage("assets/images/logo.png"),
            color: Colors.black,
            size: 50,
          )
        ],
      ),
      body: ListView(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        children: [
          ...List.generate(widget.trip.dayNums!.length, (index) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(17),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "${widget.trip.cityName![index]}",
                            style: GoogleFonts.poppins(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        Spacer(),
                        Text(
                          "${widget.trip.dayNums![index]} days",
                          style: GoogleFonts.poppins(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                    height: 77.h,
                    width: 360.w,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/Aswan_place.png"),
                        // Replace with dynamic image from the trip data
                        fit: BoxFit.fill,
                        opacity: .9,
                      ),
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        width: 1.5.w,
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.calendar_month),
                      SizedBox(width: 10.w),
                      Text(
                        "from (${dates[index].day}) to (${dates[index + 1].day}) ",
                        style: GoogleFonts.poppins(
                          color: Colors.black87,
                          fontSize: 25,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      ...List.generate(
                        places[index].length,
                            (placeIndex) {
                          return Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 13.w),
                                height: 40.h,
                                width: 130.w,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  image: DecorationImage(
                                    image: NetworkImage(places[index][placeIndex]),
                                    fit: BoxFit.cover,
                                    opacity: 0.7,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    places[index].removeAt(placeIndex);
                                    placesIDs.removeAt(placeIndex); // Remove corresponding placeID
                                  });
                                },
                                icon: Icon(Icons.delete),
                                color: Colors.red,
                              )
                            ],
                          );
                        },
                      ).toList(),
                      InkWell(
                        onTap: () async {
                          var selectedData = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AddPlace(
                                placeID: '${widget.trip.placesID![index]}',
                              ),
                            ),
                          );
                          if (selectedData != null) {
                            setState(() {
                              // Extract 'data' (image URL) and 'id' (place ID) from selectedData
                              var imageUrl = selectedData['data'];
                              var id = selectedData['id'];
                              places[index].add(imageUrl);
                              placesIDs.add(id); // Add corresponding placeID
                              places[index] = places[index].toSet().toList();
                              placesIDs = placesIDs.toSet().toList(); // Ensure uniqueness
                            });
                          }
                        },
                        child: Container(
                          child: Center(
                            child: Text(
                              "+Add place",
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          height: 27.h,
                          width: 120.w,
                          decoration: BoxDecoration(
                            color: Color(0xff89C9FF),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ],
            );
          }),
          SizedBox(
            height: 70.h,
          ),
          Row(
            children: [
              Btn1(
                Color(0xFF89C9FF),
                Colors.white,
                "Back",
                    () {
                  Navigator.pop(context);
                },
              ),
              Spacer(),
              Btn1(
                Colors.white,
                Color(0xff89C9FF),
                "Save",
                    () {
                  saveTrip();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
