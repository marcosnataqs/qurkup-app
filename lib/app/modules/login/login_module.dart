import 'package:qurkup/app/modules/login/pages/register/register/register_controller.dart';
import 'package:qurkup/app/modules/login/login_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:qurkup/app/modules/login/login_page.dart';
import 'package:qurkup/app/modules/login/pages/register/register/register_page.dart';

class LoginModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => RegisterController()),
        Bind((i) => LoginController()),
      ];

  @override
  List<Router> get routers => [
        Router(
          Modular.initialRoute,
          child: (_, args) => LoginPage(),
          transition: TransitionType.noTransition,
        ),
        Router(
          '/register',
          child: (_, args) => RegisterPage(),
          transition: TransitionType.noTransition,
        ),
      ];

  static Inject get to => Inject<LoginModule>.of();
}
