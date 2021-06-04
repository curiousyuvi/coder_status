import 'package:codersstatus/colorscheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'drawer.dart';
import 'dart:math';
import 'colorscheme.dart';

class mybadgesscreen extends StatefulWidget {
  const mybadgesscreen({Key key}) : super(key: key);

  @override
  mybadgesscreenState createState() => mybadgesscreenState();
}

class mybadgesscreenState extends State<mybadgesscreen> {
  double value = 0;

  //badge widget template
  Widget getcoderbadge(String asset, String set) {
    return SafeArea(
      child: Container(
        height: 75,
        width: 75,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(image: AssetImage(asset + set)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        //gradient background color
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [
              colorschemeclass.vdarkgreen,
              colorschemeclass.greygreen,
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          )),
        ),
        //Drawer
        drawer(),

        //Animation code for animated drawer and its child is the "MY BADGES" page
        TweenAnimationBuilder(
            tween: Tween<double>(begin: 0, end: value),
            duration: Duration(milliseconds: 500),
            builder: (_, double val, __) {
              return (Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..setEntry(0, 3, 200 * val)
                  ..rotateY((pi / 6) * val),
                child: Scaffold(
                  backgroundColor: colorschemeclass.vdarkgreen,
                  body: SafeArea(
                    child: Flexible(
                      child: Container(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            //"MY BADGES" Heading
                            Padding(
                              padding: const EdgeInsets.all(1.0),
                              child: Center(
                                  child: Text(
                                'My Badges',
                                style: TextStyle(
                                    fontSize: 40,
                                    color: Colors.white,
                                    fontFamily: 'young'),
                              )),
                            ),
                            //Avatar of the coder
                            Padding(
                              padding: const EdgeInsets.all(24.0),
                              child: Container(
                                height: 150,
                                width: 150,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: colorschemeclass.brigthgreen
                                            .withOpacity(0.7),
                                        spreadRadius: 10,
                                        blurRadius: 40)
                                  ],
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: colorschemeclass.brigthgreen,
                                      width: 5),
                                  image: DecorationImage(
                                    image: AssetImage(
                                      'images/examplecoder.jpg',
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
                                    fontSize: 25,
                                    color: Colors.white,
                                    fontFamily: 'young'),
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
                                    '1675 pts',
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
                                  getcoderbadge('images/codechef', 'off.jpg'),
                                  getcoderbadge('images/codeforces', 'off.jpg'),
                                  getcoderbadge('images/leetcode', 'off.jpg')
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  getcoderbadge('images/IB', 'off.jpg'),
                                  getcoderbadge('images/spoj', 'off.jpg'),
                                  getcoderbadge('images/atcoder', 'off.jpg'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ));
            }),

        //gesture detector for drawer
        GestureDetector(
          onHorizontalDragUpdate: (e) {
            if (e.delta.dx > 0) {
              setState(() {
                value = 1;
              });
            } else {
              setState(() {
                value = 0;
              });
            }
          },
        )
      ]),
    );
  }
}
