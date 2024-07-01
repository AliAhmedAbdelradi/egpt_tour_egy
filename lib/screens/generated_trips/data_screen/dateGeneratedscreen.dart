



import 'package:ept_mate/screens/home.dart';
import 'package:intl/intl.dart';
import 'package:ept_mate/api_manager/api_manager.dart';
import 'package:ept_mate/model/trip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Add_places/find_places.dart';
import '../../customize_screen/Select_Category/btn.dart';
import '../addPlace_screen/AddGenerated_places.dart';



class DateGeneratedScreen extends StatefulWidget {
  DateGeneratedScreen({super.key, required this.trip});
  Trip trip;
  static const String routeName = "DateGeneratedScreen";

  @override
  State<DateGeneratedScreen> createState() => _DateScreenState();
}

class _DateScreenState extends State<DateGeneratedScreen>
{
  DateTimeRange? _dateTimeRange;
  DateTime time = DateTime.now();
  DateFormat dateFormat = DateFormat("yyyy-MM-dd");




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.popAndPushNamed(context, HomeScreen.routeName);
            },
            icon: Icon(
              Icons.cancel_outlined,
              color: Colors.black,
              size: 30.w,
            )),
        actions: [
          ImageIcon(
            AssetImage("assets/images/logo.png"),
            color: Colors.black,
            size: 50.w,
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Select your trips start date ",
                style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 35.sp,
                    fontWeight: FontWeight.w600)),
            SizedBox(
              height: 10.h,
            ),
            Text("Step 5",
                style: GoogleFonts.poppins(
                    color: Colors.black38,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600)),
            SizedBox(
              height: 30.h,
            ),
            Row(
              children: [
                SizedBox(width: 10.w,),
                Text("Start date",
                    style: GoogleFonts.poppins(
                        color: Colors.black38,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600)),
                SizedBox(
                  width: 100.w,
                ),
                Text("End date",
                    style: GoogleFonts.poppins(
                        color: Colors.black38,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600)),
              ],
            ),

            Container(
              width: 343.w,
              height: 43.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 0.w, color: Colors.black)),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      _dateTimeRange?.start.toString().substring(0,10)??"",
                      style: GoogleFonts.poppins(
                          fontSize: 15.sp, fontWeight: FontWeight.w400),
                    ),


                  ),
                  SizedBox(width: 50.w,),
                  Text(
                    _dateTimeRange?.end.toString().substring(0,10)??"",
                    style: GoogleFonts.poppins(
                        fontSize: 15.sp, fontWeight: FontWeight.w400),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      selectDate(context);
                    },
                    child: Icon(
                      Icons.calendar_month,
                      size: 22.w,
                      color: Color(0xFF89C9FF),
                    ),
                  )
                ],
              ),
            ),

            Spacer(),
            Row(
              children: [
                Btn(Color(0xFF89C9FF), Colors.white, "Back", () {
                  Navigator.pop(context);
                }),
                Spacer(),
                Btn(Colors.white, Color(0xFF89C9FF), "Continue", () async{
                  await  ApiManager.addTrip(widget.trip);
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>AddGeneratedScreen(trip: widget.trip,)));
                }),
              ],
            )
          ],
        ),
      ),
    );
  }

  selectDate(BuildContext context) async {
    final DateTime? res = await showDatePicker(
        context: context,
        firstDate: time,
        currentDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 301)));

    if(res!=null){
      setState(() {

      });
      _dateTimeRange=DateTimeRange(start: res, end: res.add(Duration(days:widget.trip.dayNums!.reduce((value, element) => value + element))));

    }
    widget.trip.startDate=_dateTimeRange?.start;
    widget.trip.endDate=_dateTimeRange?.end;

  }
}
