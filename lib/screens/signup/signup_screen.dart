import 'package:flutter/material.dart';
import 'signup_body.dart';

class SignUpScreen extends StatefulWidget {
  static Route route() =>
      MaterialPageRoute(builder: (context) => SignUpScreen());

  @override
  SignUpScreenState createState() => SignUpScreenState();
}

class SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: SafeArea(
        child: Scaffold(
          body: SignUpBody(),
        ),
      ),
    );
  }
}
