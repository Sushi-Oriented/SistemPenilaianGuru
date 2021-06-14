import 'package:flutter/material.dart';
import 'login_screen.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({state}) : _state = state;

  final LoginScreenState _state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(height: 30.0),
            Container(
              child: Image(
                  height: 300,
                  image: AssetImage('assets/images/loginPic.png'),
                  fit: BoxFit.contain),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Form(
                    child: Column(
                      children: <Widget>[
                        Text(_state.username),
                        Container(),
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
