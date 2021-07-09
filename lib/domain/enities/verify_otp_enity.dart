import 'package:equatable/equatable.dart';

class VerifyEntity extends Equatable{
  String otp;
  String token;

  VerifyEntity({required this.otp, required this.token});

  @override
  // TODO: implement props
  List<Object?> get props => [otp,token];
}
