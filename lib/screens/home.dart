import 'package:ept_mate/screens/plan_type_screen/plan_type.dart';
import 'package:ept_mate/screens/tabs/home_tab.dart';
import 'package:ept_mate/screens/tabs/tripPlans_tab.dart';
import 'package:ept_mate/screens/tabs/profile_tab.dart';
import 'package:ept_mate/screens/tabs/search_tab.dart';
import 'package:ept_mate/weather/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constant/constant.dart';
import '../model/UserModel.dart';
import '../model/UserModel2.dart';
import '../widgets/custom_nav_bar.dart';
import 'favourte_screen/favourite_Screen.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = 'home';

  final String username;

  HomeScreen({required this.username});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;
  List<Widget> tabs = [
    HomeTab(),
    SearchTab(),
    TripPlansTab(),
    ProfileTab()
  ];





  @override
  Widget build(BuildContext context) {

    return Scaffold(
      drawer: Drawer(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        backgroundColor: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: primaryColor,
              ),
              child: null,
            ),
            ListTile(
              title: Row(
                children: [
                  Icon(Icons.sunny, color: Colors.yellow),
                  SizedBox(width: 10.w),
                  Text('Weather',
                      style: GoogleFonts.poppins(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.normal,
                          color: Colors.black)),
                ],
              ),
              onTap: () {
                Navigator.pushNamed(context, weatherView.routeName);
              },
            ),
            ListTile(
              title: Row(
                children: [
                  Icon(Icons.favorite),
                  SizedBox(width: 10.w),
                  Text('Favorite',
                      style: GoogleFonts.poppins(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.normal,
                          color: Colors.black)),
                ],
              ),
              onTap: () {
                Navigator.pushNamed(context, FavouriteScreen.routeName);
              },
            ),

          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        index: index,
        onTabChange: (value) {
          setState(() {
            index = value;
          });
        },
      ),
      appBar: AppBar(
        actions: [
          Image(
            image: AssetImage("assets/images/logo.png"),
            height: 50.h,
            width: 50.w,
            color: Colors.black,
          ),
        ],
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(30.w),
                bottomLeft: Radius.circular(30.w))),
        centerTitle: true,
        title: Text(
          "Hi ${widget.username}",
          overflow:TextOverflow.ellipsis ,
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: 25.sp,
            fontWeight: FontWeight.normal,
          ),
        ),
        backgroundColor: primaryColor,
      ),
      body: tabs[index],
    );
  }
}
