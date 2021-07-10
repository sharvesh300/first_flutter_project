part of 'homepageposts_cubit.dart';

abstract class HomepagepostsState extends Equatable {
  const HomepagepostsState();

  @override
  List<Object> get props => [];
}

class HomepagepostsInitial extends HomepagepostsState {}

class HomePagePostsLoded extends HomepagepostsState {
  List<AllPostEntity> posts;

  HomePagePostsLoded(this.posts);
}

class HomePagePostsLoding extends HomepagepostsState {
  
}

class HomePagePostsError extends HomepagepostsState {
  final String errorMsg;

  HomePagePostsError(this.errorMsg);
}
