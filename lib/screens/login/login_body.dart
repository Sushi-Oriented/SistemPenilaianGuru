import 'package:flutter/material.dart';
import 'package:spg_test/constant.dart';
import 'package:spg_test/screens/login/components/rounded_input_field.dart';
import 'package:spg_test/screens/login/components/rounded_password_field.dart';
import 'package:spg_test/screens/welcome/welcome_screen.dart';
import 'login_screen.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({state}) : _state = state;

  final LoginScreenState _state;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Container(
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
                hintText: "Insert your username",
                onChanged: (value) => _state.username = value,
              ),
              RoundedPasswordField(
                // Import from rounded_passsword_field.dart
                state: _state,
              ),
              Container(
                width: size.width * 0.5,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(29),
                  child: ElevatedButton(
                      onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WelcomeScreen()),
                          ),
                      child: Text(
                        'Log in',
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                        primary: spgPrimaryColor,
                      )),
                ),
              )
            ]),
      ),
    );
  }
} //14:09
