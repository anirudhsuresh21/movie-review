import 'package:flutter_modular/flutter_modular.dart';
import 'package:movie_review/modules/home/home_widget.dart';
// import 'package:movie_review/signup/signup_module.dart';

class HomeModule extends Module {
  static String get moduleRoute => '/home';
  @override
  void binds(i) {
    // TODO: implement binds
  }

  @override
  void routes(r) {
    r.child(HomeWidget.linkRoute, child: (context) => const HomeWidget());
  }
}
