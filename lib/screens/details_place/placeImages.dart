import 'package:ept_mate/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PlaceImagesCarousel extends StatelessWidget {
  final List<String> placeImages;

  const PlaceImagesCarousel({Key? key, required this.placeImages}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity.w,
      height: 200.h,
      child: PageView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: placeImages.length,
        itemBuilder: (context, index) {
          return Image.network(
            placeImages[index],
            fit: BoxFit.cover,
          );
        },
      ),
    );
  }
}
