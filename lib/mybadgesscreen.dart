import 'package:codersstatus/colorscheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

class mybadgesscreen extends StatefulWidget {
  const mybadgesscreen({Key key}) : super(key: key);

  @override
  mybadgesscreenState createState() => mybadgesscreenState();
}

class mybadgesscreenState extends State<mybadgesscreen> {
  String onoff = 'off.jpg';

  //badge widget template
  Widget getcoderbadge(String asset, String set) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(image: AssetImage(asset + set)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorschemeclass.vdarkgreen,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.menu,
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
                padding: const EdgeInsets.all(24.0),
                child: Container(
                  height: 200,
                  width: 200,
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
    );
  }
}
