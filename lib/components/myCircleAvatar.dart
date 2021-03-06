import 'package:flutter/material.dart';
import 'package:coder_status/components/colorscheme.dart';

//ignore: must_be_immutable
class MyCircleAvatar extends StatelessWidget {
  Image avatarimage;
  MyCircleAvatar(this.avatarimage);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: ColorSchemeClass.primarygreen, blurRadius: 20)
          ],
          border: Border.all(color: ColorSchemeClass.primarygreen, width: 5),
          shape: BoxShape.circle,
          image:
              DecorationImage(fit: BoxFit.fitWidth, image: avatarimage.image)),
    );
  }
}
