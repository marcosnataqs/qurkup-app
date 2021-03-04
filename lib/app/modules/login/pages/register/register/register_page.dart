import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:qurkup/app/modules/login/pages/register/register/register_controller.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState
    extends ModularState<RegisterPage, RegisterController> {
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
      appBar: AppBar(
        title: Text('Criar uma conta'),
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            SizedBox(height: 30.0),
            _fullNameTextField(context),
            SizedBox(height: 12.0),
            _emailTextField(context),
            SizedBox(height: 12.0),
            _passwordTextField(context),
            SizedBox(height: 12.0),
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                FlatButton(
                  onPressed: () {
                    Modular.to.pop();
                  },
                  child: Text('Voltar'),
                  textColor: Colors.grey[600],
                ),
                Observer(builder: (_) {
                  return RaisedButton(
                    onPressed: controller.isFormValid
                        ? controller.createUserWithEmailAndPassword
                        : null,
                    child: Text('Criar conta'),
                    color: Theme.of(context).primaryColor,
                  );
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }

  TextField _fullNameTextField(BuildContext context) {
    return TextField(
      onChanged: controller.setFullName,
      decoration: InputDecoration(
        labelText: 'Nome Completo',
        filled: true,
        fillColor: Theme.of(context).scaffoldBackgroundColor,
      ),
    );
  }

  TextField _passwordTextField(BuildContext context) {
    return TextField(
      onChanged: controller.setPassword,
      decoration: InputDecoration(
        labelText: 'Senha',
        filled: true,
        fillColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      obscureText: true,
    );
  }

  TextField _emailTextField(BuildContext context) {
    return TextField(
      onChanged: controller.setEmail,
      decoration: InputDecoration(
        labelText: 'Email',
        filled: true,
        fillColor: Theme.of(context).scaffoldBackgroundColor,
      ),
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
