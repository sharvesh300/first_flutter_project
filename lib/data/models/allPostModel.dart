import 'package:ui_project/domain/enities/allPostEntity.dart';

class AllPostsMode {
  List<AllPostsModel>? result;

  AllPostsMode({required this.result});

  AllPostsMode.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <AllPostsModel>[];
      json['result'].forEach((v) {
        result!.add(AllPostsModel.fromJson(v));
      });
    }
  }
}

class AllPostsModel extends AllPostEntity {
  final String sId;
  final String title;
  final String description;
  final String image;
  final String username;

  AllPostsModel(
      {required this.sId,
      required this.title,
      required this.description,
      required this.image,
      required this.username})
      : super(
            sId: sId,
            title: title,
            description: description,
            username: username,
            image: image);

  factory AllPostsModel.fromJson(Map<String, dynamic> json) {
    return AllPostsModel(
        sId: json['_id'],
        title: json['title'],
        description: json['description'],
        image: json['image'],
        username: json['username']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['description'] = this.description;
    data['image'] = this.image;
    data['username'] = this.username;
    return data;
  }
}
