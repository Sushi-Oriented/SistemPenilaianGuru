import 'package:flutter/material.dart';
import 'package:spg_test/screens/principal/principal_body.dart';

class PrincipalScreen extends StatefulWidget {
  static Route route() =>
      MaterialPageRoute(builder: (context) => PrincipalScreen());

  @override
  PrincipalScreenState createState() => PrincipalScreenState();
}

class PrincipalScreenState extends State<PrincipalScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: SafeArea(
        child: Scaffold(
          body: PrincipalBody(state: this),
        ),
      ),
    );
  }
}
