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
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Color(0xffcadeed),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage('assets/images/applogo.png'),
            ),
          ],
        ),
      ),
      bottomSheet: BottomSheetWidget(
        onClickedLogin: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Login()));
        },
        onCLickedSignup: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Signup()));
        },
      ),
    );
  }
}

class BottomSheetWidget extends StatelessWidget {
  final onClickedLogin;
  final onCLickedSignup;

  const BottomSheetWidget({this.onClickedLogin, this.onCLickedSignup});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      child: Container(
        clipBehavior: Clip.hardEdge,
        padding: EdgeInsets.all(40.0),
        height: MediaQuery.of(context).size.height / 3.5,
        decoration: BoxDecoration(
          color: Color(0xffdeded5),
          borderRadius: new BorderRadius.only(
            topLeft: const Radius.circular(25.0),
            topRight: const Radius.circular(25.0),
          ),
        ),
        child: Column(
          children: [
            Text(
              'Get Motivated!',
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'We have a lot of quotes for you',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  onPressed: onClickedLogin,
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                      color: Color.fromARGB(255, 237, 215, 202),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Color.fromARGB(255, 237, 215, 202),
                    ),
                  ),
                ),
                kwelcomeSizedBox_w20,
                OutlinedButton(
                  onPressed: onCLickedSignup,
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                      color: Color(0xffcadded),
                    ),
                    backgroundColor: Color(0xffcadeed),
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Signup',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff000000),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
