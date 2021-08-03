import 'package:flutter/material.dart';
import 'package:codersstatus/components/colorscheme.dart';

class MyOtherCircleAvatar extends StatelessWidget {
  Image avatarimage;
  MyOtherCircleAvatar(this.avatarimage);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border.all(color: ColorSchemeClass.lightgrey, width: 2),
          shape: BoxShape.circle,
          image:
              DecorationImage(fit: BoxFit.fitWidth, image: avatarimage.image)),
    );
  }
}
