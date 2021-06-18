import 'package:flutter/material.dart';
import 'router.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SPG',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      initialRoute: '/welcomeScreen',
      onGenerateRoute: createRoute,
    );
  }
}
