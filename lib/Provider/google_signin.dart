
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:quotes/Views/home.dart';
import 'package:quotes/Views/welcome.dart';

class GoogleSignInProvider extends ChangeNotifier{
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      // 'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  Future registerWithGoogle() async {
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
      // Navigator.of(context).push(
      //   MaterialPageRoute(
      //     builder: (context) {
      //       return Welcome();
      //     },
      //   ),
      // );
    }

    return user;
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
    print(userCredential.user?.displayName);
    // pass userCredentials to Home
    if (userCredential.user != null) {
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
