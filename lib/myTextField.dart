import 'package:flutter/material.dart';
import 'colorscheme.dart';
import 'constants.dart';

class myTextField extends StatelessWidget {
  Icon tficon;
  String tfhintText;
  myTextField(Icon tficon,String tfhintText){
    this.tficon=tficon;
    this.tfhintText=tfhintText;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: TextField(
        cursorColor: colorschemeclass.primarygreen,
        obscureText: false,
        style: TextStyle(
            color: Colors.white,
            fontFamily: 'young',
            fontSize: 15,
            fontWeight: FontWeight.normal),
        decoration: myInputDecoration.copyWith(
            hintText: tfhintText, prefixIcon: tficon),
      ),
    );
  }
}