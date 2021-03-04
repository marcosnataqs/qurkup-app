import 'package:firebase_auth/firebase_auth.dart';

class AuthResponse {
  String errorCode;
  String errorMsg;
  String successMsg;
  FirebaseUser currentUser;

  AuthResponse({this.errorCode, this.errorMsg, this.currentUser});
}
