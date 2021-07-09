import 'package:ui_project/domain/enities/user_enitity.dart';

class UserModel extends UserEntity{
  final String email;
  final String phone;
  final String username;

  UserModel({required this.email, required this.phone, required this.username}):super(email: email,phone: phone,username: username);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        email: json['email'], phone: json['phone'], username: json['username']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['username'] = this.username;
    return data;
  }
}
