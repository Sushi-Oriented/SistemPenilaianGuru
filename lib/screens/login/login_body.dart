import 'package:flutter/material.dart';
import 'package:spg_test/components/text_field_container.dart';
import 'package:spg_test/components/rounded_input_field.dart';
import 'login_screen.dart';
import '../../constant.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({state}) : _state = state;

  final LoginScreenState _state;

  @override
  Widget build(BuildContext context) {
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
                    height: 250,
                    image: AssetImage('assets/images/loginPic.png'),
                    fit: BoxFit.contain),
              ),
              RoundedInputField(
                hinText: "Insert your username",
                onChanged: (value) => _state.username = value,
              ),
              TexFieldContainer(
                child: TextField(
                  obscureText: !_state.showPassword,
                  onChanged: (value) => _state.password = value,
                  decoration: InputDecoration(
                      hintText: "Insert your password",
                      icon: Icon(Icons.lock),
                      border: InputBorder.none,
                      suffixIcon: Icon(
                        Icons.visibility,
                      )),
                ),
              )
            ]),
      ),
    );
  }
}
