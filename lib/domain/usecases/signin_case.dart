import 'package:dartz/dartz.dart';
import 'package:ui_project/domain/enities/apperror.dart';
import 'package:ui_project/domain/enities/response_entity.dart';
import 'package:ui_project/domain/enities/signin_params.dart';
import 'package:ui_project/domain/enities/user_enitity.dart';
import 'package:ui_project/domain/respirotries/signin_respirotries.dart';

class SigninUseCase {
  SigninRespirotries respirotries;
  SigninUseCase(this.respirotries);

  Future<Either<AppError, ResponseEnity>> call(SigninParams params) async {
    return await respirotries.singin(params);
  }
}
