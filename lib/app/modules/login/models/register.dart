import 'package:mobx/mobx.dart';
part 'register.g.dart';

class Register = _RegisterBase with _$Register;

abstract class _RegisterBase with Store {
  @observable
  String fullName = '';

  @action
  setFullName(String value) {
    fullName = value;
  }

  @observable
  String email = '';

  @action
  setEmail(String value) {
    email = value;
  }

  @observable
  String password = '';

  @action
  setPassword(String value) {
    password = value;
  }
}
