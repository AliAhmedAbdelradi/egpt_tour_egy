

import '../../model/UserModel.dart';
import '../../model/UserModel1.dart';

abstract class LoginState {}

class LoginInitialState extends LoginState {}

class LoginSuccessState extends LoginState {
  UserModel1 userModel1;

  LoginSuccessState(this.userModel1);
}

class LoginLoadingState extends LoginState {}

class LoginErrorState extends LoginState {
  final String errorMessage;

  LoginErrorState(this.errorMessage);
}
