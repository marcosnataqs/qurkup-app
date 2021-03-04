import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: Modular.navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'QurkUp',
      theme: ThemeData(
        primaryColor: Color(0xFFFF7043),
        primaryColorLight: Color(0xFFFFA270),
        primaryColorDark: Color(0xFFC63F17),
        accentColor: Color(0xFF80665E),
      ),
      initialRoute: '/',
      onGenerateRoute: Modular.generateRoute,
    );
  }
}
