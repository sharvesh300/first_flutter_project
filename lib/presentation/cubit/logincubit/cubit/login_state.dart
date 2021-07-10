part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  const LoginState();
  @override
// TODO: implement props
  List<Object?> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginApiError extends LoginState {
  final String errorMsg;

  LoginApiError({required this.errorMsg});
}

class LoginEmailError extends LoginState {
  final String errorMsg;

  LoginEmailError({required this.errorMsg});
}

class LoginPasswordError extends LoginState {
  final String errorMsg;

  LoginPasswordError({required this.errorMsg});
}

class LoginSuccess extends LoginState {
  final String? username;
  final String userEmail;
  String? phone;
  final String id;

  LoginSuccess({required this.username, required this.userEmail, required this.id,this.phone});
}
