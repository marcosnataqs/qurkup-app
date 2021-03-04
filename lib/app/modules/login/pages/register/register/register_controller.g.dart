// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RegisterController on _RegisterControllerBase, Store {
  Computed<bool> _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: '_RegisterControllerBase.isFormValid'))
          .value;

  final _$registerAtom = Atom(name: '_RegisterControllerBase.register');

  @override
  Register get register {
    _$registerAtom.reportRead();
    return super.register;
  }

  @override
  set register(Register value) {
    _$registerAtom.reportWrite(value, super.register, () {
      super.register = value;
    });
  }

  final _$authResponseAtom = Atom(name: '_RegisterControllerBase.authResponse');

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

  final _$createUserWithEmailAndPasswordAsyncAction =
      AsyncAction('_RegisterControllerBase.createUserWithEmailAndPassword');

  @override
  Future createUserWithEmailAndPassword() {
    return _$createUserWithEmailAndPasswordAsyncAction
        .run(() => super.createUserWithEmailAndPassword());
  }

  final _$sendPasswordResetEmailAsyncAction =
      AsyncAction('_RegisterControllerBase.sendPasswordResetEmail');

  @override
  Future sendPasswordResetEmail() {
    return _$sendPasswordResetEmailAsyncAction
        .run(() => super.sendPasswordResetEmail());
  }

  final _$_RegisterControllerBaseActionController =
      ActionController(name: '_RegisterControllerBase');

  @override
  dynamic setFullName(String fullName) {
    final _$actionInfo = _$_RegisterControllerBaseActionController.startAction(
        name: '_RegisterControllerBase.setFullName');
    try {
      return super.setFullName(fullName);
    } finally {
      _$_RegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setEmail(String email) {
    final _$actionInfo = _$_RegisterControllerBaseActionController.startAction(
        name: '_RegisterControllerBase.setEmail');
    try {
      return super.setEmail(email);
    } finally {
      _$_RegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPassword(String password) {
    final _$actionInfo = _$_RegisterControllerBaseActionController.startAction(
        name: '_RegisterControllerBase.setPassword');
    try {
      return super.setPassword(password);
    } finally {
      _$_RegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
register: ${register},
authResponse: ${authResponse},
isFormValid: ${isFormValid}
    ''';
  }
}
