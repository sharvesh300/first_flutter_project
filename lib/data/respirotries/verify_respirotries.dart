import 'package:dartz/dartz.dart';
import 'package:ui_project/data/datasources/verify_otp_dataSource.dart';
import 'package:ui_project/data/models/user_model.dart';
import 'package:ui_project/domain/enities/apperror.dart';
import 'package:ui_project/domain/enities/verify_otp_enity.dart';
import 'package:ui_project/domain/respirotries/verifyOtp_respirotries.dart';

class VerifyRespirotries extends VerifyOtpRespirotries{
  VerifyOtpDataSource dataSource;
  VerifyRespirotries(this.dataSource);

  Future<Either<AppError, UserModel>> verify(VerifyEntity verifyParams) async {
    try {
      return Right(await dataSource.signin(verifyParams));
    } catch (e) {
      return Left(AppError(errorMsg: e.toString()));
    }
  }
}
