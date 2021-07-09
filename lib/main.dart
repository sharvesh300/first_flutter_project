import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pedantic/pedantic.dart';
import 'package:ui_project/presentation/cubit/logincubit/cubit/login_cubit.dart';
import 'data/di/get_it.dart' as getIt;
import 'presentation/screens/sign in and login/signinpage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  unawaited(getIt.init());
  unawaited(
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final LoginCubit cubit = getIt.getInstance<LoginCubit>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => cubit,
        child: SigninPage(),
      ),
    );
  }
}
