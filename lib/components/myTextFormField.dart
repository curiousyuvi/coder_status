import 'package:flutter/material.dart';
import 'colorscheme.dart';
import 'constants.dart';

class myTextEormField extends StatelessWidget {
  Icon tficon;
  String tfhintText;
  bool isobscure;
  Function onchangedfunction;
  TextInputType textinputtype;
  Function validation;
  Color bordercolor;

  myTextEormField(
      Icon tficon,
      String tfhintText,
      bool isobscure,
      Function onchangedfunction,
      TextInputType textinputtype,
      Function validation,
      [Color bordercolor = colorschemeclass.primarygreen]) {
    this.tficon = tficon;
    this.tfhintText = tfhintText;
    this.isobscure = isobscure;
    this.onchangedfunction = onchangedfunction;
    this.textinputtype = textinputtype;
    this.validation = validation;
    this.bordercolor = bordercolor;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: TextFormField(
        validator: validation,
        onChanged: onchangedfunction,
        keyboardType: textinputtype,
        cursorColor: bordercolor,
        obscureText: isobscure,
        style: TextStyle(
            color: Colors.white,
            fontFamily: 'young',
            fontSize: 15,
            fontWeight: FontWeight.normal),
        decoration: myInputDecoration.copyWith(
          hintText: tfhintText,
          prefixIcon: tficon,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: bordercolor, width: 2)),
        ),
      ),
    );
  }
}
