import 'package:equatable/equatable.dart';

class AllPostEntity extends Equatable {
  String sId;
  String title;
  String description;
  String image;
  String username;
  AllPostEntity(
      {required this.sId,
      required this.title,
      required this.description,
      required this.image,
      required this.username});

  @override
  // TODO: implement props
  List<Object?> get props => [sId, title, description, image, username];
}
