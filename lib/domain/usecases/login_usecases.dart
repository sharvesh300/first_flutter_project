import 'package:dartz/dartz.dart';
import 'package:ui_project/domain/enities/apperror.dart';
import 'package:ui_project/domain/enities/login_params.dart';
import 'package:ui_project/domain/enities/user_enitity.dart';
import 'package:ui_project/domain/respirotries/login_respirotries.dart';

class LoginUseCase {
  LoginRespirotry respirotry;

  LoginUseCase(this.respirotry);

  Future<Either<AppError, UserEntity>> call(LoginParams params) async {
    return await respirotry.login(params);
  }
}
