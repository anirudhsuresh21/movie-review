import 'package:flutter_modular/flutter_modular.dart';
import 'package:movie_review/signup/signup_module.dart';

class HomeModule extends Module {
  static String get moduleRoute => '/project';
  @override
  void binds(i) {
    // TODO: implement binds
  }

  @override
  void routes(r) {
    r.module(
      SignUpModule.moduleRoute,
      module: SignUpModule(),
      transition: TransitionType.fadeIn,
    );
  }
}
