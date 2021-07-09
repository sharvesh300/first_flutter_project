import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ui_project/data/di/get_it.dart';
import 'package:ui_project/domain/enities/signin_params.dart';
import 'package:ui_project/presentation/cubit/otp_verify_cubit/cubit/otpverify_cubit.dart';
import 'package:ui_project/presentation/cubit/signincubit/signincubit_cubit.dart';
import 'package:ui_project/presentation/themes/icon_themes.dart';
import 'package:ui_project/presentation/widgets/custom_text_field.dart';
import 'package:ui_project/presentation/widgets/login_and_signin_button.dart';
import 'package:ui_project/presentation/widgets/progressDailogue.dart';
import 'package:ui_project/data/di/get_it.dart'as getIt;
import 'package:ui_project/presentation/widgets/verifty_phone.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final OtpverifyCubit otpverifyCubit = getIt.getInstance<OtpverifyCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Padding(
            padding: EdgeInsets.only(left: 18.0, top: 10),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: FaIcon(
                IconThemes.arrowLeft,
                color: Colors.black,
              ),
            ),
          ),
        ),
        body: BlocConsumer<SignincubitCubit, SignincubitState>(
          listener: (context, state) {
            if (state is SigninCubitCommonError) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.errorMsg),
              ));
              Navigator.of(context).pop();
            } else if (state is SinginCubitLoading) {
              showDialog(
                  context: context,
                  builder: (context) {
                    return ProgressDailogue(msg: "Creating account");
                  });
            } else if (state is SigninCubitLoaded) {
              Navigator.push(context,MaterialPageRoute(builder: (context)=>BlocProvider(create: (context)=>otpverifyCubit,child: VerifyPhone(phoneNumber: phoneController.text.trim(), token: state.code),)));
            }
            print(state);
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: Container(
                  child: Center(
                child: Column(
                  children: [
                    Text(
                      "Let's Get Started!",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 25),
                    ),
                    SizedBox(height: 10),
                    Text("Create a account to got of now",
                        style: TextStyle(color: Colors.grey)),
                    SizedBox(height: 50),
                    CustomTextField(
                      errorText: state is UsernameError ? state.errorMsg : null,
                      controller: usernameController,
                      hintText: "User name",
                      icon: IconThemes.person,
                      keyboardType: TextInputType.name,
                    ),
                    SizedBox(height: 10),
                    CustomTextField(
                        errorText: state is EmailError ? state.errorMsg : null,
                        controller: emailController,
                        hintText: "Email",
                        icon: IconThemes.email,
                        keyboardType: TextInputType.emailAddress),
                    SizedBox(height: 10),
                    CustomTextField(
                      errorText: state is PhoneError ? state.errorMsg : null,
                      controller: phoneController,
                      hintText: "Phone",
                      icon: IconThemes.phone,
                      keyboardType: TextInputType.phone,
                    ),
                    SizedBox(height: 10),
                    CustomTextField(
                      errorText: state is PasswordError ? state.errorMsg : null,
                      controller: passwordController,
                      hintText: "Passowrd",
                      icon: IconThemes.lock,
                      obSecure: true,
                    ),
                    SizedBox(height: 10),
                    CustomTextField(
                      errorText:
                          state is ConfirmPasswordError ? state.errorMsg : null,
                      controller: confirmPasswordController,
                      hintText: "Confirm Password",
                      icon: IconThemes.userLock,
                      obSecure: true,
                    ),
                    SizedBox(height: 30),
                    SigninAndLoginButton(
                      text: "Create",
                      onTap: () {
                        BlocProvider.of<SignincubitCubit>(context).signin(
                            SigninParams(
                                confirmPassword:
                                    confirmPasswordController.text.trim(),
                                email: emailController.text.trim(),
                                password: passwordController.text.trim(),
                                phone: phoneController.text.trim(),
                                username: usernameController.text.trim()));
                      },
                    ),
                    SizedBox(height: 60),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Have an account?",
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'JosefinSans')),
                        TextButton(
                          child: Text(
                            "Login",
                            style: TextStyle(color: Colors.lightBlue),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        )
                      ],
                    ),
                  ],
                ),
              )),
            );
          },
        ));
  }
}
