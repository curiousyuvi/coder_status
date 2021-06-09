import 'package:flutter/material.dart';
import 'colorscheme.dart';
import 'constants.dart';

class myTextEormField extends StatelessWidget {
  Icon tficon;
  String tfhintText;
  bool isobscure;
  Function onchangedfunction;
  TextInputType textinputtype;

  myTextEormField(Icon tficon, String tfhintText, bool isobscure,
      Function onchangedfunction, TextInputType textinputtype) {
    this.tficon = tficon;
    this.tfhintText = tfhintText;
    this.isobscure = isobscure;
    this.onchangedfunction = onchangedfunction;
    this.textinputtype = textinputtype;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: TextFormField(
        onChanged: onchangedfunction,
        keyboardType: textinputtype,
        cursorColor: colorschemeclass.primarygreen,
        obscureText: isobscure,
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
