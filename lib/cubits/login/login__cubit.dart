import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/authentication_helper.dart';
import '../../model/UserModel.dart';
import '../../screens/home.dart';
import 'login__state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);


  UserModel userModel = UserModel();
  void UserLogin(String userName, String password)  {


    emit(LoginLoadingState());
    DioHelper.postData(url: '/api/Adminstration/Login', data: {
      'password': password,
      'userName': userName,
    }).then((value) {
      userModel = UserModel.fromJson(value.data);
      Navigator(
        initialRoute: HomeScreen.routeName,
      );
      emit(LoginSuccessState(userModel));
    }).catchError((error) {
      emit(LoginErrorState(error.toString()));
      print(error.toString());
    });
  }
}
