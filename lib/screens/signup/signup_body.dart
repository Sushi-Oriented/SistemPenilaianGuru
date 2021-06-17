import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:spg_test/components/background.dart';
import 'package:spg_test/components/rounded_button.dart';
import 'package:spg_test/components/rounded_input_field.dart';
import 'package:spg_test/components/rounded_password_field.dart';
import 'package:spg_test/screens/signup/signup_screen.dart';
import 'package:spg_test/screens/welcome/welcome_screen.dart';

import '../../constant.dart';
import 'components/orDivider.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({state}) : _state = state;

  final SignUpScreenState _state;

  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Sign Up",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Container(
              child: Image(
                height: 200,
                width: 300,
                image: AssetImage('assets/images/signUpPic.png'),
                fit: BoxFit.contain,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("sdas"),
              ],
            ),
            RoundedInputField(
              hintText: "Email",
              controller: _state.email,
              //onChanged: (value) => _state.username = value,
            ),
            RoundedPasswordField(
              hintText: "Password",
              obscureText: !_state.showPassword,
              controller: _state.password,
              press: () => _state.showPassword = !_state.showPassword,
            ),
            RoundedLoginButton(
              color: spgPrimaryColor,
              text: "Sign Up",
              press: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WelcomeScreen()),
                )
              },
            ),
            SizedBox(height: 10.0),
            OrDiveder(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SignInButton(
                  Buttons.Google,
                  text: "Sign up with Google",
                  onPressed: () {},
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
