import 'dart:convert';

import 'package:http/http.dart';
import 'package:ui_project/data/core/url_constance.dart';
import 'package:ui_project/data/models/response_model.dart';
import 'package:ui_project/data/models/user_model.dart';
import 'package:ui_project/domain/enities/login_params.dart';

abstract class LoginDataSource {
  Future<UserModel> login(LoginParams params);
}

class LoginDataSourceImpl extends LoginDataSource {
  Client _client;
  LoginDataSourceImpl(this._client);

  @override

  Future<UserModel> login(LoginParams params) async {
    final response = await _client.post(Uri.parse(
        "${URL_CONSTANT.API_LOGIN}?email=${params.email}&password=${params.password}"));
    if (response.statusCode == 200) {
      dynamic jsonData = json.decode(response.body);
      final data = UserModel.fromJson(jsonData);
      return data;
    } else {
      dynamic data = json.decode(response.body);
      final data2 = ResponseModel.fromJson(data);
      throw data2.message;
    }
  }
}
