import 'package:flutter/material.dart';
import 'package:codersstatus/components/colorscheme.dart';

class myCircleAvatar extends StatelessWidget {
  const myCircleAvatar({
    Key key,
    @required this.avatarimage,
  }) : super(key: key);

  final Image avatarimage;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: colorschemeclass.primarygreen, blurRadius: 20)
          ],
          border: Border.all(color: colorschemeclass.primarygreen, width: 5),
          shape: BoxShape.circle,
          image:
              DecorationImage(fit: BoxFit.fitWidth, image: avatarimage.image)),
    );
  }
}
