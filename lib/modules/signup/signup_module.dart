import 'package:flutter_modular/flutter_modular.dart';
import 'package:movie_review/modules/signup/signup_widget.dart';

class SignUpModule extends Module {
  static String get moduleRoute => "/";

  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child(SignupWidget.linkRoute, child: (context) => const SignupWidget());
  }
}
