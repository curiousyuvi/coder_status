import 'package:codersstatus/colorscheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'mybadgesscreen.dart';

void main() => runApp(
      MaterialApp(
        home: entercodernamescreen(),
      ),
    );

class entercodernamescreen extends StatefulWidget {
  const entercodernamescreen({Key key}) : super(key: key);

  @override
  _entercodernamescreenState createState() => _entercodernamescreenState();
}

class _entercodernamescreenState extends State<entercodernamescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorschemeclass.dark,
      body: SafeArea(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration:
                  BoxDecoration(color: colorschemeclass.tertiarygreen, boxShadow: [
                BoxShadow(
                  color: Colors.white.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(5, 0), // changes position of shadow
                ),
              ]),
              width: double.infinity,
              height: 75,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(children: [
                  Flexible(
                      child: TextField(
                    decoration: InputDecoration(
                        hintText: 'your_codername or your_username'),
                  )),
                  SizedBox(
                    width: 30,
                  ),
                  MaterialButton(
                    color: colorschemeclass.secondarygreen,
                    height: double.infinity,
                    onPressed: () {
                      print("button pressed!");
                      Navigator.of(context).push(_createRoute());
                    },
                    child: Row(
                      children: [
                        Text(
                          'OK',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontFamily: 'young'),
                        ),
                        Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 15,
                        )
                      ],
                    ),
                  )
                ]),
              ),
            ),
          ),
        ),
      )),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(transitionDuration: Duration(seconds: 1),
    pageBuilder: (context, animation, secondaryAnimation) => mybadgesscreen(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, 1.0);
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
