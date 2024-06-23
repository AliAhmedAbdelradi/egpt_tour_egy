import 'package:ept_mate/cubits/register/register__state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../data/authentication_helper.dart';
import '../../model/UserModel1.dart';
import '../../screens/confirm_email/Confirm_Email.dart';
import '../../screens/sing_in.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitialState());
  static RegisterCubit get(context) => BlocProvider.of(context);
  UserModel1 userModel1 = UserModel1();

  void UserRegister(
      {required String email,
      required String pass,
      required String phoneNumber,
      required String username}) {
    emit(RegisterLoadingState());
    DioHelper.postData(url: '/api/Adminstration/register', data: {
      "email": email,
      "password": pass,
      "phoneNumber": phoneNumber,
      "username": username,
      "roleName": "user"
    }).then((value) async {
      userModel1 = UserModel1.fromJson(value.data);
      //await saveToken(userModel1.token ?? "");

      Navigator(
        initialRoute: SingIn.routeName,
      );

      emit(RegisterSuccessState(userModel1));
    }).catchError((error) {
      emit(RegisterErrorState(error.toString()));
      print(error.toString());
    });
  }

  Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("token", token);
  }
}
