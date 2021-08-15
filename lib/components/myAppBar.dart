import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:codersstatus/components/colorscheme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//Add below as parent to myAppBar :
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
        child: Center(
          child: FaIcon(FontAwesomeIcons.angleLeft,
              size: MediaQuery.of(context).size.height * 0.05,
              color: ColorSchemeClass.lightgrey),
        ),
      ),
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

class MyAppBarWithBackAndDone extends StatelessWidget {
  String title;
  Function function;
  MyAppBarWithBackAndDone(String title, Function function) {
    this.title = title;
    this.function = function;
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorSchemeClass.dark,
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Center(
          child: FaIcon(FontAwesomeIcons.angleLeft,
              size: MediaQuery.of(context).size.height * 0.05,
              color: ColorSchemeClass.lightgrey),
        ),
      ),
      actions: [
        GestureDetector(
          onTap: function,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.height * 0.01),
            child: Center(
              child: FaIcon(FontAwesomeIcons.check,
                  size: MediaQuery.of(context).size.height * 0.05,
                  color: ColorSchemeClass.primarygreen),
            ),
          ),
        )
      ],
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
