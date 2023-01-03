import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:quotes/Authenticate_Views/login.dart';
import 'package:quotes/Authenticate_Views/register.dart';
import 'package:quotes/Views/category_grid.dart';
import 'package:quotes/constants.dart';

import 'package:quotes/Models/user.dart';

class Home extends StatelessWidget {
  

  Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //  final user = Provider.of<User>(context);
    // final  photoUrl = user.photoUrl;
    final googleSignIn = GoogleSignIn();
    final photoUrl = googleSignIn.currentUser?.photoUrl;
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
              child: CircleAvatar(
               backgroundImage: (photoUrl == null) ? null : NetworkImage(photoUrl),
                radius: 50,
              ),
            ),
            ListTile(
              title: Text(
                'Settings',
                style: kdrawerTextStyle,
              ),
              onTap: () {
                // Update the state of the app.
                // ...
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Signup(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text(
                'Saved',
                style: kdrawerTextStyle,
              ),
              onTap: () {
                // Update the state of the app.
                // ...
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Login(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text(
                'Bookmarks',
                style: kdrawerTextStyle,
              ),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: Text(
                'Sign out',
                style: kdrawerTextStyle,
              ),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
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
