import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:qurkup/app/pages/splash/splash_controller.dart';
import 'package:qurkup/app/shared/auth/auth_controller.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends ModularState<SplashPage, SplashController> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 4)).then(
      (_) async {
        final AuthController _authController = Modular.get<AuthController>();
        final FirebaseUser user = await _authController.getUser();

        if (user == null) {
          Modular.to.pushReplacementNamed('/login/');
        } else {
          Modular.to.pushReplacementNamed('/home/');
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Text(
          'QurkUp',
          style: TextStyle(
            color: Colors.white,
            fontSize: 44,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
