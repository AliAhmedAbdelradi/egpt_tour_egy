import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../helper/show_dailog.dart';
import 'custom_button.dart';
import 'custom_text_feild.dart';

class ForgetPasswordForm extends StatefulWidget {
  const ForgetPasswordForm({super.key});

  @override
  State<ForgetPasswordForm> createState() => _ForgetPasswordFormState();
}

class _ForgetPasswordFormState extends State<ForgetPasswordForm> {
  TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autoValidateMode,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            textAlign: TextAlign.center,
            'That\'s ok. it happens! Enter your email to reset password ',
            style: GoogleFonts.radioCanada(fontSize: 18.sp),
          ),
          SizedBox(height: 10.h),
          CustomTextField(
              controller: emailController,
              hint: 'Enter your email',
              keyboardType: TextInputType.emailAddress,
              errorMessage: 'please enter your email'),
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 100.w),
            child: CustomButton(
              text: 'Reset Password',
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  resetPassword();
                } else {
                  autoValidateMode = AutovalidateMode.always;
                  setState(() {});
                }
              },
            ),
          )
        ],
      ),
    );
  }

  void resetPassword() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text);
      awesomeDialog(
          'info',
          'We have sent a link to your email to reset password',
          context,
          DialogType.info);
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }
}
