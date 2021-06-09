import 'package:flutter/material.dart';
import 'colorscheme.dart';

class coderstatusheading extends StatelessWidget {
  const coderstatusheading({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      children: [
        Text(
          'CODER',
          style: TextStyle(
              fontFamily: 'young',
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 50),
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          'STATUS',
          style: TextStyle(
              fontFamily: 'young',
              color: colorschemeclass.primarygreen,
              fontWeight: FontWeight.bold,
              fontSize: 50,
              shadows: [
                Shadow(
                    blurRadius: 5,
                    color: colorschemeclass.primarygreen
                        .withOpacity(0.7),
                    offset: Offset(5.0, 0)),
                Shadow(
                    blurRadius: 5,
                    color: colorschemeclass.primarygreen
                        .withOpacity(0.7),
                    offset: Offset(-5.0, 0)),
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
}