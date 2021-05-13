import 'package:codersstatus/colorscheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'main.dart';

class coderavatarwidgetclass {
  static Widget getcoderavatar(AssetImage coderimage,double animatevalue) {
    return Container(
      height: 140,
      width: 140,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: colorschemeclass.brigthgreen.withOpacity(0.7),
              spreadRadius: 10,
              blurRadius: animatevalue)
        ],
        shape: BoxShape.circle,
        border: Border.all(color: colorschemeclass.brigthgreen, width: 5),
        image: DecorationImage(
          image: coderimage,
        ),
      ),
    );
  }
}
