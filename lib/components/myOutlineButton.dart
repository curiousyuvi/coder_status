import 'package:flutter/material.dart';
import 'colorscheme.dart';

class MyOutlineButton extends StatelessWidget {
  Function dofunction;
  bool prominent;
  Color buttoncolor;
  Color titlecolor;
  String title;
  IconData iconData;
  MyOutlineButton(Color buttoncolor, String title, Function dofunction,
      [IconData iconData = null]) {
    this.prominent = prominent;
    this.title = title;
    this.dofunction = dofunction;
    titlecolor = buttoncolor;
    this.buttoncolor = buttoncolor;
    this.iconData = iconData;
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              iconData == null
                  ? SizedBox()
                  : Row(
                      children: [
                        Icon(
                          iconData,
                          color: buttoncolor,
                          size: MediaQuery.of(context).size.height * 0.03,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.height * 0.025,
                        )
                      ],
                    ),
              Text(
                title,
                textAlign: TextAlign.center,
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
