import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:spg_test/constant.dart';
import 'package:spg_test/screens/login/login_screen.dart';
import 'package:spg_test/services/check/check_userType.dart';

class Splash extends StatefulWidget {
  static Route route() => MaterialPageRoute(builder: (context) => Splash());

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<Splash> {
  FirebaseAuth auth = FirebaseAuth.instance;
  //MaterialPageRoute(builder: (context) => WelcomeScreen()
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 5), () {
      if (auth.currentUser == null) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
            (route) => false);
      } else {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => CheckTypeScreen()),
            (route) => false);
      }
    });

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Image(
                  height: 250,
                  width: 400,
                  image: AssetImage('assets/images/spg.png'),
                  fit: BoxFit.contain),
            ),
            SizedBox(height: 20.0),
            Container(
              child: CircularProgressIndicator(
                color: spgPrimaryColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
