import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/authentication_helper.dart';

import '../../model/UserModel1.dart';
import '../../screens/home.dart';
import 'login__state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  UserModel1 userModel1 = UserModel1();

  void userLogin(BuildContext context, String userName, String password) {
    emit(LoginLoadingState());
    DioHelper.postData(url: '/api/Adminstration/Login', data: {
      'password': password,
      'userName': userName,
    }).then((value) async {
      userModel1 = UserModel1.fromJson(value.data);

      // Save token and expiration time here
      final token = userModel1.token ?? "";
      final expirationTime = DateTime.now().add(Duration(hours: 3)).toIso8601String();
      await saveToken(token, expirationTime);

      Navigator.pushNamed(context, HomeScreen.routeName);
      emit(LoginSuccessState(userModel1));
    }).catchError((error) {
      emit(LoginErrorState(error.toString()));
      print(error.toString());
    });
  }

  Future<void> saveToken(String token, String expirationTime) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("token", token);
    await prefs.setString("expirationTime", expirationTime);
  }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");
    final expirationTimeString = prefs.getString("expirationTime");

    if (token != null && expirationTimeString != null) {
      final expirationTime = DateTime.parse(expirationTimeString);
      if (DateTime.now().isBefore(expirationTime)) {
        return token;
      } else {
        // Token has expired, refresh it
        await refreshToken();
        return prefs.getString("token");
      }
    }
    return null;
  }

  Future<void> refreshToken() async {
    // Implement token refresh logic here
    // For example, making a request to refresh the token
    // After refreshing, save the new token and expiration time
    DioHelper.postData(url: '/api/Adminstration/RefreshToken', data: {
      'oldToken': await getToken(),
    }).then((value) async {
      final newToken = value.data['token'];
      final newExpirationTime = DateTime.now().add(Duration(hours: 16)).toIso8601String();
      await saveToken(newToken, newExpirationTime);
    }).catchError((error) {
      print('Failed to refresh token: $error');
    });
  }
}
