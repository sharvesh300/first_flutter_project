import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ui_project/domain/enities/login_params.dart';
import 'package:ui_project/domain/usecases/googleSigninUsecase.dart';
import 'package:ui_project/domain/usecases/login_usecases.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginUseCase useCase;
  GoogleSigninUsecase googleUseCase;

  LoginCubit({required this.useCase,required this.googleUseCase}) : super(LoginInitial());

  Future<void> login(LoginParams params) async {
    if (params.email == '') {
      print('email');
      emit(LoginEmailError(errorMsg: "email field is empty"));
    } else if (params.password == '') {
      print('password');
      emit(LoginPasswordError(errorMsg: "password field is empty"));
    } else {
      emit(LoginLoading());
      final usecase = await useCase(params);

      usecase.fold((l) => emit(LoginApiError(errorMsg: l.errorMsg)),
          (r) => emit(LoginSuccess()));
    }
  }
    Future<void> googleSignin() async {
    final googleSignin = await googleUseCase();
    googleSignin.fold((l) => emit(LoginApiError(errorMsg: l.errorMsg)),
        (r) => emit(LoginSuccess()));
  }
}
