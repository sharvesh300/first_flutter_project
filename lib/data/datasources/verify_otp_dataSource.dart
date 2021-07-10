import 'dart:convert';

import 'package:http/http.dart';
import 'package:ui_project/data/core/url_constance.dart';
import 'package:ui_project/data/models/response_model.dart';
import 'package:ui_project/data/models/user_model.dart';
import 'package:ui_project/domain/enities/verify_otp_enity.dart';

abstract class VerifyOtpDataSource {
  Future<UserModel> signin(VerifyEntity veriyParams);
}

class VerifyOtpDataSourceImpl extends VerifyOtpDataSource {
  Client _client;
  VerifyOtpDataSourceImpl(this._client);

    @override

  Future<UserModel> signin(VerifyEntity veriyParams) async {
    final response = await _client.post(Uri.parse(
        '${URL_CONSTANT.API_VERIFY}?code=${veriyParams.otp}&token=${veriyParams.token}'));
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      final userDetails = UserModel.fromJson(data);
      return userDetails;
    } else {
      var err = json.decode(response.body);
      final error = ResponseModel.fromJson(err).message;
      print(error);
      throw error;
    }
  }
}
