import 'package:flutter/material.dart';
import 'colorscheme.dart';

//Add this as parent to myAppBar :
//PreferredSize( preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * 0.12),

class myAppBarWithBack extends StatelessWidget {
  String title;
  myAppBarWithBack(String title) {
    this.title = title;
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: colorschemeclass.dark,
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child:
            Icon(Icons.arrow_back_ios_sharp, color: colorschemeclass.lightgrey),
      ),
      centerTitle: true,
      title: Text(
        title,
        style: TextStyle(
            color: colorschemeclass.lightgrey,
            fontFamily: 'young',
            fontWeight: FontWeight.bold,
            fontSize: MediaQuery.of(context).size.height * 0.035),
      ),
    );
  }
}
