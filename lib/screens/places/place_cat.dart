import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PlaceCat extends StatelessWidget {
  String text1;
  String text2;

  PlaceCat(this.text1, this.text2, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 340,
          height: 70,
          margin: EdgeInsets.only(left: 0),
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(20))),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(text1, style: TextStyle(fontSize: 20)),
                  ],
                ),
                SizedBox(
                  height: 6.h,
                ),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.yellow, size: 12),
                    Icon(Icons.star, color: Colors.yellow, size: 12),
                    Icon(Icons.star, color: Colors.yellow, size: 12),
                    Icon(Icons.star, color: Colors.yellow, size: 12),
                    Icon(Icons.star, color: Colors.yellow, size: 12),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      text2,
                      style: TextStyle(fontSize: 12),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
