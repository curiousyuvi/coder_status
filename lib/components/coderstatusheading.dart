import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'colorscheme.dart';

Widget CoderstatusHeading(BuildContext context) {
  return Wrap(
    direction: Axis.horizontal,
    children: [
      Text(
        'CODER',
        style: TextStyle(
            fontFamily: 'young',
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: MediaQuery.of(context).size.height * 0.07),
      ),
      SizedBox(
        width: MediaQuery.of(context).size.width * 0.02,
      ),
      Text(
        'STATUS',
        style: TextStyle(
            fontFamily: 'young',
            color: ColorSchemeClass.primarygreen,
            fontWeight: FontWeight.bold,
            fontSize: MediaQuery.of(context).size.height * 0.07,
            shadows: [
              Shadow(
                  blurRadius: 10,
                  color: ColorSchemeClass.primarygreen.withOpacity(0.2),
                  offset: Offset(5.0, 0)),
              Shadow(
                  blurRadius: 10,
                  color: ColorSchemeClass.primarygreen.withOpacity(0.2),
                  offset: Offset(-5.0, 0)),
              Shadow(
                  blurRadius: 10,
                  color: ColorSchemeClass.primarygreen.withOpacity(0.2),
                  offset: Offset(0, 5.0)),
              Shadow(
                  blurRadius: 10,
                  color: ColorSchemeClass.primarygreen.withOpacity(0.2),
                  offset: Offset(0, -5.0)),
              Shadow(
                  // bottomLeft
                  offset: Offset(-1, -1),
                  color: Colors.white),
              Shadow(
                  // bottomRight
                  offset: Offset(1, -1),
                  color: Colors.white),
              Shadow(
                  // topRight
                  offset: Offset(1, 1),
                  color: Colors.white),
              Shadow(
                  // topLeft
                  offset: Offset(-1, 1),
                  color: Colors.white)
            ]),
      )
    ],
  );
}
