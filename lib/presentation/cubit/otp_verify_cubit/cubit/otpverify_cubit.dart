import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ui_project/domain/enities/verify_otp_enity.dart';
import 'package:ui_project/domain/usecases/verifyOtp_usecase.dart';

part 'otpverify_state.dart';

class OtpverifyCubit extends Cubit<OtpverifyState> {
  VerifyOtpUseCase useCase;

  OtpverifyCubit(this.useCase) : super(OtpverifyInitial());

  Future<void> verify(VerifyEntity verifyParams) async {
    emit(OtpLoading());
    final verify = await useCase(verifyParams);
    verify.fold((l) => emit(OtpverifyError(errorMsg: l.errorMsg)),
        (r) => emit(OtpVerified()));
  }

  void storeToStorage()async{

  }
}
