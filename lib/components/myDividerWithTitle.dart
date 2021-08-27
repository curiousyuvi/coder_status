import 'package:flutter/material.dart';
import 'colorscheme.dart';

//ignore: must_be_immutable
class MyDividerWithTitle extends StatelessWidget {
  String title;
  MyDividerWithTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 1,
          child: Divider(
            color: ColorSchemeClass.darkgrey,
            endIndent: MediaQuery.of(context).size.width * 0.02,
          ),
        ),
        Text(
          title,
          style: TextStyle(
              color: ColorSchemeClass.darkgrey,
              fontFamily: 'young',
              fontSize: MediaQuery.of(context).size.height * 0.025),
        ),
        Flexible(
          flex: 14,
          child: Divider(
            color: ColorSchemeClass.darkgrey,
            indent: MediaQuery.of(context).size.width * 0.02,
          ),
        ),
      ],
    );
  }
}

//ignore: must_be_immutable
class MyMidDividerWithTitle extends StatelessWidget {
  String title;
  MyMidDividerWithTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 1,
          child: Divider(
            color: ColorSchemeClass.darkgrey,
            endIndent: MediaQuery.of(context).size.width * 0.02,
          ),
        ),
        Text(
          title,
          style: TextStyle(
              color: ColorSchemeClass.darkgrey,
              fontFamily: 'young',
              fontSize: MediaQuery.of(context).size.height * 0.025),
        ),
        Flexible(
          flex: 1,
          child: Divider(
            color: ColorSchemeClass.darkgrey,
            indent: MediaQuery.of(context).size.width * 0.02,
          ),
        ),
      ],
    );
  }
}
