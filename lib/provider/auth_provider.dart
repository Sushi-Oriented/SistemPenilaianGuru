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
      // return Toast.makeText(LoginActivity.this, "Failed Registration: "+e.getMessage(), Toast.LENGTH_SHORT).show();
      //message.hide();

      if (e.code == 'weak-password') {
        return "The password provided is too weak.Like You! 누브!" + e.message;
      } else if (e.code == 'email-already-in-use') {
        return "User existed. " + e.message;
      }
    } catch (e) {
      print(e);
      return "Error Occured";
    }
  }

  // Sign in user
  Future<String> signIN({String email, String password}) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      //print("Logged Insnz");
      return "Welcome";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'User not exist. 진짜?!';
      } else if (e.code == 'wrong-password') {
        return 'Wrong password! 죽어라';
      }
    }
  }

  //Reset Password - tak kut

  //Signout
  void signOut() {
    print("너는 내게 과분한 사람이야"); //I’m not good enough for you.
    auth.signOut();
  }
}
