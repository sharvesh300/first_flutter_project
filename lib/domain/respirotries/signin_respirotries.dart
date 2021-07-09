import 'package:dartz/dartz.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ui_project/domain/enities/apperror.dart';
import 'package:ui_project/domain/enities/response_entity.dart';
import 'package:ui_project/domain/enities/signin_params.dart';

abstract class SigninRespirotries {
  Future<Either<AppError, ResponseEnity>> singin(SigninParams params);
  Future<Either<AppError, GoogleSignInAccount?>> googleSignin();
}
