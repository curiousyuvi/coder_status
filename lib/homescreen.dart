import 'package:codersstatus/components/colorscheme.dart';
import 'package:codersstatus/components/myButton.dart';
import 'package:codersstatus/logoutuser.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'drawer.dart';
import 'dart:math';
import 'components/colorscheme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() => runApp(MaterialApp(
      home: homescreen(),
    ));

class homescreen extends StatefulWidget {
  const homescreen({Key key}) : super(key: key);

  @override
  _homescreenState createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage('images/appiconnoback.png'),
            ),
            myButton(false, 'Log Out', () {
              logout(context);
            })
          ],
        ),
      ),
    );
  }
}
