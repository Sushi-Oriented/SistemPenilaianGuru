import 'package:flutter/material.dart';
import 'package:spg_test/components/background.dart';

import 'package:spg_test/components/rounded_button.dart';
import 'package:spg_test/components/rounded_input_field.dart';
import 'package:spg_test/components/rounded_password_field.dart';
import 'package:spg_test/screens/welcome/welcome_screen.dart';
import 'package:spg_test/constant.dart';

import 'login_screen.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({state}) : _state = state;

  final LoginScreenState _state;

  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                _state.username,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Container(
                child: Image(
                    height: 280,
                    image: AssetImage('assets/images/loginPic.png'),
                    fit: BoxFit.contain),
              ),
              RoundedInputField(
                // Import from rounded_input_field.dart
                hintText: "Username",
                onChanged: (value) => _state.username = value,
              ),
              RoundedPasswordField(
                // Import from rounded_passsword_field.dart
                hintText: "Password",
                obscureText: !_state.showPassword,
                onChanged: (value) => _state.password = value,
                press: () => _state.showPassword = !_state.showPassword,
              ),
              RoundedLoginButton(
                // Import from rounded_button.dart
                color: spgPrimaryColor,
                text: "Log In",
                press: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WelcomeScreen()),
                  )
                },
              )
            ]),
      ),
    );
  }
}

//14:09
