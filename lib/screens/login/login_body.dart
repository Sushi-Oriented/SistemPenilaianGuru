import 'package:flutter/material.dart';
import 'login_screen.dart';
import '../welcome/welcome_screen.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({state}) : _state = state;

  final LoginScreenState _state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(height: 40.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Image(
                      height: 250,
                      image: AssetImage('assets/images/welcomePic.png'),
                      fit: BoxFit.contain),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
