import 'package:firebase_auth/firebase_auth.dart';

class AuthClass {
  FirebaseAuth auth = FirebaseAuth.instance;

  //Create user
  Future<String> createAccount({String email, String password}) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      //print('Krystl');
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
    //return '200';
  }

  // Sign in user
  Future<String> signIN({String email, String password}) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      //print("Logged In");
      return "Welcome";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'User not exist.';
      } else if (e.code == 'wrong-password') {
        return 'Wrong password!';
      }
    }
    //return '200';
  }

  //Signout
  void signOut() {
    //print("너는 내게 과분한 사람이야");
    auth.signOut();
  }
}
