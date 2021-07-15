import 'dart:ui';

import 'package:flutter/material.dart';
//import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:spg_test/components/background.dart';
import 'package:spg_test/components/rounded_button.dart';
import 'package:spg_test/components/rounded_input_field.dart';
import 'package:spg_test/components/rounded_password_field.dart';
import 'package:spg_test/screens/check/check_userType.dart';
import 'package:spg_test/screens/login/login_screen.dart';
import 'package:spg_test/screens/signup/signup_screen.dart';
import 'package:spg_test/screens/student/dashboard_screen.dart';
// import 'package:spg_test/screens/welcome/welcome_screen.dart';
import 'package:spg_test/services/auth_provider.dart';

import '../../constant.dart';
import 'components/orDivider.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({state}) : _state = state;

  final SignUpScreenState _state;

  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        child: _state.isRegister == false
            ? Column(
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
                  RoundedInputField(
                    hintText: "Email",
                    controller: _state.email,
                    //onChanged: (value) => _state.username = value,
                  ),
                  RoundedPasswordField(
                    hintText: "Password",
                    controller: _state.password,
                    obscureText: !_state.showPassword,
                    press: () => _state.showPassword = !_state.showPassword,
                  ),
                  RoundedLoginButton(
                    color: spgPrimaryColor,
                    text: "Sign Up",
                    press: () => {
                      _state.isRegister = true,
                      AuthClass()
                          .createAccount(
                        email: _state.email.text.trim(),
                        password: _state.password.text.trim(),
                      )
                          .then((value) {
                        if (value == "Created") {
                          _state.isRegister = false;
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CheckTypeScreen()),
                              (route) => false);
                        } else {
                          _state.isRegister = false;
                          ScaffoldMessenger.of(context)
                              .showSnackBar(SnackBar(content: Text(value)));
                        }
                      })
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => WelcomeScreen()),
                      // )
                    },
                  ),
                  SizedBox(height: 10.0),
                  OrDivider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()),
                          )
                        },
                        child: Text("Already have an account? Login 미친!"),
                      )
                    ],
                  )
                ],
              )
            : Column(
                children: <Widget>[
                  Center(
                    child: CircularProgressIndicator(
                      color: Colors.lightGreen,
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
