import 'package:equatable/equatable.dart';

class ResponseEnity extends Equatable {
  String message;

  ResponseEnity({required this.message});

  @override
  List<Object?> get props => [message];

  @override
  bool get stringify => true;
}
