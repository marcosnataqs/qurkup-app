// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginController on _LoginControllerBase, Store {
  Computed<bool> _$formIsValidComputed;

  @override
  bool get formIsValid =>
      (_$formIsValidComputed ??= Computed<bool>(() => super.formIsValid,
              name: '_LoginControllerBase.formIsValid'))
          .value;

  final _$loginAtom = Atom(name: '_LoginControllerBase.login');

  @override
  Login get login {
    _$loginAtom.reportRead();
    return super.login;
  }

  @override
  set login(Login value) {
    _$loginAtom.reportWrite(value, super.login, () {
      super.login = value;
    });
  }

  final _$authResponseAtom = Atom(name: '_LoginControllerBase.authResponse');

  @override
  AuthResponse get authResponse {
    _$authResponseAtom.reportRead();
    return super.authResponse;
  }

  @override
  set authResponse(AuthResponse value) {
    _$authResponseAtom.reportWrite(value, super.authResponse, () {
      super.authResponse = value;
    });
  }

  final _$signInWithEmailAndPasswordAsyncAction =
      AsyncAction('_LoginControllerBase.signInWithEmailAndPassword');

  @override
  Future signInWithEmailAndPassword() {
    return _$signInWithEmailAndPasswordAsyncAction
        .run(() => super.signInWithEmailAndPassword());
  }

  final _$signInWithGoogleAsyncAction =
      AsyncAction('_LoginControllerBase.signInWithGoogle');

  @override
  Future signInWithGoogle() {
    return _$signInWithGoogleAsyncAction.run(() => super.signInWithGoogle());
  }

  final _$signInWithFacebookAsyncAction =
      AsyncAction('_LoginControllerBase.signInWithFacebook');

  @override
  Future signInWithFacebook() {
    return _$signInWithFacebookAsyncAction
        .run(() => super.signInWithFacebook());
  }

  @override
  String toString() {
    return '''
login: ${login},
authResponse: ${authResponse},
formIsValid: ${formIsValid}
    ''';
  }
}
