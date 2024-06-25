import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../helper/show_dailog.dart';
import 'custom_button.dart';
import 'custom_text_feild.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ForgetPasswordForm extends StatefulWidget {
  const ForgetPasswordForm({super.key});

  @override
  State<ForgetPasswordForm> createState() => _ForgetPasswordFormState();
}

class _ForgetPasswordFormState extends State<ForgetPasswordForm> {
  bool passwordVisible = true;
  IconData visibleIcon = Icons.visibility_off;
  TextEditingController emailController = TextEditingController();
  TextEditingController newPassController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;


  Future<void> resetPassword(String email, String newPassword) async {



    final url = Uri.parse(
        'https://egyptttourmate-001-site1.gtempurl.com/api/Adminstration/ForgetPassword');
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': emailController.text,
        'newPassword': newPassController.text,
      }),
    );

    if (response.statusCode == 200) {

      final result = jsonDecode(response.body);
      // Handle success, e.g., show a success dialog or navigate
      AwesomeDialog(
        context: context,
        dialogType: DialogType.success,
        animType: AnimType.bottomSlide,
        title: 'Success',
        desc: 'Password has been reset successfully!',

      ).show();
    } else {
      throw Exception('Failed to reset password');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
          key: formKey,
          autovalidateMode: autoValidateMode,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                textAlign: TextAlign.center,
                'That\'s ok. It happens! Enter your email to reset password ',
                style: GoogleFonts.radioCanada(fontSize: 18.sp),
              ),
              SizedBox(height: 10.h),
              CustomTextField(
                controller: emailController,
                hint: 'Enter your email',
                keyboardType: TextInputType.emailAddress,
                errorMessage: 'Please enter your email',
              ),
              SizedBox(height: 10.h),
              CustomTextField(
                controller: newPassController,
                hint: 'Enter your new password',
                keyboardType: TextInputType.text,
                obscureText: passwordVisible,
                errorMessage: 'Please enter your new password',
                  suffixIcon: IconButton(
                      onPressed: () {
                        visiblePassword();
                      },
                      icon: Icon(visibleIcon)),
              ),
              SizedBox(height: 10.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 100.w),
                child: CustomButton(
                  text: 'Reset Password',
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      try {
                        await resetPassword(
                          emailController.text,
                          newPassController.text,
                        );
                      } catch (e) {
                        // Handle error, e.g., show an error dialog
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.error,
                          animType: AnimType.bottomSlide,
                          title: 'Error',
                          desc: 'Failed to reset password',

                        ).show();
                      }
                    } else {
                      setState(() {
                        autoValidateMode = AutovalidateMode.always;
                      });
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
  void visiblePassword() {
    setState(() {
      if (passwordVisible == true) {
        passwordVisible = false;
        visibleIcon = Icons.visibility;
      } else if (passwordVisible == false) {
        passwordVisible = true;
        visibleIcon = Icons.visibility_off;
      }
    });
  }
}
