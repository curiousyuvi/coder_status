import 'package:flutter/material.dart';
import 'colorscheme.dart';

class MyOutlineButton extends StatelessWidget {
  Function dofunction;
  bool prominent;
  Color buttoncolor;
  Color titlecolor;
  String title;

  MyOutlineButton(Color buttoncolor, String title, Function dofunction) {
    this.prominent = prominent;
    this.title = title;
    this.dofunction = dofunction;
    titlecolor = buttoncolor;
    this.buttoncolor = buttoncolor;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(color: buttoncolor, width: 3),
            borderRadius: BorderRadius.circular(7)),
        height: MediaQuery.of(context).size.height * 0.076,
        width: double.infinity,
        child: MaterialButton(
          onPressed: dofunction,
          minWidth: double.infinity,
          height: double.infinity,
          child: Text(
            title,
            style: TextStyle(
                color: titlecolor,
                fontFamily: 'young',
                fontWeight: FontWeight.bold,
                fontSize: MediaQuery.of(context).size.height * 0.025),
          ),
        ),
      ),
    );
  }
}
