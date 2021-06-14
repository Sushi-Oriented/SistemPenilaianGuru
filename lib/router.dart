import 'package:flutter/material.dart';
import 'package:spg_test/screens/welcome/welcome_screen.dart';
import 'package:spg_test/screens/login/login_screen.dart';

Route<dynamic> createRoute(settings) {
  switch (settings.name) {
    case '/':
    case '/welcomeScreen':
      return WelcomeScreen.route();
    case '/loginScreen':
      return LoginScreen.route();
  }
  return null;
}
