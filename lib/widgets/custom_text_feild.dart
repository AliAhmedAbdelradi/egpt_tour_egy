
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constant/constant.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.hint,
      this.keyboardType,
      this.obscureText,
      this.suffixIcon,
      this.controller,
      this.errorMessage,
      this.validator});

  final String hint;
  final String? errorMessage;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator ??
          (value) => value?.trim().isEmpty == true ? errorMessage : null,
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        contentPadding:
            EdgeInsetsDirectional.symmetric(vertical: 13.h, horizontal: 10.w),
        suffixIcon: suffixIcon,
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.grey),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(50.w)),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: primaryColor),
          borderRadius: BorderRadius.circular(50.w),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(50.w),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(50.w),
        ),
      ),
    );
  }
}
