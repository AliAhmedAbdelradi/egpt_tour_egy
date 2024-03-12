
import 'package:ept_mate/screens/sing_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/connected_with_row.dart';
import '../widgets/have_acc_or_not.dart';
import '../widgets/sing_in_form.dart';
import '../widgets/singin_and_singup_logo.dart';
import '../widgets/title_and_desc.dart';


class SingIn extends StatelessWidget {
  static String routeName = 'singIn';

  const SingIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
          const Center(child: Logo()),
          const TitleAndDescription(
              title: 'Sign In', desc: 'please sign in to continue'),
          SizedBox(height: 30.h),
          const SingInForm(),
          //const ConnectedWithRow(),


          SizedBox(height: 5.h),
          HaveAccountOrNot(
            questionText: 'Don’t have an account ? ',
            goToPage: 'sign up',
            onTap: () {
              Navigator.pushReplacementNamed(context, SingUp.routeName);
            },
          )
        ],
      ),
    ));
  }

}