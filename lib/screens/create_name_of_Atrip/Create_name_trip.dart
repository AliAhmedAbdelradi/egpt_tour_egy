import 'package:ept_mate/screens/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/custom_text_feild.dart';
import '../customize_screen/Select_Category/Select_Category_Screen.dart';
import '../select_city/btn1.dart';

class CreateNameOfTrip extends StatefulWidget {


  static const String routeName = "CreateNameOfTrip";

  @override
  State<CreateNameOfTrip> createState() => _CreateNameOfTripState();
}

class _CreateNameOfTripState extends State<CreateNameOfTrip> {
  TextEditingController emailController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey();

  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, HomeScreen.routeName);
            },
            icon: Icon(
              Icons.cancel_outlined,
              color: Colors.black,
              size: 30.w,
            )),
        actions: [
          ImageIcon(
            AssetImage("assets/images/logo.png"),
            color: Colors.black,
            size: 50.w,
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Enter a name for your trip",
                style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 35.sp,
                    fontWeight: FontWeight.bold)),
            SizedBox(
              height: 15.h,
            ),
            Text("Step 1",
              style: GoogleFonts.poppins(
                color: Colors.black38,
                fontSize: 15.sp,
                fontWeight: FontWeight.w600,
              ),),
            SizedBox(
              height: 60.h,
            ),
            Form(
              key: formKey,
              autovalidateMode: autoValidateMode,
              child: CustomTextField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {

                      return "please enter your name trip ";
                    }
                    return null;
                  },
                  controller: emailController,
                  hint: 'Enter Your Name Trip',
                  keyboardType: TextInputType.emailAddress),
            ),
            Spacer(),
            Row(
              children: [

                Btn1( Color(0xFF89C9FF),
                    Colors.white,
                    "Back",(){

                      Navigator.pop(context);
                    }

                ),
                Spacer(),
                Btn1(Colors.white,
                  Color(0xFF89C9FF),
                  "Continue",(){

                         if (formKey.currentState!.validate()) {
                           formKey.currentState!.save();
                         Navigator.pushNamed(context, SelectCategory.routeName);
                         }
                         else {
                           autoValidateMode = AutovalidateMode.always;
                           setState(() {});
                         }
                         }),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
