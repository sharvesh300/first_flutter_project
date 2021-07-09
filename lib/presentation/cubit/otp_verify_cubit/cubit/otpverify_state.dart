part of 'otpverify_cubit.dart';

abstract class OtpverifyState extends Equatable {
  const OtpverifyState();

  @override
  List<Object> get props => [];
}

class OtpverifyInitial extends OtpverifyState {}

class OtpVerified extends OtpverifyState {}

class OtpverifyError extends OtpverifyState {
  final String errorMsg;
  OtpverifyError({required this.errorMsg});
}

class OtpLoading extends OtpverifyState {}
