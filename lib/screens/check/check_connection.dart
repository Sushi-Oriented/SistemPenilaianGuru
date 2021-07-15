import 'package:flutter/material.dart';
//import 'package:spg_test/components/rounded_button.dart';
import 'package:firebase_core/firebase_core.dart';

// import 'package:spg_test/screens/login/login_screen.dart';
// import 'package:spg_test/screens/signup/signup_screen.dart';
import 'package:spg_test/screens/splash.dart';

class CheckScreen extends StatefulWidget {
  static Route route() =>
      MaterialPageRoute(builder: (context) => CheckScreen());

  @override
  CheckScreenState createState() => CheckScreenState();
}

class CheckScreenState extends State<CheckScreen> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Container(
            child: Text("Erorroror!"),
          );
        }
        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          print('Yes, 너무 예뻐!');
          return Splash();
        }
        // Otherwise, show something whilst waiting for initialization to complete
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
