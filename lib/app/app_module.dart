import 'package:qurkup/app/shared/auth/auth_controller.dart';
import 'package:qurkup/app/shared/auth/repositories/auth_repository.dart';
import 'package:qurkup/app/modules/login/login_module.dart';
import 'package:qurkup/app/pages/splash/splash_controller.dart';
import 'package:qurkup/app/app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:qurkup/app/app_widget.dart';
import 'package:qurkup/app/modules/home/home_module.dart';
import 'package:qurkup/app/pages/splash/splash_page.dart';
import 'package:qurkup/app/shared/auth/repositories/auth_repository_interface.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
        Bind((i) => SplashController()),
        Bind<IAuthRepository>((i) => AuthRepository()),
        Bind((i) => AuthController()),
      ];

  @override
  List<Router> get routers => [
        Router(
          Modular.initialRoute,
          child: (_, args) => SplashPage(),
          transition: TransitionType.noTransition,
        ),
        Router(
          '/login',
          module: LoginModule(),
          transition: TransitionType.noTransition,
        ),
        Router(
          '/home',
          module: HomeModule(),
          transition: TransitionType.noTransition,
        ),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
