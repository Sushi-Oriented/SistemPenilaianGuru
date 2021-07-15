import 'package:flutter/material.dart';
import 'package:spg_test/components/background.dart';

import 'package:spg_test/components/rounded_button.dart';
import 'package:spg_test/components/rounded_input_field.dart';
import 'package:spg_test/components/rounded_password_field.dart';

import 'package:spg_test/screens/signup/components/orDivider.dart';
import 'package:spg_test/screens/signup/signup_screen.dart';
import 'package:spg_test/screens/student/dashboard_screen.dart';
import 'package:spg_test/constant.dart';
import 'package:spg_test/services/auth_provider.dart';

import 'login_screen.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({state}) : _state = state;

  final LoginScreenState _state;

  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
          child: _state.isLoggedIn == false
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Login",
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
                      hintText: "Email",
                      controller: _state.email,
                    ),
                    RoundedPasswordField(
                      // Import from rounded_passsword_field.dart
                      hintText: "Password",
                      obscureText: !_state.showPassword,
                      controller: _state.password,
                      press: () => _state.showPassword = !_state.showPassword,
                    ),
                    RoundedLoginButton(
                      // Import from rounded_button.dart
                      color: spgPrimaryColor,
                      text: "Log In",
                      press: () => {
                        _state.isLoggedIn = true,
                        AuthClass()
                            .signIN(
                          email: _state.email.text.trim(),
                          password: _state.password.text.trim(),
                        )
                            .then((value) {
                          if (value == "Welcome") {
                            print(_state.email);
                            _state.isLoggedIn = false;
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        DashboardStudScreen()),
                                (route) => false);
                          } else {
                            _state.isLoggedIn = false;
                            ScaffoldMessenger.of(context)
                                .showSnackBar(SnackBar(content: Text(value)));
                          }
                        })
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => DashboardStudScreen()),
                        // )
                      },
                    ),
                    SizedBox(height: 10.0),
                    OrDivider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // children: <Widget>[
                      //   SignInButton(
                      //     Buttons.Google,
                      //     text: "Sign in with Google",
                      //     onPressed: () {},
                      //   )
                      // ],
                      children: <Widget>[
                        GestureDetector(
                          onTap: () => {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUpScreen()),
                            )
                          },
                          child: Text("Don't have an account? 미친!"),
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
                )),
    );
  }
}
