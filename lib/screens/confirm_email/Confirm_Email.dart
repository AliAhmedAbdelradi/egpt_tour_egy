import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:ept_mate/constant/constant.dart';
import 'package:ept_mate/screens/sing_in.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../helper/show_dailog.dart';
import '../days_counter/btn2.dart';
import '../select_city/btn1.dart';

class EmailConfirmationScreen extends StatefulWidget {
  static const String routeName = "emailConfirmationScreen";

  @override
  _EmailConfirmationScreenState createState() =>
      _EmailConfirmationScreenState();
}

class _EmailConfirmationScreenState extends State<EmailConfirmationScreen> {
  final _emailController = TextEditingController();
  final _codeController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool _isLoading = false;
  final Dio _dio = Dio();

  @override
  void dispose() {
    _emailController.dispose();
    _codeController.dispose();
    super.dispose();
  }

  Future<void> _confirmEmail() async {
    if (!_formKey.currentState!.validate()) {
      return; // If the form is invalid, do not proceed
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final response = await _dio.post(
        'https://egyptttourmate-001-site1.gtempurl.com/api/Adminstration/ConfirmEmail',
        data: {
          'userEmail': _emailController.text,
          'code': _codeController.text,
        },
      );

      setState(() {
        _isLoading = false;
      });

      if (response.statusCode == 200) {
        awesomeDialog(
            'Done',
            'Email confirmed successfully!',
            context,
            DialogType.success
        );
      } else {
        awesomeDialog(
            'error',
            'Failed to confirm email',
            context,
            DialogType.error);
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      awesomeDialog(
          'error',
          'Failed to confirm email',
          context,
          DialogType.error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: 260.h,
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                if (_isLoading)
                  Center(
                    child: CircularProgressIndicator(),
                  )
                else
                  Column(
                    children: [
                      TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                            fontSize: 13.sp,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide(color: primaryColor),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16.h),
                      TextFormField(
                        controller: _codeController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Confirmation Code',
                          labelStyle: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                            fontSize: 13.sp,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide(color: primaryColor),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the confirmation code';
                          }
                          if (value.length != 4 || !RegExp(r'^\d{4}$').hasMatch(value)) {
                            return 'Please enter a 4-digit code';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16.h),
                      ElevatedButton(
                        onPressed: _confirmEmail,
                        child: Text(
                          'Confirm Email',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                            fontSize: 15.sp,
                            color: primaryColor,
                          ),
                        ),
                      ),


                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
