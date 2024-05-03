import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../constant/constant.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar(
      {super.key, required this.index, required this.onTabChange});

  final int index;
  final void Function(int)? onTabChange;

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return GNav(
        selectedIndex: widget.index,
        onTabChange: widget.onTabChange,
        tabMargin:
            EdgeInsetsDirectional.symmetric(horizontal: 8.w, vertical: 10.h),
        rippleColor: Colors.white,
        // tab button ripple color when pressed
        hoverColor: Colors.white,
        // tab button hover color

        tabBorderRadius: 15,
        gap: 8,
        // the tab button gap between icon and text
        color: Colors.black,
        // unselected icon color
        activeColor: Colors.white,
        // selected icon and text color
        iconSize: 24,
        // tab button icon size
        tabBackgroundColor: primaryColor,
        // selected tab background color
        padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 4.h),
        // navigation bar padding
        tabs: const [
          GButton(
            icon: Icons.home,
            text: 'Home',
          ),
          GButton(
            icon: Icons.search,
            text: 'Search',
          ),
          GButton(
            icon: Icons.airplanemode_active_sharp,
            text: 'Trip Plans',
          ),
          GButton(
            icon: Icons.person,
            text: 'Profile',
          )
        ]);
  }
}
