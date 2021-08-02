import 'package:flutter/material.dart';

class MyTile extends StatelessWidget {
  AssetImage tileimage;
  Color tilecolor;
  String tilestring;
  MyTile(AssetImage tileimage, Color tilecolor, String tilestring) {
    this.tileimage = tileimage;
    this.tilecolor = tilecolor;
    this.tilestring = tilestring;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.height * 0.0076,
                vertical: MediaQuery.of(context).size.height * 0.0153),
            height: MediaQuery.of(context).size.height * 0.1692,
            width: MediaQuery.of(context).size.height * 0.1353,
            child: Image(
              image: tileimage,
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.1692,
            width: MediaQuery.of(context).size.height * 0.1353,
            child: Center(
                child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.124),
                Text(tilestring,
                    style: TextStyle(
                        color: tilecolor,
                        fontFamily: 'young',
                        fontSize: MediaQuery.of(context).size.height * 0.0253,
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
              ],
            )),
          ),
        ],
      ),
    );
  }
}
