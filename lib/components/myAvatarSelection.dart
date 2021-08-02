import 'package:codersstatus/components/colorscheme.dart';
import 'package:flutter/material.dart';

class myAvatarSelection extends StatelessWidget {
  Image avatarimage;
  double borderwidth = 2;
  Color bordercolor = colorschemeclass.lightgrey;

  myAvatarSelection(Image avatarimage, bool onoff) {
    this.avatarimage = avatarimage;
    if (onoff) {
      bordercolor = colorschemeclass.primarygreen;
      borderwidth = 4;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(MediaQuery.of(context).size.height * 0.01),
      height: MediaQuery.of(context).size.height * 0.09,
      width: MediaQuery.of(context).size.height * 0.09,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: bordercolor.withOpacity(0.5),
              blurRadius: borderwidth,
            )
          ],
          border: Border.all(color: bordercolor, width: borderwidth),
          shape: BoxShape.circle,
          image: DecorationImage(
            image: avatarimage.image,
          )),
    );
  }
}