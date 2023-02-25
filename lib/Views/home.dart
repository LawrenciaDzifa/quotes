import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:quotes/Authenticate_Views/login.dart';
import 'package:quotes/Authenticate_Views/register.dart';
import 'package:quotes/Provider/google_signin.dart';
import 'package:quotes/Views/category_grid.dart';
import 'package:quotes/Views/welcome.dart';
import 'package:quotes/Widgets/drawer_list_tile.dart';
import 'package:quotes/constants.dart';
import 'package:quotes/Models/user.dart';

class Home extends StatefulWidget {
  //  AuthCredential credential;
  // Home({required this.credential});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    initUser();
  }

  initUser() {
    final user = FirebaseAuth.instance.currentUser;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // Access user credentials using widget.credential
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      //extendBodyBehindAppBar: true,
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                color: Color(0xfffcadeed),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(user?.photoURL ?? ''),
                    radius: 40,
                  ),
                  Text(
                    user?.displayName ?? '',
                    style: kdrawerTextStyle,
                  ),
                  Text(
                    user?.email ?? '',
                    style: kdrawerTextStyle,
                  )
                ],
              ),
            ),
            DrawerListTile(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Signup(),
                  ),
                );
              },
              text: 'Login',
            ),
            DrawerListTile(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Login(),
                  ),
                );
              },
              text: 'Saved Quotes',
            ),
            DrawerListTile(text: 'Bookmarks', press: () {}),
            DrawerListTile(
              text: 'Sign Out',
              press: () {
                GoogleSignInProvider().signOut(context);
              },
            )
          ],
        ),
      ),
      appBar: AppBar(
          // leading: Icon((Icons.menu)),
          ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: AllCategory(),
      ),
    );
  }
}
