import 'package:equatable/equatable.dart';

class SigninParams extends Equatable {
  final String email;
  final String username;
  final String password;
  final String phone;
  final String confirmPassword;

  SigninParams(
      {required this.email,
      required this.password,
      required this.phone,
      required this.username,
      required this.confirmPassword
      });

  @override
  List<Object?> get props => [email, username, password, phone];
}
