import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    this.hintText,
    this.keyboardType,
    this.icon,
    this.obSecure = false,
    this.controller,
    this.errorText,
    Key? key,
  }) : super(key: key);

  final String? hintText;
  final TextInputType? keyboardType;
  final IconData? icon;
  final bool obSecure;
  final TextEditingController? controller;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 40.0, right: 40),
      child: TextField(
        controller: controller,
        obscureText: obSecure,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          errorText: errorText,
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 18.0, right: 17),
              child: Icon(icon),
            ),
            fillColor: Colors.white,
            filled: true,
            hintText: hintText,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40),
                borderSide: BorderSide(color: Colors.white)),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40),
              borderSide: BorderSide(color: Colors.lightBlue),
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40),
                borderSide: BorderSide(color: Colors.white))),
      ),
    );
  }
}
