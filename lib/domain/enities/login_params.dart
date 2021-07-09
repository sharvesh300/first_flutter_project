import 'package:equatable/equatable.dart';

class LoginParams extends Equatable {
  String email;
  String password;

  LoginParams({required this.email, required this.password});

  @override
  // TODO: implement props
  List<Object?> get props => [email, password];
}
