import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:qurkup/app/shared/auth/models/auth_reponse.dart';
import 'package:qurkup/app/shared/auth/repositories/auth_repository_interface.dart';

class AuthRepository extends Disposable implements IAuthRepository {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<AuthResponse> signInWithGoogle() async {
    AuthResponse authResponse = AuthResponse();
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();

    if (googleUser != null) {
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      try {
        authResponse.currentUser =
            (await _auth.signInWithCredential(credential)).user;
      } catch (e) {
        authResponse.errorCode = e.code;
        authResponse.errorMsg = e.message;
      }
    } else {
      authResponse.errorCode = 'cancelledByUser';
    }

    return authResponse;
  }

  @override
  Future<AuthResponse> signInWithFacebook() async {
    AuthResponse authResponse = AuthResponse();
    final FacebookLogin facebookLogin = FacebookLogin();
    final FacebookLoginResult facebookLoginResult =
        await facebookLogin.logIn(['email']);
    String accessToken;
    AuthCredential facebookAuthCred;

    switch (facebookLoginResult.status) {
      case FacebookLoginStatus.cancelledByUser:
        print("FacebookLoginStatus => Cancelled");
        authResponse.errorCode = 'cancelledByUser';
        break;
      case FacebookLoginStatus.error:
        print(
            "FacebookLoginStatus => error: ${facebookLoginResult.errorMessage}");
        authResponse.errorCode = 'error';
        authResponse.errorMsg = facebookLoginResult.errorMessage;
        break;
      case FacebookLoginStatus.loggedIn:
        accessToken = facebookLoginResult.accessToken.token;
        facebookAuthCred =
            FacebookAuthProvider.getCredential(accessToken: accessToken);

        try {
          authResponse.currentUser =
              (await _auth.signInWithCredential(facebookAuthCred)).user;
        } catch (e) {
          authResponse.errorCode = e.code;
          authResponse.errorMsg = e.message;
        }
        break;
    }

    return authResponse;
  }

  @override
  Future<AuthResponse> signInWithEmailAndPassword(
      String email, String password) async {
    AuthResponse authResponse = AuthResponse();

    try {
      authResponse.currentUser = (await _auth.signInWithEmailAndPassword(
              email: email, password: password))
          .user;
    } catch (e) {
      authResponse.errorCode = e.code;
      authResponse.errorMsg = e.message;
    }

    return authResponse;
  }

  @override
  Future<AuthResponse> createUserWithEmailAndPassword(
      String fullName, String email, String password) async {
    AuthResponse authResponse = AuthResponse();

    try {
      authResponse.currentUser = (await _auth.createUserWithEmailAndPassword(
              email: email, password: password))
          .user;

      UserUpdateInfo userUpdateInfo = UserUpdateInfo();
      userUpdateInfo.displayName = fullName;
      authResponse.currentUser.updateProfile(userUpdateInfo);
    } catch (e) {
      authResponse.errorCode = e.code;
      authResponse.errorMsg = e.message;
    }

    return authResponse;
  }

  @override
  Future<AuthResponse> sendPasswordResetEmail(String emailAddress) async {
    AuthResponse authResponse = AuthResponse();

    await _auth
        .sendPasswordResetEmail(email: emailAddress)
        .then((_) => authResponse.successMsg =
            'Email de recuperação enviado com sucesso.')
        .catchError((e) {
      authResponse.errorCode = e;
      authResponse.errorMsg = e;
    });

    return authResponse;
  }

  @override
  Future<FirebaseUser> getUser() {
    return _auth.currentUser();
  }

  @override
  Future signOut() {
    return _auth.signOut();
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
