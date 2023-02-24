import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quotes/Authenticate_Views/register.dart';
import 'package:quotes/Provider/google_signin.dart';
import 'package:quotes/Views/home.dart';
import 'package:quotes/constants.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Image.asset(
        //   'assets/images/luv.jpg',
        //   height: MediaQuery.of(context).size.height,
        //   width: MediaQuery.of(context).size.width,
        //   fit: BoxFit.cover,
        // ),
        Container(
          decoration: BoxDecoration(
            color: Color(0xffcadeed),
          ),
        ),
        Scaffold(
          extendBodyBehindAppBar: true,
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Center(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 25),
                decoration: BoxDecoration(
                  color: Color.fromARGB(99, 224, 238, 251),
                  borderRadius: BorderRadius.circular(10),
                ),
                height: MediaQuery.of(context).size.height / 2,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Log in to your account',
                        style: kauthTitleTextStyle,
                      ),
                      OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                            side: BorderSide(
                              color: Color.fromARGB(255, 81, 147, 247),
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: 18, horizontal: 20),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        child: Row(
                          children: [
                            Image(
                              image: AssetImage('assets/images/facebook.png'),
                            ),
                            kauthSizedBox_w10,
                            Text(
                              'Continue with Facebook',
                              style: kauthTextStyle_f,
                            ),
                          ],
                        ),
                      ),
                      OutlinedButton(
                        onPressed: () async{
                          await GoogleSignInProvider().signInWithGoogle(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return Home( );
                              },
                            ),
                          );
                        },
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(
                            color: Color.fromARGB(255, 225, 7, 7),
                          ),
                          padding: EdgeInsets.symmetric(
                              vertical: 18, horizontal: 20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image(
                              image: AssetImage('assets/images/google.png'),
                            ),
                            kauthSizedBox_w10,
                            Text(
                              'Continue with Google',
                              style: kauthTextStyle_g,
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don\'t have an acoount?',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return Signup();
                                    },
                                  ),
                                );
                              },
                              child: Text(
                                'Singup',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
