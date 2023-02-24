import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class User {
  final  name;
  final  email;
  final  photoUrl;

  User({ this.name,  this.email,  this.photoUrl });
}

class AuthProvider with ChangeNotifier {
  late User _user;

  User get user => _user;

  void setUser(User user) {
    _user = user;
    notifyListeners();
  }
  

  Future<User> signInWithGoogle() async {
    final googleSignIn = GoogleSignIn();
    final googleUser = await googleSignIn.signIn();
    if (googleUser != null) {
      final user = User(name: googleUser.displayName.toString(), email: googleUser.email, photoUrl: googleUser.photoUrl.toString());
      setUser(user);
      return user;
    } else {
      throw Exception('Google sign in failed');
    }
  }
}




