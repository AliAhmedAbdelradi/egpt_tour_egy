import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/authentication_helper.dart';
import '../../model/UserModel.dart';
import '../../model/UserModel1.dart';
import '../../screens/home.dart';
import 'login__state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  UserModel1 userModel1 = UserModel1();

  void UserLogin(String userName, String password) {
    emit(LoginLoadingState());
    DioHelper.postData(url: '/api/Adminstration/Login', data: {
      'password': password,
      'userName': userName,
    }).then((value) async {
      userModel1 = UserModel1.fromJson(value.data);

      /// save token here

     await saveToken(userModel1.token ?? "");
      Navigator(
        initialRoute: HomeScreen.routeName,
      );
      emit(LoginSuccessState(userModel1));
    }).catchError((error) {
      emit(LoginErrorState(error.toString()));
      print(error.toString());
    });
  }

  Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("token", token);
  }

  // Future<String?> getToken() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   return prefs.getString(token);
  // }
}
