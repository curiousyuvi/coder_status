import 'package:codersstatus/colorscheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

void main() => runApp(
      MaterialApp(
        home: Scaffold(
          backgroundColor: colorschemeclass.dark,
          body: drawer(),
        ),
      ),
    );

class drawer extends StatefulWidget {
  const drawer({Key key}) : super(key: key);

  @override
  _drawerState createState() => _drawerState();
}

class _drawerState extends State<drawer> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: 200,
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            DrawerHeader(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 50.0,
                    backgroundImage: AssetImage('images/examplecoder.jpg'),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'Yuvraj Singh',
                    style: TextStyle(
                        fontSize: 20, color: Colors.white, fontFamily: 'young'),
                  ),


                ],
              ),
            )
            , Expanded(
                child: ListView(
                  children: [
                    ListTile(
                      leading: Icon(
                        Icons.apps_rounded,
                        color: Colors.white,
                      ),
                      title: Text(
                        'My Badges',
                        style: TextStyle(
                            color: Colors.white, fontFamily: 'young'),
                      ),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.refresh,
                        color: Colors.white,
                      ),
                      title: Text(
                        'Refresh',
                        style: TextStyle(
                            color: Colors.white, fontFamily: 'young'),
                      ),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
