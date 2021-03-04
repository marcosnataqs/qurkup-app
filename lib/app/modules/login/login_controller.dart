import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:qurkup/app/shared/auth/auth_controller.dart';
import 'package:qurkup/app/shared/auth/models/auth_reponse.dart';

import 'models/login.dart';

part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final AuthController _authController = Modular.get();

  @observable
  var login = Login();

  @observable
  AuthResponse authResponse = AuthResponse();

  @computed
  bool get formIsValid => login.email.isNotEmpty && login.password.isNotEmpty;

  @action
  signInWithEmailAndPassword() async {
    authResponse = await _authController.signInWithEmailAndPassword(
        login.email, login.password);

    if (authResponse.errorCode == null) {
      Modular.to.pushReplacementNamed('/home/');
    }
  }

  @action
  signInWithGoogle() async {
    authResponse = await _authController.signInWithGoogle();

    if (authResponse.errorCode == null) {
      Modular.to.pushReplacementNamed('/home/');
    }
  }

  @action
  signInWithFacebook() async {
    authResponse = await _authController.signInWithFacebook();

    if (authResponse.errorCode == null) {
      Modular.to.pushReplacementNamed('/home/');
    }
  }
}
