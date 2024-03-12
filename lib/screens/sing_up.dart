
import 'package:ept_mate/screens/sing_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../widgets/connected_with_row.dart';
import '../widgets/have_acc_or_not.dart';
import '../widgets/sing_up_form.dart';
import '../widgets/singin_and_singup_logo.dart';
import '../widgets/title_and_desc.dart';

class SingUp extends StatelessWidget {
  static String routeName = 'singUp';

  const SingUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(bottom: 8.0.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Center(child: Logo()),
              const TitleAndDescription(
                  title: 'Sign up', desc: 'please sign up to continue'),
              SizedBox(height: 10.h),
              const SingUpForm(),
              //const ConnectedWithRow(),


             // SizedBox(height: 5.h),
              HaveAccountOrNot(
                questionText: 'Already  have an account ? ',
                goToPage: 'sign in',
                onTap: () {
                  Navigator.pushReplacementNamed(context, SingIn.routeName);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
