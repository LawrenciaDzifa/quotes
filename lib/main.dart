import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quotes/Authenticate_Views/login.dart';
import 'package:quotes/Authenticate_Views/register.dart';
import 'package:quotes/Provider/app_state.dart';
import 'package:quotes/Provider/google_signin.dart';
import 'package:quotes/Views/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:quotes/Views/welcome.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: ((context) => AppState()),
      
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: buildMaterialColor(Color(0xfffcadeed)),
        ),
        home: HomePage(),
      ),
    );
  }
}
class HomePage extends StatelessWidget {
  
  @override
  
  Widget build(BuildContext context) {
    
    final authProvider = Provider.of<GoogleSignInProvider>(context);
    final user = authProvider.user;

    if (user == null) {
      // The user is not signed in
      return Login();
    } else {
      // The user is signed in
      return Home();
    }
  }
}


MaterialColor buildMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = {};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  strengths.forEach((strength) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  });
  return MaterialColor(color.value, swatch);
}
