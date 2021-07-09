import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ui_project/domain/enities/signin_params.dart';
import 'package:ui_project/domain/usecases/googleSigninUsecase.dart';
import 'package:ui_project/domain/usecases/signin_case.dart';
part 'signincubit_state.dart';

class SignincubitCubit extends Cubit<SignincubitState> {
  final SigninUseCase useCase;
  final GoogleSigninUsecase googleUseCase;

  SignincubitCubit({required this.useCase, required this.googleUseCase})
      : super(SignincubitInitial());

  Future<void> signin(SigninParams params) async {
    if (params.username == null || params.username == '') {
      emit(UsernameError(errorMsg: 'username field is empty'));
    } else if (params.username.length < 3) {
      emit(UsernameError(errorMsg: "Enter atlease 3 words"));
    } else if (params.email == '') {
      emit(EmailError(errorMsg: 'email field is empty'));
    } else if (params.phone == null || params.phone == '') {
      emit(PhoneError(errorMsg: 'phone field is empty'));
    } else if (params.phone.length != 10) {
      emit(PhoneError(errorMsg: "Invalid phone number"));
    } else if (params.password == null || params.password == '') {
      emit(PasswordError(errorMsg: 'password field is empty'));
    } else if (params.confirmPassword == null || params.confirmPassword == '') {
      emit(ConfirmPasswordError(errorMsg: 'password field is empty'));
    } else if (params.confirmPassword != params.password) {
      emit(ConfirmPasswordError(errorMsg: 'password do not match'));
    } else {
      emit(SinginCubitLoading());
      final sign = await useCase(params);
      sign.fold((l) => emit(SigninCubitCommonError(errorMsg: l.errorMsg)),
          (r) => emit(SigninCubitLoaded(code: r.message)));
    }
  }


}
