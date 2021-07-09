import 'package:dartz/dartz.dart';
import 'package:ui_project/domain/enities/apperror.dart';
import 'package:ui_project/domain/enities/login_params.dart';
import 'package:ui_project/domain/enities/user_enitity.dart';

abstract class LoginRespirotry {
  Future<Either<AppError, UserEntity>> login(LoginParams params);
}
