import 'package:account_opening_app/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController usernameTextEditingController;
  TextEditingController passwordTextEditingController;

  @override
  void initState() {
    usernameTextEditingController = new TextEditingController();
    passwordTextEditingController = new TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<LoginBloc>(context);

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextFormField(
            controller: usernameTextEditingController,
            maxLines: 1,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(labelText: "Enter NT Id"),
          ),
          SizedBox(
            height: 10.0,
          ),
          TextFormField(
            controller: passwordTextEditingController,
            maxLines: 1,
            keyboardType: TextInputType.text,
            obscureText: true,
            decoration: InputDecoration(labelText: "Enter Password"),
          ),
          SizedBox(
            height: 10.0,
          ),
          RaisedButton(
            child: Text("Login"),
            onPressed: () {
              bloc.dispatch(Login(usernameTextEditingController.text.toString(),
                  passwordTextEditingController.text.toString()));
            },
          )
        ],
      ),
    );
  }
}
