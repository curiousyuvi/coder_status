import 'package:codersstatus/colorscheme.dart';
import 'package:codersstatus/entercodernamescreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

void main() => runApp(
      MaterialApp(
        home: enternamescreen(),
      ),
    );

class enternamescreen extends StatefulWidget {
  const enternamescreen({Key key}) : super(key: key);

  @override
  _enternamescreenState createState() => _enternamescreenState();
}

class _enternamescreenState extends State<enternamescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorschemeclass.vdarkgreen,
      body: SafeArea(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration:
                  BoxDecoration(color: colorschemeclass.greygreen, boxShadow: [
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
                    decoration: InputDecoration(hintText: 'Your Full Name'),
                  )),
                  SizedBox(
                    width: 30,
                  ),
                  FlatButton(
                    color: colorschemeclass.ongreygreen,
                    height: double.infinity,
                    onPressed: () {
                      print("button pressed!");
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return entercodernamescreen();
                      }));
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
