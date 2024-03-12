

import '../../model/UserModel.dart';

abstract class RegisterState {}

class RegisterInitialState extends RegisterState {}

class RegisterSuccessState extends RegisterState {
  UserModel userModel;

  RegisterSuccessState(this.userModel);
}

class RegisterLoadingState extends RegisterState {}

class RegisterErrorState extends RegisterState {
  final String errorMessage;

  RegisterErrorState(this.errorMessage);
}
