import 'package:flutter_modular/flutter_modular.dart';
import 'package:movie_review/signup/signup_module.dart';

class AppModule extends Module {
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
