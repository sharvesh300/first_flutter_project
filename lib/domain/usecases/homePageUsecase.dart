import 'package:dartz/dartz.dart';
import 'package:ui_project/domain/enities/allPostEntity.dart';
import 'package:ui_project/domain/enities/apperror.dart';
import 'package:ui_project/domain/respirotries/homePageRepositry.dart';

class HomePageUsecase {
  HomePageRepository repository;

  HomePageUsecase(this.repository);

  Future<Either<AppError,List<AllPostEntity>>?> call() async {
    return await repository.allPosts();
  }
}
