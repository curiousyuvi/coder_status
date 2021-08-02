import 'package:flutter/material.dart';
import 'colorscheme.dart';

//Add this as parent to myAppBar :
//PreferredSize( preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * 0.12),

class MyAppBarWithBack extends StatelessWidget {
  String title;
  MyAppBarWithBack(String title) {
    this.title = title;
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorSchemeClass.dark,
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child:
            Icon(Icons.arrow_back_ios_sharp, color: ColorSchemeClass.lightgrey),
      ),
      centerTitle: true,
      title: Text(
        title,
        style: TextStyle(
            color: ColorSchemeClass.lightgrey,
            fontFamily: 'young',
            fontWeight: FontWeight.bold,
            fontSize: MediaQuery.of(context).size.height * 0.035),
      ),
    );
  }
}
