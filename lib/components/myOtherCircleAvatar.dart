import 'package:flutter/material.dart';
import 'package:coder_status/components/colorscheme.dart';

class MyOtherCircleAvatar extends StatelessWidget {
  Image avatarimage;
  Color borderColor;
  MyOtherCircleAvatar(this.avatarimage, this.borderColor);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border.all(color: borderColor, width: 4),
          shape: BoxShape.circle,
          image:
              DecorationImage(fit: BoxFit.fitWidth, image: avatarimage.image)),
    );
  }
}
