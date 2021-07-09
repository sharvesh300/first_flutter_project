import 'package:dartz/dartz.dart';
import 'package:ui_project/domain/enities/apperror.dart';
import 'package:ui_project/domain/enities/user_enitity.dart';
import 'package:ui_project/domain/enities/verify_otp_enity.dart';
import 'package:ui_project/domain/respirotries/verifyOtp_respirotries.dart';

class VerifyOtpUseCase {
  VerifyOtpRespirotries respirotries;
  VerifyOtpUseCase(this.respirotries);

  Future<Either<AppError, UserEntity>> call(VerifyEntity verifyParams) async {
    return await respirotries.verify(verifyParams);
  }
}
