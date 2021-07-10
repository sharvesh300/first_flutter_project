import 'package:dartz/dartz.dart';
import 'package:ui_project/data/datasources/homepagePost.dart';
import 'package:ui_project/data/models/allPostModel.dart';
import 'package:ui_project/domain/enities/apperror.dart';
import 'package:ui_project/domain/respirotries/homePageRepositry.dart';

class HomePagePostRepositryImpl extends HomePageRepository{
  HomePagePost dataSource;

  HomePagePostRepositryImpl(this.dataSource);

  @override
  Future<Either<AppError, List<AllPostsModel>>> allPosts() async {
    try {
      final data = await dataSource.getAllPost();
      return Right(data!);
    } catch (e) {
      return Left(AppError(errorMsg: e.toString()));
    }
  }
}
