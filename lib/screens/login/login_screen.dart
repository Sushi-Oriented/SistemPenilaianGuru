import 'package:flutter/material.dart';
import 'login_body.dart';

import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  static Route route() =>
      MaterialPageRoute(builder: (context) => LoginScreen());

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  //final FirebaseAuth _auth = FirebaseAuth.instance;
  //final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _password = '';
  String _username = 'TATATAA';
  String _errors = '';
  bool _showPassword = false;

  // Getter and setter
  get password => _password;
  set password(value) => setState(() => _password = value);

  get username => _username;
  set username(value) => setState(() => _username = value);

  get showPassword => _showPassword;
  set showPassword(value) => setState(() => _showPassword = value);

  get errors => _errors;
  set errors(value) => setState(() => _errors = value);

  // checkAuthentic() async {
  //   _auth.authStateChanges().listen((user) {
  //     if (user != null) {
  //       //print(user);
  //     }
  //   }); 30.33
  // }

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
