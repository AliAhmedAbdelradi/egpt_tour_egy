import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constant/constant.dart';

class DotsWidget extends StatelessWidget {
  const DotsWidget({
    super.key,
    required this.currentIndex,
  });

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
            content.length,
            (index) => AnimatedContainer(
                margin: EdgeInsetsDirectional.only(end: 2.w),
                decoration: BoxDecoration(
                    color: currentIndex == index ? primaryColor : Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(50.w))),
                height: 10.h,
                width: currentIndex == index ? 50.w : 20.w,
                duration: const Duration(milliseconds: 600))));
  }
}
