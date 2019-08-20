import 'package:flutter/material.dart';
import 'utils/app_constants.dart';

void main() => runApp(AccApp());

class AccApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(appTitle),),
    );
  }
}
