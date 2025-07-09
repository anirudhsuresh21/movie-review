import 'package:flutter_modular/flutter_modular.dart';
import 'modules/home/home_module.dart';
import 'modules/signup/signup_module.dart';

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
    r.module(
      HomeModule.moduleRoute,
      module: HomeModule(),
      transition: TransitionType.fadeIn,
    );
  }
}
