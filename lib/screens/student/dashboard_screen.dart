import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:spg_test/screens/student/components/custom_app_bar.dart';
// import 'package:spg_test/screens/welcome/welcome_screen.dart';
import 'body.dart';

class DashboardStudScreen extends StatefulWidget {
  static Route route() =>
      MaterialPageRoute(builder: (context) => DashboardStudScreen());

  @override
  DashboardStudState createState() => DashboardStudState();
}

class DashboardStudState extends State<DashboardStudScreen> {
  // String _email = FirebaseAuth.instance.currentUser.email;
  // get email => _email;
  // set email(value) => _email = value;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: SafeArea(
        child: Scaffold(
          body: DashboardStudBody(
            state: this,
          ),
        ),
      ),
    );
  }
}
