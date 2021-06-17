import 'package:flutter/material.dart';
import 'login_body.dart';

class LoginScreen extends StatefulWidget {
  static Route route() =>
      MaterialPageRoute(builder: (context) => LoginScreen());

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  TextEditingController _email = TextEditingController();
  get email => _email;
  set email(value) => setState(() => _email = value);

  TextEditingController _password = TextEditingController();
  get password => _password;
  set password(value) => setState(() => _password = value);

  bool _showPassword = false;
  get showPassword => _showPassword;
  set showPassword(value) => setState(() => _showPassword = value);

  bool _isLoggedIn = false;
  get isLoggedIn => _isLoggedIn;
  set isLoggedIn(value) => setState(() => _isLoggedIn = value);

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
