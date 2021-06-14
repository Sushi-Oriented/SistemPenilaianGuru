import 'package:flutter/material.dart';
import 'package:spg_test/screens/welcome/welcome_screen.dart';

//import 'constant.dart';

Route<dynamic> createRoute(settings) {
  switch (settings.name) {
    case '/':
    case '/welcomeScreen':
      return WelcomeScreen.route();
  }
  return null;
}
