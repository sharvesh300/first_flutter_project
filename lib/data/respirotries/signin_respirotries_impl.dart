import 'package:dartz/dartz.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ui_project/data/datasources/signin_datasource.dart';
import 'package:ui_project/data/models/response_model.dart';
import 'package:ui_project/data/models/user_model.dart';
import 'package:ui_project/domain/enities/apperror.dart';
import 'package:ui_project/domain/enities/signin_params.dart';
import 'package:ui_project/domain/respirotries/signin_respirotries.dart';

class SigninRespirotriesImpl extends SigninRespirotries {
  SigninDatasource dataSource;
  SigninRespirotriesImpl(this.dataSource);

  Future<Either<AppError, ResponseModel>> singin(SigninParams params) async {
    try {
      final signin = await dataSource.signin(params);
      return Right(signin);
    } catch (e) {
      return Left(AppError(errorMsg: e.toString()));
    }
  }

  Future<Either<AppError, GoogleSignInAccount?>> googleSignin() async {
    try {
      final googleSignin = await dataSource.googleSignin();
      return Right(googleSignin);
    } catch (e) {
      return Left(AppError(errorMsg: e.toString()));
    }
  }
}
