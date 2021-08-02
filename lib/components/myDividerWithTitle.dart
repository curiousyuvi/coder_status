import 'package:flutter/material.dart';
import 'colorscheme.dart';

class MyDividerWithTitle extends StatelessWidget {
  String title;
  MyDividerWithTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Divider(
            color: colorschemeclass.darkgrey,
            endIndent: MediaQuery.of(context).size.width * 0.02,
          ),
        ),
        Text(
          title,
          style: TextStyle(
              color: colorschemeclass.darkgrey,
              fontFamily: 'young',
              fontSize: MediaQuery.of(context).size.height * 0.03),
        ),
        Expanded(
          flex: 14,
          child: Divider(
            color: colorschemeclass.darkgrey,
            indent: MediaQuery.of(context).size.width * 0.02,
          ),
        ),
      ],
    );
  }
}
