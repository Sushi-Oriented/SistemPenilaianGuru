import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart'; //Button API
//import 'package:spg_test/screens/login/login_screen.dart';

class WelcomeScreen extends StatefulWidget {
  static Route route() =>
      MaterialPageRoute(builder: (context) => WelcomeScreen());

  @override
  WelcomeScreenState createState() => WelcomeScreenState();
}

class WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(height: 40.0),
            Container(
              child: Image(
                  height: 250,
                  image: AssetImage('assets/images/welcomePic.png'),
                  fit: BoxFit.contain),
            ),
            SizedBox(height: 35.0),
            RichText(
              text: TextSpan(
                text: 'Welcome to ',
                style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
                children: <TextSpan>[
                  TextSpan(
                      text: 'SPG',
                      style: TextStyle(
                          fontSize: 35.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue))
                ],
              ),
            ),
            SizedBox(height: 5.0),
            Text(
              'Sistem Penilaian Guru',
              style: TextStyle(fontSize: 17.5, color: Colors.black),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                    onPressed: () => {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => LoginScreen()),
                          // )
                        },
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.only(left: 25.0, right: 25.0),
                      primary: Colors.green,
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(10.0)),
                    )),
                SizedBox(width: 15.0),
                ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Register',
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.only(left: 30.0, right: 30.0),
                      primary: Colors.grey,
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(10.0)),
                    )),
              ],
            ),
            SizedBox(height: 20.0),
            SignInButton(
              Buttons.GoogleDark,
              text: "Sign up with Google",
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
