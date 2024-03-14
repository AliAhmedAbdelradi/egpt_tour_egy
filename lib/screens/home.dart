
import 'package:ept_mate/screens/plan_type_screen/plan_type.dart';
import 'package:ept_mate/screens/tabs/home_tab.dart';
import 'package:ept_mate/screens/tabs/location_tab.dart';
import 'package:ept_mate/screens/tabs/profile_tab.dart';
import 'package:ept_mate/screens/tabs/search_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constant/constant.dart';
import '../widgets/custom_nav_bar.dart';
import 'favourte_screen/favourite_Screen.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = 'home';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;
  List<Widget> tabs = const [
    HomeTab(),
    SearchTab(),
    LocationTab(),
    ProfileTab()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          backgroundColor: Colors.white,
          child: ListView(

              // Important: Remove any padding from the ListView.
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
                      Icon(Icons.airplanemode_active_sharp),
                        SizedBox(width: 10,),
                        Text('Trip Plans',style:GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                            color: Colors.black),),
                    ],
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, PlanType.routeName);
                  },
                ),
                ListTile(
                  title: Row(
                    children: [
                      Icon(Icons.favorite),
                        SizedBox(width: 10,),
                        Text('Favorite',style:GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                            color: Colors.black),),
                    ],
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, FavouriteScreen.routeName);
                  },
                ),
                ListTile(
                  title: Row(
                    children: [
                      Icon(Icons.settings),
                        SizedBox(width: 10,),
                        Text('Settings',style:GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                            color: Colors.black),),
                    ],
                  ),
                  onTap: () {
                    //Navigator.pushNamed(context, PlanType.routeName);
                  },
                ),
              ])),
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
            height: 50,
            width: 50,
            color: Colors.black,
          ),
        ],
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(30.w),
                bottomLeft: Radius.circular(30.w))),
        centerTitle: true,
        title: Text(
          "Hi, Friend",
          style: TextStyle(fontSize: 24),
        ),
        backgroundColor: primaryColor,
      ),
      body: tabs[index],
    );
  }
}
