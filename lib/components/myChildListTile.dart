import 'package:flutter/material.dart';
import 'colorscheme.dart';

class MyChildListTile extends StatelessWidget {
  Icon leadingicon;
  String title;
  Color fontcolor;
  MyChildListTile(Icon leadingicon, String title,
      [Color fontcolor = ColorSchemeClass.dark]) {
    this.leadingicon = leadingicon;
    this.title = title;
    this.fontcolor = fontcolor;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
      child: ListTile(
        tileColor: ColorSchemeClass.lightgrey,
        leading: leadingicon,
        title: Text(
          title,
          style: TextStyle(
              color: fontcolor,
              fontSize: MediaQuery.of(context).size.height * 0.02,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
