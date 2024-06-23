

import '../../model/UserModel.dart';
import '../../model/UserModel1.dart';

abstract class RegisterState {}

class RegisterInitialState extends RegisterState {}

class RegisterSuccessState extends RegisterState {
  UserModel1 userModel1;

  RegisterSuccessState(this.userModel1);
}
class RegisterLoadingState extends RegisterState {}

class RegisterErrorState extends RegisterState {
  final String errorMessage;

  RegisterErrorState(this.errorMessage);
}
