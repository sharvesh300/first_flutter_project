import 'dart:convert';
import 'package:http/http.dart';
import 'package:ui_project/data/core/url_constance.dart';
import 'package:ui_project/data/models/allPostModel.dart';
import 'package:ui_project/data/models/response_model.dart';

abstract class HomePagePost {
  Future<List<AllPostsModel>?> getAllPost();
}

class HomePagePostImpl extends HomePagePost {
  Client _client;
  HomePagePostImpl(this._client);
  
  @override
  Future<List<AllPostsModel>?> getAllPost() async {
    final response = await _client.get(Uri.parse(URL_CONSTANT.API_ALL_POST));
    if (response.statusCode == 200) {
      var decoded = json.decode(response.body);
      var hi = AllPostsMode.fromJson(decoded).result;
      return hi;
    } else {
      final data = json.decode(response.body);
      throw ResponseModel.fromJson(data).message;
    }
  }
}
