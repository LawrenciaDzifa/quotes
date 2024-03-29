import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:quotes/Authenticate_Views/login.dart';
import 'package:quotes/Views/home.dart';
import 'package:quotes/Views/welcome.dart';
import 'package:quotes/Widgets/click_button.dart';

class GoogleSignInProvider extends ChangeNotifier {
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      // 'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  Future registerWithGoogle(BuildContext context) async {
    // Sign in with Google
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    if (googleUser == null) {
      return null;
    }

    // Get the authentication tokens from Google
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // Create a credential from the access token and ID token
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Sign in with the Firebase credential
    final UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);

    // Create a new user in Firebase Authentication if one doesn't exist
    final User? user = userCredential.user;
    if (user != null && !user.emailVerified) {
      await user.sendEmailVerification();
      // Show a welcome pop up
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Welcome!"),
            content: Text("Please check your email to verify your account."),
            actions: <Widget>[
              ClickButton(
                text: "OK",
                press: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
      // navigate to login page
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) {
            return Login();
          },
        ),
      );
    }
  }

  Future signInWithGoogle(BuildContext context) async {
    // Sign in with Google
    GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

    // Get the authentication tokens from Google
    GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a credential from the access token and ID token
    AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Sign in with the Firebase credential
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
    // If the user is not null then navigate to the home page
    if (userCredential.user != null) {
      // show a welcome modal
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            elevation: 50,
            title: Text("Welcome!"),
            content: Text("You have successfully logged in."),
            actions: <Widget>[
              ClickButton(
                text: "OK",
                press: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) {
            return Home();
          },
        ),
      );
    }
  }

  Future signOut(BuildContext context) async {
    await _googleSignIn.disconnect();
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return Welcome();
        },
      ),
    );
  }
}
