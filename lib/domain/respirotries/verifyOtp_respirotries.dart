import 'package:dartz/dartz.dart';
import 'package:ui_project/domain/enities/apperror.dart';
import 'package:ui_project/domain/enities/user_enitity.dart';
import 'package:ui_project/domain/enities/verify_otp_enity.dart';

abstract class VerifyOtpRespirotries {
  Future<Either<AppError, UserEntity>> verify(VerifyEntity verifyParams);
}
