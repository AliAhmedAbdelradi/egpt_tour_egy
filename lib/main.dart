import 'package:ept_mate/screens/home.dart';
import 'package:ept_mate/screens/onboarding_screen.dart';
import 'package:ept_mate/widgets/my_app.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'model/UserModel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var token = preferences.getString('token');

  // Determine if the user is logged in based on the token
  bool isLoggedIn = token != null;

  runApp(MyApp(isLoggedIn: isLoggedIn));
}

