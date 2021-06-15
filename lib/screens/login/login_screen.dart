import 'package:flutter/material.dart';
import 'login_body.dart';

class LoginScreen extends StatefulWidget {
  static Route route() =>
      MaterialPageRoute(builder: (context) => LoginScreen());

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  String _password = '';
  String _username = 'Login';
  String _errors = '';
  bool _showPassword = false;

  get password => _password;
  set password(value) => setState(() => _password = value);

  get username => _username;
  set username(value) => setState(() => _username = value);

  get showPassword => _showPassword;
  set showPassword(value) => setState(() => _showPassword = value);

  get errors => _errors;
  set errors(value) => setState(() => _errors = value);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: SafeArea(
        child: Scaffold(
          body: LoginBody(state: this),
        ),
      ),
    );
  }
}
