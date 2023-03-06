import 'package:flutter/material.dart';

class ClickButton extends StatelessWidget {
  const ClickButton({
    required this.text,
    required this.press,
  });
  final String text;
  final press;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: press,
      style: OutlinedButton.styleFrom(
        side: BorderSide(
          width: text == 'Login' ? 2 : 0,
          // strokeAlign: ,
          color: Color(0xffcadeed),
        ),
        backgroundColor: text == 'Login'
            ? Color.fromARGB(0, 202, 222, 237)
            : Color(0xfff5d5c5),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w500,
          color: text == 'Login' ? Color(0xffcadeed) : Color(0xff000000),
        ),
      ),
    );
  }
}
