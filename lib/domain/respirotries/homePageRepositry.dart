import 'package:dartz/dartz.dart';
import 'package:ui_project/domain/enities/allPostEntity.dart';
import 'package:ui_project/domain/enities/apperror.dart';

abstract class HomePageRepository {
  Future<Either<AppError, List<AllPostEntity>>> allPosts();
}
