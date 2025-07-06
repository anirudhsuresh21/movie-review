import 'package:flutter/material.dart';
import 'package:movie_review/signup/screens/login_screen.dart';
import 'package:movie_review/signup/screens/signup_screen.dart';
import 'package:movie_review/signup/signup_module.dart';
import 'package:movie_review/signup/screens/splash_screen.dart';

class SignupWidget extends StatefulWidget {
  const SignupWidget({super.key});
  static String get linkRoute => "/";
  static String get toRoute => SignUpModule.moduleRoute;

  @override
  State<SignupWidget> createState() => _SignupWidgetState();
}

class _SignupWidgetState extends State<SignupWidget> {
  @override
  Widget build(BuildContext context) {
    return const SignupScreen();
  }
}
