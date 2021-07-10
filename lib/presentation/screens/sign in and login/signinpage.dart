import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_project/data/di/get_it.dart' as getIt;
import 'package:ui_project/domain/enities/login_params.dart';
import 'package:ui_project/presentation/cubit/bottomnavbar_cubit/cubit/bottomnavbarcubit_cubit.dart';
import 'package:ui_project/presentation/cubit/homepageCubit/cubit/homepageposts_cubit.dart';
import 'package:ui_project/presentation/cubit/logincubit/cubit/login_cubit.dart';
import 'package:ui_project/presentation/cubit/signincubit/signincubit_cubit.dart';
import 'package:ui_project/presentation/screens/home/homepage.dart';
import 'package:ui_project/presentation/themes/icon_themes.dart';
import 'package:ui_project/presentation/widgets/custom_text_field.dart';
import 'package:ui_project/presentation/widgets/google_and_facebook_button.dart';
import 'package:ui_project/presentation/widgets/login_and_signin_button.dart';
import 'package:ui_project/presentation/widgets/progressDailogue.dart';
import 'login_Page.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class SigninPage extends StatelessWidget {
  SigninPage({Key? key}) : super(key: key);
  final SignincubitCubit cubit = getIt.getInstance<SignincubitCubit>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final BottomnavbarcubitCubit bottomCubit =
      getIt.getInstance<BottomnavbarcubitCubit>();
  final HomepagepostsCubit homepageCubit =
      getIt.getInstance<HomepagepostsCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        body: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            print(state);
            if (state is LoginLoading) {
              showDialog(
                  context: context,
                  builder: (context) {
                    return ProgressDailogue(msg: "Logging in");
                  });
            } else if (state is LoginApiError) {
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.errorMsg)));
            } else if (state is LoginSuccess) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MultiBlocProvider(
                            providers: [
                              BlocProvider(
                                create:(context)=>homepageCubit,
                              ),
                              BlocProvider(
                                create: (context) => bottomCubit,
                              ),
                            ],
                            child: HomePage(),
                          )));
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: Container(
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 30),
                      Container(
                        width: 160,
                        height: 160,
                        color: Colors.black,
                        child: Image.asset(
                          'assets/image.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Welcome Back!",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      Text("Login to your registered account",
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'JosefinSans')),
                      SizedBox(height: 30),
                      CustomTextField(
                          controller: emailController,
                          hintText: "Email",
                          keyboardType: TextInputType.emailAddress,
                          errorText: state is LoginEmailError
                              ? 'email is required field'
                              : null,
                          icon: IconThemes.person),
                      SizedBox(height: 20),
                      CustomTextField(
                        errorText: state is LoginPasswordError
                            ? 'password is required field'
                            : null,
                        controller: passwordController,
                        hintText: "Password",
                        icon: IconThemes.lock,
                        obSecure: true,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 250, top: 10),
                        child: TextButton(
                          child: Text(
                            "Forget password",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                                fontFamily: 'JosefinSans'),
                          ),
                          onPressed: () {},
                        ),
                      ),
                      SizedBox(height: 10),
                      SigninAndLoginButton(
                        text: "Login",
                        onTap: () {
                          BlocProvider.of<LoginCubit>(context).login(
                              LoginParams(
                                  email: emailController.text.trim(),
                                  password: passwordController.text.trim()));
                        },
                      ),
                      SizedBox(height: 40),
                      Text(
                        "Or signin using",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                            fontFamily: 'JosefinSans'),
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          SizedBox(width: 20),
                          FacebookAndGoogleButton(
                              text: "Facebook",
                              color: Colors.blue[800],
                              icon: IconThemes.facebook,
                              onTap: () async {
// or FacebookAuth.i.permission
                                final LoginResult result =
                                    await FacebookAuth.instance.login();

                                if (result.status == LoginStatus.success) {
                                  final AccessToken accessToken =
                                      result.accessToken!;
                                  if (accessToken != null) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => HomePage()));
                                  }
                                }
// or
// FacebookAuth.i.login(
//   permissions: ['public_profile', 'email', 'pages_show_list', 'pages_messaging', 'pages_manage_metadata'],
// )
                              }),
                          SizedBox(width: 20),
                          FacebookAndGoogleButton(
                              onTap: () async {
                                await BlocProvider.of<LoginCubit>(context)
                                    .googleSignin();
                              },
                              text: "Google",
                              color: Colors.red,
                              icon: IconThemes.google),
                        ],
                      ),
                      SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Not have an account?",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'JosefinSans')),
                          TextButton(
                            child: Text(
                              "Sign up",
                              style: TextStyle(color: Colors.lightBlue),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => BlocProvider(
                                            create: (context) => cubit,
                                            child: LoginPage(),
                                          )));
                            },
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }
}
