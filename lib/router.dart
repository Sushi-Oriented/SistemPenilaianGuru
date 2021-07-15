import 'package:flutter/material.dart';
import 'package:spg_test/screens/check/check.dart';
import 'package:spg_test/screens/signup/signup_screen.dart';
import 'package:spg_test/screens/splash.dart';
import 'package:spg_test/screens/login/login_screen.dart';

Route<dynamic> createRoute(settings) {
  switch (settings.name) {
    case '/':
    case '/checkUser':
      return Splash.route();
    case '/welcomeScreen':
      return CheckScreen.route();
    case '/loginScreen':
      return LoginScreen.route();
    case '/signUpScreen':
      return SignUpScreen.route();
  }
  //return null;
}
