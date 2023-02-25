import 'package:flutter/material.dart';
import 'package:quotes/constants.dart';



class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    required this.text,
    required this.press,
  });
  final String text;
  final press;
  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: press,
        title: Text(
          text,
          style: kdrawerTextStyle,
        ));
  }
}