import 'package:flutter/material.dart';
import 'package:codersstatus/components/colorscheme.dart';

class myFadeInCircleAvatar extends StatelessWidget {
  String imageUrl;
  myFadeInCircleAvatar(String imageUrl) {
    this.imageUrl = imageUrl;
  }

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
          image: DecorationImage(
              fit: BoxFit.fitWidth,
              image: FadeInImage.assetNetwork(
                      placeholder: 'images/avatar1.jpg', image: imageUrl)
                  .image)),
    );
  }
}
