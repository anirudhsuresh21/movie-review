import 'package:flutter/material.dart';
import 'package:movie_review/modules/home/screens/navbar_screen.dart';

import 'home_module.dart';

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
    return const NavbarScreen();
  }
}
