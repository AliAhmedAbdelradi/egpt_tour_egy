
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../sing_in.dart';


class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
      padding: EdgeInsets.all(30.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 8.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: const CircleAvatar(
                    backgroundImage: AssetImage("assets/images/Circle.png"),
                    maxRadius: 50,
                    backgroundColor: Colors.transparent,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 8.h,
            ),



            Text(
              "user name",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87),
            ),
            SizedBox(
              height: 10.h,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Change profile picture",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      color: Color(0xff2e75b0)),
                )
              ],
            ),
            SizedBox(
              height: 50.h,
            ),
            Container(
              width: 330,
              height: 48,
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(25)),
                    fillColor: const Color(0x8086BFF6),
                    suffixIcon: Icon(Icons.done, size: 18),
                    filled: true,
                    hintText: "First name",
                    hintStyle: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(25)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: const BorderSide(color: Colors.black26))),
              ),
            ),
            SizedBox(
              height: 25.h,
            ),
            Container(
              width: 330,
              height: 48,
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(25)),
                    fillColor: const Color(0x8086BFF6),
                    suffixIcon: Icon(Icons.done, size: 18),
                    filled: true,
                    hintText: "last name",
                    hintStyle: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(25)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: const BorderSide(color: Colors.black26))),
              ),
            ),
            SizedBox(
              height: 25.h,
            ),
            Container(
              width: 330,
              height: 48,
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(25)),
                    fillColor: const Color(0x8086BFF6),
                    suffixIcon: Icon(Icons.done, size: 18),
                    filled: true,
                    hintText: "Country",
                    hintStyle: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(25)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: const BorderSide(color: Colors.black26))),
              ),
            ),
            SizedBox(
              height: 25.h,
            ),
            Container(
              width: 330,
              height: 48,
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(25)),
                    fillColor: const Color(0x8086BFF6),
                    suffixIcon: Icon(Icons.done, size: 18),
                    filled: true,
                    hintText: "phone number",
                    hintStyle: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(25)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: const BorderSide(color: Colors.black26))),
              ),
            ),
            SizedBox(
              height: 25.h,
            ),
            Container(
              width: 330,
              height: 48,
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(25)),
                    fillColor: const Color(0xFF8086BFF6),
                    suffixIcon: Icon(Icons.done, size: 20),
                    filled: true,
                    hintText: "E-mail",
                    hintStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(25)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: const BorderSide(color: Colors.black26))),
              ),
            ),
            SizedBox(height: 20,),
            Column(children: [
              IconButton(
                  onPressed: ()  {

                    Navigator.pushReplacementNamed(context, SingIn.routeName);
                  },
                  icon: const Icon(Icons.logout)),
              Text("Logout",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 20),)


            ],)
          ],
        ),
      ),
    ));
  }
}
