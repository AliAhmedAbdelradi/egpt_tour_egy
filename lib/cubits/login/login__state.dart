

import '../../model/UserModel.dart';
import '../../screens/shared_pref/shared_pref.dart';

abstract class LoginState {}

class LoginInitialState extends LoginState {}

class LoginSuccessState extends LoginState {
  UserModel userModel;


  LoginSuccessState(this.userModel);
}

class LoginLoadingState extends LoginState {}

class LoginErrorState extends LoginState {
  final String errorMessage;

  LoginErrorState(this.errorMessage);
}
