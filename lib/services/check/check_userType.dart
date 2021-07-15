import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:spg_test/screens/login/login_screen.dart';
import 'package:spg_test/screens/principal/principal_screen.dart';
import 'package:spg_test/screens/signup/signup_screen.dart';
import 'package:spg_test/screens/student/dashboard_screen.dart';
import 'package:spg_test/services/auth_provider.dart';

class CheckTypeScreen extends StatelessWidget {
  static Route route() =>
      MaterialPageRoute(builder: (context) => CheckTypeScreen());

  @override
  CheckTypeScreen createState() => CheckTypeScreen();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data != null) {
          UserData.saveUser(snapshot.data);
          return StreamBuilder<DocumentSnapshot>(
              stream: FirebaseFirestore.instance
                  .collection("users")
                  .doc(snapshot.data.uid)
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<DocumentSnapshot> snapshot) {
                if (snapshot.hasData && snapshot.data != null) {
                  //final userDoc = snapshot.data;
                  //final user = userDoc.data();
                  var userType = (snapshot.data)['role'];
                  print(userType);
                  if (userType == 'Principal') {
                    print('Principal');
                    return PrincipalScreen();
                  } else if (userType == 'Student') {
                    print('Student');
                    return DashboardStudScreen();
                  } else {
                    return LoginScreen();
                  }
                } else {
                  return Material(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
              });
        }
        print("login");
        return LoginScreen();
      },
    );
  }
}
