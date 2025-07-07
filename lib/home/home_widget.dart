import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movie_review/home/home_module.dart';
import 'package:movie_review/home/screens/dashboard_screen.dart';
import 'package:movie_review/signup/screens/login_screen.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});
  static String get linkRoute => "/";
  static String get toRoute => HomeModule.moduleRoute;

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    return const DashboardScreen();
  }
}
