import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart';
import 'package:ui_project/data/datasources/login_datasource.dart';
import 'package:ui_project/data/datasources/signin_datasource.dart';
import 'package:ui_project/data/datasources/verify_otp_dataSource.dart';
import 'package:ui_project/data/respirotries/login_respirotries_impl.dart';
import 'package:ui_project/data/respirotries/signin_respirotries_impl.dart';
import 'package:ui_project/data/respirotries/verify_respirotries.dart';
import 'package:ui_project/domain/respirotries/login_respirotries.dart';
import 'package:ui_project/domain/respirotries/signin_respirotries.dart';
import 'package:ui_project/domain/respirotries/verifyOtp_respirotries.dart';
import 'package:ui_project/domain/usecases/googleSigninUsecase.dart';
import 'package:ui_project/domain/usecases/login_usecases.dart';
import 'package:ui_project/domain/usecases/signin_case.dart';
import 'package:ui_project/domain/usecases/verifyOtp_usecase.dart';
import 'package:ui_project/presentation/cubit/logincubit/cubit/login_cubit.dart';
import 'package:ui_project/presentation/cubit/otp_verify_cubit/cubit/otpverify_cubit.dart';
import 'package:ui_project/presentation/cubit/signincubit/signincubit_cubit.dart';

final getInstance = GetIt.I;

Future init() async {
  //signin instance
  getInstance.registerLazySingleton<Client>(() => Client());
  getInstance.registerLazySingleton<GoogleSignIn>(() => GoogleSignIn());
  getInstance.registerLazySingleton<SigninDatasource>(
      () => SigninDataSourceImpl(getInstance(),getInstance()));
  getInstance.registerLazySingleton<SigninRespirotries>(
      () => SigninRespirotriesImpl(getInstance()));
  getInstance
      .registerLazySingleton<SigninUseCase>(() => SigninUseCase(getInstance()));
  getInstance.registerLazySingleton<GoogleSigninUsecase>(
    () => GoogleSigninUsecase(getInstance()));
  getInstance.registerLazySingleton<SignincubitCubit>(
      () => SignincubitCubit(useCase:getInstance(),googleUseCase: getInstance()));
  //signin instance
  //verify instance
  getInstance.registerLazySingleton<VerifyOtpDataSource>(
      () => VerifyOtpDataSourceImpl(getInstance()));
  getInstance.registerLazySingleton<VerifyOtpRespirotries>(
      () => VerifyRespirotries(getInstance()));
  getInstance.registerLazySingleton<VerifyOtpUseCase>(
      () => VerifyOtpUseCase(getInstance()));
  getInstance.registerLazySingleton<OtpverifyCubit>(
      () => OtpverifyCubit(getInstance()));
  //verify instance
  //login instance
  getInstance.registerLazySingleton<LoginDataSource>(
      () => LoginDataSourceImpl(getInstance()));
  getInstance.registerLazySingleton<LoginRespirotry>(
      () => LoginRespirotryImpl(getInstance()));
  getInstance
      .registerLazySingleton<LoginUseCase>(() => LoginUseCase(getInstance()));
  getInstance
      .registerLazySingleton<LoginCubit>(() => LoginCubit(useCase:getInstance(),googleUseCase: getInstance()));
}
