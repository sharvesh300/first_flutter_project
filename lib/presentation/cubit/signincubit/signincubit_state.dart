part of 'signincubit_cubit.dart';

enum TextErrorType { email, password, phone, username, confirmPassword }

abstract class SignincubitState extends Equatable {
  const SignincubitState();

  @override
  List<Object> get props => [];
}

class SignincubitInitial extends SignincubitState {}

class SinginCubitLoading extends SignincubitState {}

class SigninCubitCommonError extends SignincubitState {
  String errorMsg;
  SigninCubitCommonError({required this.errorMsg});
}

class SigninCubitTextErrors extends SignincubitState {
  String errorMsg;
  TextErrorType type;

  SigninCubitTextErrors({required this.type, required this.errorMsg});
}

class SigninCubitLoaded extends SignincubitState {
  String code;
  SigninCubitLoaded({required this.code});
}

class PasswordError extends SignincubitState {
  String errorMsg;
  PasswordError({required this.errorMsg});
}

class UsernameError extends SignincubitState {
  String errorMsg;

  UsernameError({required this.errorMsg});
}

class EmailError extends SignincubitState {
  String errorMsg;

  EmailError({required this.errorMsg});
}

class PhoneError extends SignincubitState {
  String errorMsg;

  PhoneError({required this.errorMsg});
}

class ConfirmPasswordError extends SignincubitState {
  String errorMsg;

  ConfirmPasswordError({required this.errorMsg});
}

class GoogleSigninSuccess extends SignincubitState{
  
}