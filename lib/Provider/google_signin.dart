import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:quotes/Views/home.dart';
import 'package:quotes/Views/welcome.dart';

class GoogleSignInProvider {
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  Future<User?> registerWithGoogle() async {
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
    }

    return user;
  }

  Future<void> signOutGoogle() async {
    await _googleSignIn.signOut();
    print('User Signed Out');
  }
}
