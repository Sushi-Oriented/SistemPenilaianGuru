import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:spg_test/screens/principal/principal_body.dart';

class PrincipalScreen extends StatefulWidget {
  static Route route() =>
      MaterialPageRoute(builder: (context) => PrincipalScreen());

  @override
  PrincipalScreenState createState() => PrincipalScreenState();
}

class PrincipalScreenState extends State<PrincipalScreen> {

  String _email = FirebaseAuth.instance.currentUser.email;
  get email => _email;
  set email(value) => _email = value;


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: SafeArea(
        child: Scaffold(
          body: DashboardPrincipalBody(state: this),
        ),
      ),
    );
  }
}
