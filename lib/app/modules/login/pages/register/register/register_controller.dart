import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:qurkup/app/modules/login/models/register.dart';
import 'package:qurkup/app/shared/auth/auth_controller.dart';
import 'package:qurkup/app/shared/auth/models/auth_reponse.dart';

part 'register_controller.g.dart';

class RegisterController = _RegisterControllerBase with _$RegisterController;

abstract class _RegisterControllerBase with Store {
  final AuthController _authController = Modular.get();

  @observable
  var register = Register();

  @observable
  AuthResponse authResponse = AuthResponse();

  @computed
  bool get isFormValid =>
      register.fullName.isNotEmpty &&
      register.email.isNotEmpty &&
      register.password.isNotEmpty;

  @action
  setFullName(String fullName) {
    register.fullName = fullName;
  }

  @action
  setEmail(String email) {
    register.email = email;
  }

  @action
  setPassword(String password) {
    register.password = password;
  }

  @action
  createUserWithEmailAndPassword() async {
    authResponse = await _authController.createUserWithEmailAndPassword(
        register.fullName, register.email, register.password);

    if (authResponse.errorCode == null) {
      Modular.to.pushReplacementNamed('/home/');
    }
  }

  @action
  sendPasswordResetEmail() async {
    authResponse = await _authController.sendPasswordResetEmail(register.email);
  }
}
