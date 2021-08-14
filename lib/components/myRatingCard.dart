import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class MyRatingCard extends StatelessWidget {
  AssetImage tileimage;
  Color tilecolor;
  String tilestring;
  MyRatingCard(AssetImage tileimage, Color tilecolor, String tilestring) {
    this.tileimage = tileimage;
    this.tilecolor = tilecolor;
    this.tilestring = tilestring;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Container(
            height: MediaQuery.of(context).size.width * 0.25,
            width: MediaQuery.of(context).size.width * 0.2,
            child: Image(
              image: tileimage,
            ),
          ),
        ),
        Center(
          child: Container(
            height: MediaQuery.of(context).size.width * 0.25,
            width: MediaQuery.of(context).size.width * 0.2,
            child: Center(
                child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.width * 0.19),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(tilestring,
                      style: TextStyle(
                          color: tilecolor,
                          fontFamily: 'young',
                          fontSize: MediaQuery.of(context).size.width * 0.04,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                                // bottomLeft
                                offset: Offset(-1, -1),
                                color: Colors.black.withOpacity(0.3)),
                            Shadow(
                                // bottomRight
                                offset: Offset(1, -1),
                                color: Colors.black.withOpacity(0.3)),
                            Shadow(
                                // topRight
                                offset: Offset(1, 1),
                                color: Colors.black.withOpacity(0.3)),
                            Shadow(
                                // topLeft
                                offset: Offset(-1, 1),
                                color: Colors.black.withOpacity(0.3))
                          ])),
                ),
              ],
            )),
          ),
        ),
        Center(
          child: Container(
              height: MediaQuery.of(context).size.width * 0.25,
              width: MediaQuery.of(context).size.width * 0.2,
              child: RiveAnimation.asset(
                'assets/shine.riv',
                fit: BoxFit.cover,
              )),
        ),
      ],
    );
  }
}
