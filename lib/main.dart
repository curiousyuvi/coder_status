import 'package:codersstatus/components/colorscheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:splashscreen/splashscreen.dart';
import 'mybadgesscreen.dart';
import 'registernamescreen.dart';
import 'signinscreen.dart';

void main() => runApp(myApp());

class myApp extends StatelessWidget {
  const myApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      theme: ThemeData(
          accentColor: colorschemeclass.primarygreen,
          primaryColor: colorschemeclass.primarygreen,
          scaffoldBackgroundColor: colorschemeclass.dark,
          textTheme: TextTheme(
              bodyText1: TextStyle(fontFamily: 'young', color: Colors.white),
              headline1: TextStyle(fontFamily: 'young', color: Colors.white))),
      home: SplashScreen(
        seconds: 2,
        navigateAfterSeconds: signinscreen(),
        photoSize: 120,
        image: Image(
          image: AssetImage('images/appiconnoback.png'),
        ),
        backgroundColor: colorschemeclass.dark,
      ),
    );
  }
}
