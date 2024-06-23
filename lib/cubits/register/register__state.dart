

import 'package:ept_mate/model/UserModel2.dart';



abstract class RegisterState {}

class RegisterInitialState extends RegisterState {}

class RegisterSuccessState extends RegisterState {
  UserModel2 userModel2;

  RegisterSuccessState(this.userModel2);
}
class RegisterLoadingState extends RegisterState {}

class RegisterErrorState extends RegisterState {
  final String errorMessage;

  RegisterErrorState(this.errorMessage);
}
