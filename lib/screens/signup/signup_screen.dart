import 'package:flutter/material.dart';
import 'signup_body.dart';

class SignUpScreen extends StatefulWidget {
  static Route route() =>
      MaterialPageRoute(builder: (context) => SignUpScreen());

  @override
  SignUpScreenState createState() => SignUpScreenState();
}

class SignUpScreenState extends State<SignUpScreen> {
  // String _name = 'Sign Up';
  // String _username = '';
  // String _password = '';

  // get name => _name;
  // set name(value) => setState(() => _name = value);

  // get username => _username;
  // set username(value) => setState(() => _username = value);

  // get password => _password;
  // set password(value) => setState(() => _password = value);

  bool _showPassword = false;
  get showPassword => _showPassword;
  set showPassword(value) => setState(() => _showPassword = value);

  TextEditingController _email = TextEditingController();
  get email => _email;
  set email(value) => setState(() => _email = value);

  TextEditingController _password = TextEditingController();
  get password => _password;
  set password(value) => setState(() => _password = value);

  bool _isRegister = false;
  get isRegister => _isRegister;
  set isRegister(value) => setState(() => _isRegister = value);

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
