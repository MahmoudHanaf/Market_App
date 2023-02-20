// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:market_1_app/core/constants.dart';

class AuthTextFormField extends StatelessWidget {
  final TextEditingController controller;
  bool obscureText;
  final Function validator;
  final Widget suffixIcon;
  final Widget prefixIcon;
  final String hintText;
  AuthTextFormField(
      {required this.controller,
      required this.obscureText,
      required this.validator,
      required this.prefixIcon,
      required this.suffixIcon,
      required this.hintText,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      cursorColor: Colors.black,
      keyboardType: TextInputType.text,
      validator: (value) => validator(value),
      decoration: InputDecoration(
        // fillColor: Colors.grey.shade300,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        hintText: hintText,
        // ignore: prefer_const_constructors
        hintStyle: TextStyle(
            color: Colors.black54, fontSize: 16, fontWeight: FontWeight.bold),
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: MainColor),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: MainColor),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: MainColor),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
