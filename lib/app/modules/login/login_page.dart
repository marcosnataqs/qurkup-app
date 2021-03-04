import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  //use 'controller' variable to access controller
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final List<ReactionDisposer> _disposers = [];

  @override
  void initState() {
    _disposers.add(
      autorun((_) {
        if (controller.authResponse.errorMsg.isNotEmpty) {
          _showAuthError(controller.authResponse.errorMsg);
        }
      }),
    );

    super.initState();
  }

  @override
  void dispose() {
    _disposers.forEach((disposer) => disposer());

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            SizedBox(height: 100.0),
            Column(
              children: <Widget>[
                Text(
                  'QurkUp',
                  style: TextStyle(
                    fontSize: 44.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(height: 80.0),
            Observer(
              builder: (_) {
                return _emailTextField(controller.login.setEmail);
              },
            ),
            SizedBox(height: 12.0),
            Observer(
              builder: (_) {
                return _passwordTextField(controller.login.setPassword);
              },
            ),
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                FlatButton(
                  textColor: Colors.white,
                  child: Text('Esqueceu a senha?'),
                  onPressed: () {
                    _showResetPasswordDialog();
                  },
                ),
                Observer(builder: (_) {
                  return RaisedButton(
                    color: Colors.white,
                    textColor: Colors.grey,
                    child: Text('Entrar'),
                    onPressed: controller.formIsValid
                        ? controller.signInWithEmailAndPassword
                        : null,
                  );
                }),
              ],
            ),
            SizedBox(height: 30.0),
            _registerButton(),
            SizedBox(height: 12.0),
            _signInGoogleButton(),
            SizedBox(height: 12.0),
            _signInFacebookButton(),
          ],
        ),
      ),
    );
  }

  TextField _emailTextField(onChanged) {
    return TextField(
      onChanged: onChanged,
      cursorColor: Colors.white,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelStyle: TextStyle(color: Colors.white),
        labelText: 'Email',
        filled: true,
        fillColor: Theme.of(context).primaryColor,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
    );
  }

  TextField _passwordTextField(onChanged) {
    return TextField(
      onChanged: onChanged,
      cursorColor: Colors.white,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelStyle: TextStyle(color: Colors.white),
        labelText: 'Senha',
        filled: true,
        fillColor: Theme.of(context).primaryColor,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
      obscureText: true,
    );
  }

  Widget _registerButton() {
    return RaisedButton(
      color: Colors.white,
      splashColor: Colors.grey[400],
      onPressed: () {
        Modular.to.pushNamed('/login/register');
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      highlightElevation: 0,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(
                image: AssetImage('assets/login/mail_logo.png'), height: 35.0),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Criar uma conta',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _signInGoogleButton() {
    return RaisedButton(
      color: Colors.white,
      splashColor: Colors.blue,
      onPressed: controller.signInWithGoogle,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      highlightElevation: 0,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(
                image: AssetImage('assets/login/google_logo.png'),
                height: 35.0),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Entrar com Google',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _signInFacebookButton() {
    return RaisedButton(
      color: Colors.white,
      splashColor: Colors.blue,
      onPressed: controller.signInWithFacebook,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      highlightElevation: 0,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(
                image: AssetImage('assets/login/facebook_logo.png'),
                height: 35.0),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Entrar com Facebook',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _showResetPasswordDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('AlertDialog Title'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('This is a demo alert dialog.'),
                Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Approve'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showAuthError(String errorMsg) {
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Text(errorMsg),
        duration: Duration(seconds: 8),
      ),
    );
  }
}
