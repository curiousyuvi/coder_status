import 'package:codersstatus/firebase_layer/authenticate.dart';
import 'package:codersstatus/components/colorscheme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:splashscreen/splashscreen.dart';
import 'homescreen.dart';
import 'signinscreen.dart';

Future main() async {
  await WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(myApp());
}

class myApp extends StatelessWidget {
  const myApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          accentColor: colorschemeclass.primarygreen,
          primaryColor: colorschemeclass.primarygreen,
          scaffoldBackgroundColor: colorschemeclass.dark,
          textTheme: TextTheme(
              bodyText1: TextStyle(fontFamily: 'young', color: Colors.white),
              headline1: TextStyle(fontFamily: 'young', color: Colors.white))),
      home: SplashScreen(
        seconds: 3,
        navigateAfterSeconds: Authenticate(),
        imageBackground: AssetImage('images/matrix_gif.gif'),
        photoSize: 120,
        image: Image(
          image: AssetImage('images/appiconnoback.png'),
        ),
        backgroundColor: colorschemeclass.dark,
      ),
    );
  }
}
