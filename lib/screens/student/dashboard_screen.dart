import 'package:flutter/material.dart';

class DashboardStudScreen extends StatefulWidget {
  static Route route() =>
      MaterialPageRoute(builder: (context) => DashboardStudScreen());

  @override
  DashboardStudState createState() => DashboardStudState();
}

class DashboardStudState extends State<DashboardStudScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: SafeArea(
        child: Scaffold(
          body: (),
        ),
      ),
    );
  }
}
