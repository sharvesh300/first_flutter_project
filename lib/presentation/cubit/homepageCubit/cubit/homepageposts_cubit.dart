import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ui_project/domain/enities/allPostEntity.dart';
import 'package:ui_project/domain/usecases/homePageUsecase.dart';

part 'homepageposts_state.dart';

class HomepagepostsCubit extends Cubit<HomepagepostsState> {
  HomePageUsecase useCase;
  HomepagepostsCubit(this.useCase) : super(HomepagepostsInitial()) {
    getPosts();
  }

  Future<void> getPosts() async {
    emit(HomePagePostsLoding());
    final data = await useCase();
    data!.fold((l) => emit(HomePagePostsError(l.errorMsg)),
        (r) => emit(HomePagePostsLoded(r)));
  }
}
