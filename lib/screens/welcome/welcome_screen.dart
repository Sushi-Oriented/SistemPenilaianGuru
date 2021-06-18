import 'package:flutter/material.dart';
//import 'package:spg_test/components/rounded_button.dart';
import 'package:firebase_core/firebase_core.dart';

// import 'package:spg_test/screens/login/login_screen.dart';
// import 'package:spg_test/screens/signup/signup_screen.dart';
import 'package:spg_test/screens/splash.dart';

class WelcomeScreen extends StatefulWidget {
  static Route route() =>
      MaterialPageRoute(builder: (context) => WelcomeScreen());

  @override
  WelcomeScreenState createState() => WelcomeScreenState();
}

class WelcomeScreenState extends State<WelcomeScreen> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   body: Container(
    //     child: Column(
    //       children: <Widget>[
    //         SizedBox(height: 40.0),
    //         Container(
    //           child: Image(
    //               height: 250,
    //               image: AssetImage('assets/images/welcomePic.png'),
    //               fit: BoxFit.contain),
    //         ),
    //         SizedBox(height: 35.0),
    //         RichText(
    //           text: TextSpan(
    //             text: 'Welcome to ',
    //             style: TextStyle(
    //                 fontSize: 30.0,
    //                 fontWeight: FontWeight.bold,
    //                 color: Colors.black),
    //             children: <TextSpan>[
    //               TextSpan(
    //                   text: 'SPG',
    //                   style: TextStyle(
    //                       fontSize: 35.0,
    //                       fontWeight: FontWeight.bold,
    //                       color: Colors.blue))
    //             ],
    //           ),
    //         ),
    //         SizedBox(height: 5.0),
    //         Text(
    //           'Sistem Penilaian Guru',
    //           style: TextStyle(fontSize: 17.5, color: Colors.black),
    //         ),
    //         SizedBox(height: 20.0),
    //         Row(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: <Widget>[
    //             SizedBox(width: 15.0),
    //             RoundedLoginButton(
    //               text: "Login",
    //               color: Colors.green,
    //               press: () => {
    //                 Navigator.push(
    //                   context,
    //                   MaterialPageRoute(builder: (context) => LoginScreen()),
    //                 )
    //               },
    //             ),
    //           ],
    //         ),
    //         Row(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: <Widget>[
    //             SizedBox(height: 60.0, width: 15.0),
    //             RoundedLoginButton(
    //               text: "Sign Up",
    //               color: Colors.blueGrey,
    //               press: () => {
    //                 Navigator.push(
    //                   context,
    //                   MaterialPageRoute(builder: (context) => SignUpScreen()),
    //                 )
    //               },
    //             ),
    //           ],
    //         ),
    //         SizedBox(height: 20.0),
    //       ],
    //     ),
    //   ),
    // );
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
