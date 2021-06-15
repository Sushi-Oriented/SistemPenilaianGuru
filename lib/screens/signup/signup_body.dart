import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:spg_test/components/background.dart';
import 'package:spg_test/screens/signup/signup_screen.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({state}) : _state = state;

  final SignUpScreenState _state;

  @override
  Widget build(BuildContext context) {
    return Background(
      child: Column(
        children: <Widget>[],
      ),
    );
  }
}
