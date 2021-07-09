import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  String username;
  String email;
  String phone;

  UserEntity(
      {required this.username, required this.email, required this.phone});

  @override
  List<Object?> get props => [username,email,phone];
@override
  bool get stringify => true;
  
}
