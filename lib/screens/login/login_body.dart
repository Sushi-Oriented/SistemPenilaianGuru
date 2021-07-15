import 'package:flutter/material.dart';
import 'package:spg_test/constant.dart';

// Widget
import 'package:spg_test/widget/background.dart';
import 'package:spg_test/widget/rounded_button.dart';
import 'package:spg_test/widget/rounded_input_field.dart';
import 'package:spg_test/widget/rounded_password_field.dart';
import 'package:spg_test/widget/orDivider.dart';

// Screens
import 'package:spg_test/screens/signup/signup_screen.dart';
import 'package:spg_test/screens/login/login_screen.dart';

// Services
import 'package:spg_test/services/auth_provider.dart';
import 'package:spg_test/services/check/check_userType.dart';

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
                      hintText: "Email",
                      controller: _state.email,
                    ),
                    RoundedPasswordField(
                      hintText: "Password",
                      obscureText: !_state.showPassword,
                      controller: _state.password,
                      press: () => _state.showPassword = !_state.showPassword,
                    ),
                    RoundedLoginButton(
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
                                    builder: (context) => CheckTypeScreen()),
                                (route) => false);
                          } else {
                            _state.isLoggedIn = false;
                            ScaffoldMessenger.of(context)
                                .showSnackBar(SnackBar(content: Text(value)));
                          }
                        })
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
