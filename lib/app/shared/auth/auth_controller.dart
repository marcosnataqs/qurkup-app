import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:qurkup/app/shared/auth/models/auth_reponse.dart';
import 'package:qurkup/app/shared/auth/repositories/auth_repository_interface.dart';

part 'auth_controller.g.dart';

class AuthController = _AuthControllerBase with _$AuthController;

abstract class _AuthControllerBase with Store {
  final IAuthRepository _authRepository = Modular.get();

  @action
  Future<AuthResponse> signInWithGoogle() {
    return _authRepository.signInWithGoogle();
  }

  @action
  Future<AuthResponse> signInWithFacebook() {
    return _authRepository.signInWithFacebook();
  }

  @action
  Future<AuthResponse> signInWithEmailAndPassword(
      String email, String password) {
    return _authRepository.signInWithEmailAndPassword(email, password);
  }

  @action
  Future<AuthResponse> createUserWithEmailAndPassword(
      String fullName, String email, String password) {
    return _authRepository.createUserWithEmailAndPassword(
        fullName, email, password);
  }

  @action
  Future<AuthResponse> sendPasswordResetEmail(String emailAddress) {
    return _authRepository.sendPasswordResetEmail(emailAddress);
  }

  @action
  Future getUser() {
    return _authRepository.getUser();
  }

  @action
  Future signOut() {
    return _authRepository.signOut();
  }
}
