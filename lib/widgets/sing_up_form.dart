import 'package:awesome_dialog/awesome_dialog.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../constant/constant.dart';
import '../cubits/register/register__cubit.dart';
import '../cubits/register/register__state.dart';
import '../helper/show_dailog.dart';
import '../screens/confirm_email/Confirm_Email.dart';
import '../screens/home.dart';
import 'custom_button.dart';
import 'custom_text_feild.dart';

class SingUpForm extends StatefulWidget {
  const SingUpForm({super.key});

  @override
  State<SingUpForm> createState() => _SingUpFormState();
}

class _SingUpFormState extends State<SingUpForm> {
  bool passwordVisible = true;
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  IconData visibleIcon = Icons.visibility_off;

  TextEditingController userNameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterSuccessState) {
            if (state.userModel2.status != null) {
              showDetalis3();
              Fluttertoast.showToast(
                  msg: "Send Confirmation code Successfully",
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 5,
                  backgroundColor: primaryColor,
                  textColor: Colors.white,
                  fontSize: 16.0);
            }
          } else if (state is RegisterErrorState) {
            awesomeDialog(
                'error',
                'Oops!! Something Went Wrong, Please Try Again',
                context,
                DialogType.error);
          }
        },
        builder: (context, state) {
          return Form(
            key: formKey,
            autovalidateMode: autoValidateMode,
            child: Padding(
              padding: EdgeInsets.all(16.0.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomTextField(
                    errorMessage: 'please enter your user name',
                    hint: 'Enter Your Username',
                    controller: userNameController,
                  ),
                  SizedBox(height: 10.h),
                  CustomTextField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "please enter your Email   ";
                      }
                      final bool emailValid = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[com]+")
                          .hasMatch(value);
                      if (!emailValid) {
                        return "enter valid email(.gmail,.yahoo)";
                      }
                      return null;
                    },
                    // errorMessage: 'please enter your email',
                    hint: 'Enter Your Email',
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    suffixIcon: IconButton(onPressed: () {
                      showDetalis3();
                    }, icon: Icon(Icons.verified_outlined)),
                  ),
                  SizedBox(height: 10.h),
                  CustomTextField(
                    validator: (value) {
                      if (value!.length < 11) {
                        return "phone number must be 11 number";
                      }
                      if (value.isEmpty) {
                        return "please enter your phone";
                      }
                      return null;
                    },
                    hint: 'Enter Your Phone Number',
                    keyboardType: TextInputType.phone,
                    controller: phoneController,
                  ),
                  SizedBox(height: 10.h),
                  CustomTextField(
                      validator: (value) {
                        if (value!.length < 8) {
                          return "password can not less 8 characters";
                        }
                        RegExp regex = RegExp(
                            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                        var passNonNullValue = value ;
                        if (passNonNullValue.isEmpty) {
                          return ("Password is required");
                        }
                        else if (passNonNullValue.length < 8) {
                          return ("Password Must be more than 7 characters");
                        }
                        else if (!regex.hasMatch(passNonNullValue)) {
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
                  SizedBox(height: 10.h),
                  CustomTextField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "confirm password is required";
                      }
                      else if (value != passwordController.text) {
                        return "confirm password not matching";
                      }
                      return null;
                    },
                    errorMessage: 'please enter your password',
                    controller: confirmPasswordController,
                    hint: 'confirm password',
                    obscureText: passwordVisible,
                    suffixIcon: IconButton(
                      onPressed: () {
                        visiblePassword();
                      },
                      icon: Icon(
                        visibleIcon,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h,),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 25.w, vertical: 10.h),
                    child: state is RegisterLoadingState
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : CustomButton(
                            text: 'Sign Up',
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                formKey.currentState!.save();
                                RegisterCubit.get(context).UserRegister(
                                    email: emailController.text,
                                    pass: passwordController.text,
                                    phoneNumber: phoneController.text,
                                    username: userNameController.text);
                              } else {
                                autoValidateMode = AutovalidateMode.always;
                                setState(() {});
                              }
                            },
                          ),
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

  void showDetalis3() {
    showDialog(
      context: context,
      builder: (context) {
        return EmailConfirmationScreen();
      },
    );
  }


}
