import 'package:flutter/material.dart';
import 'package:quotes/Authenticate_Views/login.dart';
import 'package:quotes/Authenticate_Views/register.dart';
import 'package:quotes/constants.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Color(0xffcadeed),

      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg.jpeg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.7), BlendMode.darken)
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage('assets/images/applogo.png'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Get',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w500,
                    color: Color(0xffcadeed),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Motivated!',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w500,
                    color: Color(0xfff5d5c5),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ClickButton(press: (){Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Login()));}, text: 'Login',),
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
                ClickButton(press: (){Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Signup()));}, text: 'Signup',),
              ],
            ),
          ],
        ),
      ),
      
    );
  }
}

class ClickButton extends StatelessWidget {
  const ClickButton({
    required this.text,required this.press,
  }) ;
  final String text;
  final  press;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: press,
      style: OutlinedButton.styleFrom(
        side: BorderSide(
          color: Color(0xffcadeed),
        ),
        backgroundColor: text=='Login'?Color.fromARGB(0, 202, 222, 237):Color(0xfff5d5c5),
        padding:
            EdgeInsets.symmetric(vertical: 10, horizontal: 30),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w400,
          color: text=='Login'?Color(0xffcadeed):Color(0xff000000),
        ),
      ),
    );
  }
}


