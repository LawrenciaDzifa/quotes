import 'package:flutter/material.dart';
import 'package:quotes/Authenticate_Views/login.dart';
import 'package:quotes/Authenticate_Views/register.dart';
import 'package:quotes/Widgets/click_button.dart';
import 'package:quotes/constants.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

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
                  Colors.black.withOpacity(0.7), BlendMode.darken)),
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
            kwelcomeSizedBox_h30,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedTextKit(
                  animatedTexts: [
                    TyperAnimatedText(
                      'Get Motivated!',
                      textStyle: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w500,
                        color: Color(0xffcadeed),
                      ),
                      speed: Duration(milliseconds:150),
                    ),
                  ],
                  totalRepeatCount: 20,
                ),
              ],
            ),
            kwelcomeSizedBox_h30,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ClickButton(
                      press: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Login()));
                      },
                      text: 'Login',
                    ),
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
                ClickButton(
                  press: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Signup()));
                  },
                  text: 'Signup',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
