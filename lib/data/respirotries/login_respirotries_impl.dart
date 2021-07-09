import 'package:dartz/dartz.dart';
import 'package:ui_project/data/datasources/login_datasource.dart';
import 'package:ui_project/data/models/user_model.dart';
import 'package:ui_project/domain/enities/apperror.dart';
import 'package:ui_project/domain/enities/login_params.dart';
import 'package:ui_project/domain/respirotries/login_respirotries.dart';

class LoginRespirotryImpl extends LoginRespirotry{
  LoginDataSource dataSource;

  LoginRespirotryImpl(this.dataSource);

  Future<Either<AppError, UserModel>> login(LoginParams params) async {
    try {
      return Right(await dataSource.login(params));
    } catch (e) {
      return Left(AppError(errorMsg: e.toString()));
    }
  }
}
