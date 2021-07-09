import 'package:ui_project/domain/enities/response_entity.dart';

class ResponseModel extends ResponseEnity{
  final String message;

  ResponseModel({required this.message}):super(message: message);

 factory ResponseModel.fromJson(Map<String, dynamic> json) {
    return ResponseModel(
      message : json['message']
      );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    return data;
  }
}