import 'package:codersstatus/components/colorscheme.dart';
import 'package:flutter/material.dart';

class myAvatarButton extends StatelessWidget {
  Image avatarimage;
  double borderwidth = 2;
  Color bordercolor = Colors.white;

  myAvatarButton(Image avatarimage, bool onoff) {
    this.avatarimage = avatarimage;
    if (onoff) {
      bordercolor = colorschemeclass.primarygreen;
      borderwidth = 4;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 60,
        width: 60,
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
      ),
    );
  }
}
