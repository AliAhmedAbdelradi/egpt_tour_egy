import 'package:awesome_dialog/awesome_dialog.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

import '../cubits/login/login__cubit.dart';
import '../cubits/login/login__state.dart';
import '../helper/show_dailog.dart';
import '../screens/forget_password.dart';
import '../screens/home.dart';
import 'custom_button.dart';
import 'custom_text_feild.dart';

class SingInForm extends StatefulWidget {
  const SingInForm({super.key});

  @override
  State<SingInForm> createState() => _SingInFormState();
}

class _SingInFormState extends State<SingInForm> {
  bool passwordVisible = true;
  IconData visibleIcon = Icons.visibility_off;
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            Navigator.pushReplacementNamed(context, HomeScreen.routeName);
            Fluttertoast.showToast(
                msg: "Successfully Logged In",
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 5,
                backgroundColor: Colors.green,
                textColor: Colors.white,
                fontSize: 16.0);
          } else if(state is LoginErrorState){
            awesomeDialog('error', 'wrong user name or password', context,
                DialogType.error);
          }
        },
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.all(16.w),
            child: Form(
              key: formKey,
              autovalidateMode: autoValidateMode,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    margin: EdgeInsetsDirectional.symmetric(
                        vertical: 10.h, horizontal: 10.w),
                    alignment: Alignment.topLeft,
                    child: Text(
                      'User Name',
                      style: GoogleFonts.radioCanada(
                          fontWeight: FontWeight.bold, fontSize: 16.sp),
                    ),
                  ),
                  CustomTextField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {

                          return "please enter your user name ";
                        }
                        return null;
                      },
                      controller: emailController,
                      hint: 'Enter Your User Name',
                      keyboardType: TextInputType.emailAddress),
                  Container(
                    margin: EdgeInsetsDirectional.symmetric(
                        vertical: 10.h, horizontal: 10.w),
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Password',
                      style: GoogleFonts.radioCanada(
                          fontWeight: FontWeight.bold, fontSize: 16.sp),
                    ),
                  ),
                  CustomTextField(
                      validator: (value) {
                        if(value!.length<8){
                          return "password can not less 8 characters";
                        }
                        RegExp regex=RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                        var passNonNullValue=value??"";
                        if(passNonNullValue.isEmpty){
                          return ("Password is required");
                        }
                        else if(passNonNullValue.length<8){
                          return ("Password Must be more than 7 characters");
                        }
                        else if(!regex.hasMatch(passNonNullValue)){
                          return ("Password should contain upper,lower,digit and Special character ");
                        }

                        return null;
                      },
                      controller: passwordController,
                      hint: 'Enter Your Password',
                      obscureText: passwordVisible,
                      suffixIcon: IconButton(
                          onPressed: () {
                            visiblePassword();
                          },
                          icon: Icon(visibleIcon))),
                  SizedBox(height: 5.h),
                  Container(
                    margin: EdgeInsetsDirectional.symmetric(
                        vertical: 5.h, horizontal: 10.w),
                    alignment: Alignment.bottomRight,
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                            context, ForgetPasswordScreen.routeName);
                      },
                      child: Text(
                        'Forget Password ?',
                        style: GoogleFonts.radioCanada(
                            fontWeight: FontWeight.bold,
                            fontSize: 14.sp,
                            color: Colors.red),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 25.w, vertical: 10.h),
                    child: state is LoginLoadingState
                        ? const Center(child: CircularProgressIndicator())
                        : CustomButton(
                            text: 'Sign In',
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                formKey.currentState!.save();
                                LoginCubit.get(context).UserLogin(
                                    emailController.text,
                                    passwordController.text);
                              } else {
                                autoValidateMode = AutovalidateMode.always;
                                setState(() {});
                              }
                            }),
                  ),
                ],
              ),
            ),
          );
        },
      ),
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
