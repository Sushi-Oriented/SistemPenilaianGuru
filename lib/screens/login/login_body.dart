import 'package:flutter/material.dart';
import 'login_screen.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({state}) : _state = state;

  final LoginScreenState _state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
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
              Text(_state.username),
              Container(
                child: Form(
                  //key: _state.formKey,
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: TextFormField(validator: (input) {
                          if (input.isEmpty) return 'Enter Username';
                          decoration:
                          InputDecoration(
                              labelText: 'Username',
                              prefixIcon: Icon(Icons.email));
                          onSaved:
                          (input) => _state.username = input;
                        }),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
