import 'package:codersstatus/coderavatarwidget.dart';
import 'package:codersstatus/coderbadgewidget.dart';
import 'package:codersstatus/colorscheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: colorschemeclass.vdarkgeen,
        body: coderbadges(),
      ),
    ),
  );
}

class coderbadges extends StatefulWidget {
  const coderbadges({Key key}) : super(key: key);

  @override
  _coderbadgesState createState() => _coderbadgesState();
}

class _coderbadgesState extends State<coderbadges>
    with SingleTickerProviderStateMixin {
  void onclickavatar() async {}

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  CupertinoIcons.back,
                  color: Colors.white,
                ),
                //"Badges" Heading
                Text(
                  'Badges',
                  style: TextStyle(
                      color: Colors.white, fontSize: 35, fontFamily: 'young'),
                ),
                SizedBox(
                  width: 20,
                )
              ],
            ),
            //Avatar of the coder
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: GestureDetector(
                onTap: () {
                  onclickavatar();
                },
                child: Container(
                  height: 140,
                  width: 140,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: colorschemeclass.brigthgreen.withOpacity(0.7),
                          spreadRadius: 10,
                          blurRadius: 40)
                    ],
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: colorschemeclass.brigthgreen, width: 5),
                    image: DecorationImage(
                      image: AssetImage('images/examplecoder.jpg'),
                    ),
                  ),
                ),
              ),
            ),
            //coder full name
            Padding(
              padding: const EdgeInsets.all(1.0),
              child: Center(
                  child: Text(
                'Yuvraj Singh',
                style: TextStyle(
                    fontSize: 25, color: Colors.white, fontFamily: 'young'),
              )),
            ),

            //codername
            Padding(
              padding: const EdgeInsets.all(1.0),
              child: Center(
                child: Text(
                  '@curiousyuvi',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white.withAlpha(900),
                      fontFamily: 'young'),
                ),
              ),
            ),

            //coderpoints
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '8122 pts',
                    style: TextStyle(
                        fontSize: 40,
                        color: colorschemeclass.brigthgreen,
                        fontFamily: 'young'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Icon(
                      CupertinoIcons.arrowtriangle_up_fill,
                      color: colorschemeclass.brigthgreen,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  coderbadgewidgetclass.getcoderbadge(
                    AssetImage('images/codechefon.jpg'),AssetImage('images/codechefon.jpg'),
                  ),
                  coderbadgewidgetclass.getcoderbadge(
                    AssetImage('images/codeforceson.jpg'),AssetImage('images/codeforceson.jpg'),
                  ),
                  coderbadgewidgetclass.getcoderbadge(
                    AssetImage('images/leetcodeon.jpg'),  AssetImage('images/leetcodeon.jpg'),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  coderbadgewidgetclass.getcoderbadge(
                    AssetImage('images/IBoff.jpg'),  AssetImage('images/IBoff.jpg'),
                  ),
                  coderbadgewidgetclass.getcoderbadge(
                    AssetImage('images/spojlogooff.jpg'), AssetImage('images/spojlogooff.jpg'),
                  ),
                  coderbadgewidgetclass.getcoderbadge(
                    AssetImage('images/atcoderoff.jpg'),AssetImage('images/atcoderoff.jpg'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
