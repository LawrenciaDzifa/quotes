import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class RedirectionPage extends StatefulWidget {
  @override
  _RedirectionPageState createState() => _RedirectionPageState();
}

class _RedirectionPageState extends State<RedirectionPage> {
  GoogleSignInAccount _currentUser;

  @override
  void initState() {
    super.initState();
    _initCurrentUser();
  }

  void _initCurrentUser() async {
    _currentUser = await GoogleSignIn().currentUser;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (_currentUser == null) {
      return Container();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Redirection Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('You have successfully logged in as:'),
            Text(_currentUser.displayName),
          ],
        ),
      ),
    );
  }
}
