import 'package:flutter/material.dart';

class detail_shape extends StatelessWidget {
  detail_shape(this.img1);

  String img1;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 169,
      width: 329,
      child: Image(image: AssetImage(img1), fit: BoxFit.fill),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1, color: Colors.transparent)),
    );
  }
}
