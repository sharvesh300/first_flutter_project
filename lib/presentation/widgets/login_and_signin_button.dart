import 'package:flutter/material.dart';

class SigninAndLoginButton extends StatelessWidget {
  const SigninAndLoginButton({
    Key? key,
    required this.text,
    this.onTap,
  }) : super(key: key);
  final String text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30), color: Colors.blue[900]),
      child: Material(
        color: Colors.blue[900],
        borderRadius: BorderRadius.circular(30),
        child: InkWell(
          onTap: onTap,
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                  color: Colors.white, fontFamily: 'Ubuntu', fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }
}
