import 'package:flutter/material.dart';
import 'package:quotes/Views/category_grid.dart';
import 'package:quotes/constants.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //extendBodyBehindAppBar: true,
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: CircleAvatar(
                  child: ClipOval(
                      child:
                          Image(image: AssetImage('assets/images/dzifa.jpg')))),
            ),
            ListTile(
              title: Text(
                'Settings',
                style: kdrawerTextStyle,
              ),
              onTap: () {
                // Update the state of the app.
                // ...
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
