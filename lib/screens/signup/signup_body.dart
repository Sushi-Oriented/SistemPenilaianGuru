import 'dart:ui';
import 'package:flutter/material.dart';
import '../../constant.dart';

// Widget
import 'package:spg_test/widget/background.dart';
import 'package:spg_test/widget/rounded_button.dart';
import 'package:spg_test/widget/rounded_input_field.dart';
import 'package:spg_test/widget/rounded_password_field.dart';
import 'package:spg_test/widget/orDivider.dart';

// Screens
import 'package:spg_test/screens/login/login_screen.dart';
import 'package:spg_test/screens/signup/signup_screen.dart';

// Services
import 'package:spg_test/services/auth_provider.dart';
import 'package:spg_test/services/check/check_userType.dart';

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
