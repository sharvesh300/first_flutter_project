import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_project/domain/enities/verify_otp_enity.dart';
import 'package:ui_project/presentation/cubit/otp_verify_cubit/cubit/otpverify_cubit.dart';
import 'package:ui_project/presentation/screens/home/homepage.dart';

import 'numeric_pad.dart';

class VerifyPhone extends StatefulWidget {
  final String phoneNumber;
  final String token;

  VerifyPhone({required this.phoneNumber, required this.token});

  @override
  _VerifyPhoneState createState() => _VerifyPhoneState();
}

class _VerifyPhoneState extends State<VerifyPhone> {
  String code = "";

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OtpverifyCubit, OtpverifyState>(
      listener: (context, state) {
        if (state is OtpverifyError) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.errorMsg),
          ));
        } else if (state is OtpVerified) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomePage()));
        } else if (state is OtpLoading) {
          
        }
        print(state);
      },
      builder: (context, state) {
        print(state);
        return Scaffold(
          appBar: AppBar(
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back,
                size: 30,
                color: Colors.black,
              ),
            ),
            title: Text(
              "Verify phone",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            backgroundColor: Colors.white,
            elevation: 0,
            centerTitle: true,
            textTheme: Theme.of(context).textTheme,
          ),
          body: SafeArea(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: Container(
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 14),
                        child: Text(
                          "Code is sent to " + widget.phoneNumber,
                          style: TextStyle(
                            fontSize: 22,
                            color: Color(0xFF818181),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            buildCodeNumberBox(
                                code.length > 0 ? code.substring(0, 1) : ""),
                            buildCodeNumberBox(
                                code.length > 1 ? code.substring(1, 2) : ""),
                            buildCodeNumberBox(
                                code.length > 2 ? code.substring(2, 3) : ""),
                            buildCodeNumberBox(
                                code.length > 3 ? code.substring(3, 4) : ""),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 14),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Didn't recieve code? ",
                              style: TextStyle(
                                fontSize: 18,
                                color: Color(0xFF818181),
                              ),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            GestureDetector(
                              onTap: () {
                                print("Resend the code to the user");
                              },
                              child: Text(
                                "Request again",
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.13,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(25),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            BlocProvider.of<OtpverifyCubit>(context).verify(
                                VerifyEntity(otp: code, token: widget.token));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xFFFFDC3D),
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "Verify and Create Account",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              NumericPad(
                onNumberSelected: (value) {
                  print(value);
                  setState(() {
                    if (value != -1) {
                      if (code.length < 4) {
                        code = code + value.toString();
                      }
                    } else {
                      code = code.substring(0, code.length - 1);
                    }
                    print(code);
                  });
                },
              ),
            ],
          )),
        );
      },
    );
  }

  Widget buildCodeNumberBox(String codeNumber) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: SizedBox(
        width: 60,
        height: 60,
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFFF6F5FA),
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.black26,
                  blurRadius: 25.0,
                  spreadRadius: 1,
                  offset: Offset(0.0, 0.75))
            ],
          ),
          child: Center(
            child: Text(
              codeNumber,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1F1F1F),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
