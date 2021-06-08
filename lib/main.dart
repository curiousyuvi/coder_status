import 'package:codersstatus/colorscheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'mybadgesscreen.dart';
import 'signinscreen.dart';
import 'registerscreen.dart';

void main() => runApp(myApp());

class myApp extends StatelessWidget {
  const myApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          accentColor: colorschemeclass.primarygreen,
          primaryColor: colorschemeclass.primarygreen,
      scaffoldBackgroundColor: colorschemeclass.dark,
      textTheme: TextTheme(bodyText1: TextStyle(fontFamily: 'young',color: Colors.white),headline1: TextStyle(fontFamily: 'young',color: Colors.white))),
      home: enternamescreen(),
    );
  }
}
