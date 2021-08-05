import 'package:flutter/material.dart';
import 'package:codersstatus/components/colorscheme.dart';
//Add this as parent to myAppBar :
//PreferredSize( preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * 0.12),

class MyAppBar extends StatelessWidget {
  String title;
  MyAppBar(String title) {
    this.title = title;
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorSchemeClass.dark,
      centerTitle: true,
      title: Text(
        title,
        style: TextStyle(
            color: ColorSchemeClass.lightgrey,
            fontFamily: 'young',
            fontSize: MediaQuery.of(context).size.height * 0.035),
      ),
    );
  }
}
