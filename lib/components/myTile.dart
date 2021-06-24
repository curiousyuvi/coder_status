import 'package:flutter/material.dart';

class myTile extends StatelessWidget {
  AssetImage tileimage;
  Color tilecolor;
  String tilestring;
  myTile(AssetImage tileimage, Color tilecolor, String tilestring) {
    this.tileimage = tileimage;
    this.tilecolor = tilecolor;
    this.tilestring = tilestring;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
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
              Text(
                tilestring,
                style: TextStyle(
                  color: tilecolor,
                  fontFamily: 'young',
                  fontSize: MediaQuery.of(context).size.height * 0.0253,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          )),
        ),
      ],
    );
  }
}
