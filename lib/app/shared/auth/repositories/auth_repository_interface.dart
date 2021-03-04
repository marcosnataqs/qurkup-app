import 'package:firebase_auth/firebase_auth.dart';
import 'package:qurkup/app/shared/auth/models/auth_reponse.dart';

abstract class IAuthRepository {
  Future<AuthResponse> signInWithGoogle();

  Future<AuthResponse> signInWithFacebook();

  Future<AuthResponse> createUserWithEmailAndPassword(
      String fullName, String email, String password);

  Future<AuthResponse> signInWithEmailAndPassword(
      String email, String password);

  Future<AuthResponse> sendPasswordResetEmail(String emailAddress);

  Future<FirebaseUser> getUser();

  Future signOut();
}
