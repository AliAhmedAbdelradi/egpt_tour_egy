

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class PlaceDic extends StatelessWidget {
  static const String routeName = "dic";



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.cancel_outlined,
              color: Colors.black,
              size: 30,
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            InkWell(
              onTap: (){
                // Navigator.pushNamed(context, place_details.routeName);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,

              ),
            ),

            SizedBox(height: 15.h,),
            InkWell(
              onTap: (){},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,

              ),
            ),

            SizedBox(height: 15.h,),
            InkWell(
              onTap: (){},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,

              ),
            ),


          ],
        ),
      ),
    );
  }
}
