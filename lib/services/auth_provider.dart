import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthClass {
  FirebaseAuth auth = FirebaseAuth.instance;

  //Create user
  Future<String> createAccount({String email, String password}) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);

      return "Created";
    } on FirebaseAuthException catch (e) {
      //FirebaseAuthException e = (FirebaseAuthException )task.getException();
      //return Toast.makeText(LoginActivity.this, "Failed Registration: "+e.getMessage(), Toast.LENGTH_SHORT).show();
      //message.hide();

      if (e.code == 'weak-password') {
        return "The password provided is too weak." + e.message;
      } else if (e.code == 'email-already-in-use') {
        return "User existed. " + e.message;
      }
    } catch (e) {
      print(e);
      return "Error Occured";
    }
    return '200';
  }

  // Sign in user
  Future<String> signIN({String email, String password}) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      print("ok update");
      return "Welcome";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'User not exist.';
      } else if (e.code == 'wrong-password') {
        return 'Wrong password!';
      }
    }
    return '200';
  }

  //Signout
  void signOut() {
    //print("너는 내게 과분한 사람이야");
    auth.signOut();
  }
}

class UserData {
  static FirebaseFirestore _db = FirebaseFirestore.instance;

  static saveUser(User user) async {
    Map<String, dynamic> userData = {
      "name": user.displayName,
      "email": user.email,
      "last_login": user.metadata.lastSignInTime.millisecondsSinceEpoch,
      "created_at": user.metadata.creationTime.millisecondsSinceEpoch,
      "role": "user",
    };
    final userRef = _db.collection("users").doc(user.uid);
    if ((await userRef.get()).exists) {
      await userRef.update({
        "last_login": user.metadata.lastSignInTime.millisecondsSinceEpoch,
      });
    } else {
      await _db.collection("users").doc(user.uid).set(userData);
    }
  }
}
