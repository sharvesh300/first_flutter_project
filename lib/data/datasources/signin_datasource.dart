import 'dart:convert';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart';
import 'package:ui_project/data/core/url_constance.dart';
import 'package:ui_project/data/models/response_model.dart';
import 'package:ui_project/domain/enities/signin_params.dart';

abstract class SigninDatasource {
  Future<ResponseModel> signin(SigninParams params);
  Future<GoogleSignInAccount?> googleSignin();
}

class SigninDataSourceImpl extends SigninDatasource {
  Client _client;
  GoogleSignIn googleSignIn;
  SigninDataSourceImpl(this._client, this.googleSignIn);

  Future<ResponseModel> signin(SigninParams params) async {
    final response = await _client.post(Uri.parse(
        '${URL_CONSTANT.API_SIGNIN}?email=${params.email}&password=${params.password}&phone=${params.phone}&username=${params.username}'));
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      final userDetails = ResponseModel.fromJson(data);
      return userDetails;
    } else {
      var err = json.decode(response.body);
      final error = ResponseModel.fromJson(err).message;
      throw error;
    }
  }

  Future<GoogleSignInAccount?> googleSignin() async {
    final user = await googleSignIn.signIn();
    if (user != null) {
      return user;
    } else {
      throw 'Something went wrong';
    }
  }
}
