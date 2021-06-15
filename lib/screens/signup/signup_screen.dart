import 'package:flutter/material.dart';
import 'signup_body.dart';

class SignUpScreen extends StatefulWidget {
  static Route route() =>
      MaterialPageRoute(builder: (context) => SignUpScreen());

  @override
  SignUpScreenState createState() => SignUpScreenState();
}

class SignUpScreenState extends State<SignUpScreen> {
  String _name = 'Sign Up';
  String _username = '';
  String _password = '';
  bool _showPassword = false;

  get name => _name;
  set name(value) => setState(() => _name = value);

  get username => _username;
  set username(value) => setState(() => _username = value);

  get password => _password;
  set password(value) => setState(() => _password = value);

  get showPassword => _showPassword;
  set showPassword(value) => setState(() => _showPassword = value);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: SafeArea(
        child: Scaffold(
          body: SignUpBody(state: this),
        ),
      ),
    );
  }
}
