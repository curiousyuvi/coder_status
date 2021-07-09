import 'package:flutter/material.dart';
import 'colorscheme.dart';

class myButton extends StatelessWidget {
  Function dofunction;
  bool prominent;
  Color buttoncolor;
  Color titlecolor;
  String title;

  myButton(Color buttoncolor, String title, Function dofunction) {
    this.prominent = prominent;
    this.title = title;
    this.dofunction = dofunction;
    titlecolor = colorschemeclass.lightgrey;
    this.buttoncolor = buttoncolor;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.076,
              width: double.infinity,
              color: buttoncolor.withOpacity(0.3),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Container(
              color: buttoncolor,
              height: MediaQuery.of(context).size.height * 0.07,
              width: double.infinity,
              child: FlatButton(
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
          ),
        ],
      ),
    );
  }
}
