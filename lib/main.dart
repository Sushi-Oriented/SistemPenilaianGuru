import 'package:flutter/material.dart';
import 'router.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'SPG',
        theme: ThemeData(
          primaryColor: Colors.white,
        ),
        initialRoute: '/welcomeScreen',
        onGenerateRoute: createRoute,
      ),
    );
