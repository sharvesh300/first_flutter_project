import 'package:dartz/dartz.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ui_project/domain/enities/apperror.dart';
import 'package:ui_project/domain/respirotries/signin_respirotries.dart';

class GoogleSigninUsecase {
  SigninRespirotries respirotries;

  GoogleSigninUsecase(this.respirotries);

  Future<Either<AppError, GoogleSignInAccount?>> call() async {
    return await respirotries.googleSignin();
  }
}
