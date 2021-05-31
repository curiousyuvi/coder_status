import 'package:codersstatus/colorscheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'mybadgesscreen.dart';

void main() => runApp(myApp());

class myApp extends StatelessWidget {
  const myApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: mybadgesscreen(),
    );
  }
}


