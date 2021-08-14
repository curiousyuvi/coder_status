import 'package:flutter/material.dart';
import 'colorscheme.dart';

class MyButton extends StatelessWidget {
  Function dofunction;
  bool prominent;
  Color buttoncolor;
  Color titlecolor;
  String title;
  IconData iconData;

  MyButton(Color buttoncolor, String title, Function dofunction,
      [IconData iconData = null, Color titlecolor = Colors.white]) {
    this.prominent = prominent;
    this.title = title;
    this.dofunction = dofunction;
    this.titlecolor = titlecolor;
    this.buttoncolor = buttoncolor;
    this.iconData = iconData;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.02),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: buttoncolor,
            boxShadow: [
              BoxShadow(
                  color: buttoncolor.withOpacity(0.4),
                  offset: Offset(
                    0,
                    MediaQuery.of(context).size.height * 0.007,
                  ),
                  spreadRadius: 0,
                  blurRadius: 0)
            ]),
        height: MediaQuery.of(context).size.height * 0.07,
        width: double.infinity,
        child: MaterialButton(
          onPressed: dofunction,
          minWidth: double.infinity,
          height: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              iconData == null
                  ? SizedBox()
                  : Row(
                      children: [
                        Icon(
                          iconData,
                          color: ColorSchemeClass.lightgrey,
                          size: MediaQuery.of(context).size.height * 0.03,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.height * 0.025,
                        )
                      ],
                    ),
              Text(
                title,
                style: TextStyle(
                    color: titlecolor,
                    fontFamily: 'young',
                    fontSize: MediaQuery.of(context).size.height * 0.025),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
