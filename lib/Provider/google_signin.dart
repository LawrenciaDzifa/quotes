

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:quotes/Views/home.dart';

class GoogleSignInProvider extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();

  GoogleSignInAccount? _user;

  GoogleSignInAccount get user => _user!;

  Future googleSignin() async {
    final googleUser = await googleSignIn.signIn();
    if (googleUser == null) return;
    _user = googleUser;

    final googleAuth = await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    await FirebaseAuth.instance.signInWithCredential(credential);

    notifyListeners();
  }

    

  // Future logout() async {
  //   await googleSignIn.disconnect();
  //   FirebaseAuth.instance.signOut();

  //   notifyListeners();
  // }
//   void handleLogin() async {
//    GoogleSignInProvider user = await googleSignin();
//    // Here signInWithGoogle() is your defined function!
//    if(user != null){
//       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => Home(),),);
//    }
//    else{
//       // Something Wrong!
//    }
// }
}
